'use server'

import { createClient } from '@/utils/supabase/server'
import { revalidatePath } from 'next/cache'

export interface BulkBookingRow {
  tempId: string
  building_id: string
  floor_id: string
  resource_id: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  weekdays: number[]
  reason: string
  faculty_name: string
  subject: string
  class_name: string
}

export interface ConflictCheck {
  tempId: string
  conflicts: Array<{
    type: 'overlap_approved' | 'overlap_pending' | 'resource_inactive'
    message: string
    conflictingBookingId?: string
  }>
}

export async function getBuildingsForBulk() {
  const supabase = await createClient()
  
  const { data: buildings, error } = await supabase
    .from('buildings')
    .select('id, name')
    .eq('is_active', true)
    .order('name')
  
  if (error) {
    console.error('Error fetching buildings:', error)
    return { error: 'Failed to fetch buildings' }
  }
  
  return { buildings }
}

export async function getFloorsForBulk(buildingId: string) {
  const supabase = await createClient()
  
  const { data: floors, error } = await supabase
    .from('floors')
    .select('id, floor_number, name')
    .eq('building_id', buildingId)
    .eq('is_active', true)
    .order('floor_number')
  
  if (error) {
    console.error('Error fetching floors:', error)
    return { error: 'Failed to fetch floors' }
  }
  
  return { floors }
}

export async function getResourcesForBulk(floorId: string) {
  const supabase = await createClient()
  
  const { data: resources, error } = await supabase
    .from('resources')
    .select('id, name, type, capacity')
    .eq('floor_id', floorId)
    .eq('is_active', true)
    .order('name')
  
  if (error) {
    console.error('Error fetching resources:', error)
    return { error: 'Failed to fetch resources' }
  }
  
  return { resources }
}

export async function validateBulkBookings(rows: BulkBookingRow[]) {
  const supabase = await createClient()
  const conflicts: ConflictCheck[] = []
  
  for (const row of rows) {
    const rowConflicts: ConflictCheck['conflicts'] = []
    
    // Check if resource exists and is active
    const { data: resource } = await supabase
      .from('resources')
      .select('id, is_active')
      .eq('id', row.resource_id)
      .single()
    
    if (!resource || !resource.is_active) {
      rowConflicts.push({
        type: 'resource_inactive',
        message: 'Resource not found or inactive'
      })
    } else {
      // Check for conflicting approved bookings
      const { data: conflictingBookings } = await supabase
        .from('bookings')
        .select('id, start_date, end_date, start_time, end_time, weekdays')
        .eq('resource_id', row.resource_id)
        .eq('status', 'approved')
        .not('end_date', 'lt', row.start_date)
        .not('start_date', 'gt', row.end_date)
      
      if (conflictingBookings && conflictingBookings.length > 0) {
        for (const conflict of conflictingBookings) {
          // Check weekday intersection
          const hasWeekdayOverlap = row.weekdays.some(day => 
            conflict.weekdays.includes(day)
          )
          
          if (hasWeekdayOverlap) {
            // Check time overlap
            const rowStart = row.start_time
            const rowEnd = row.end_time
            const conflictStart = conflict.start_time
            const conflictEnd = conflict.end_time
            
            if (!(rowEnd <= conflictStart || rowStart >= conflictEnd)) {
              rowConflicts.push({
                type: 'overlap_approved',
                message: `Conflicts with existing booking (${conflictStart}-${conflictEnd})`,
                conflictingBookingId: conflict.id
              })
            }
          }
        }
      }
    }
    
    conflicts.push({
      tempId: row.tempId,
      conflicts: rowConflicts
    })
  }
  
  return { conflicts }
}

export async function createBulkBookings(rows: BulkBookingRow[]) {
  const supabase = await createClient()
  
  try {
    // Get current user
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      return { error: 'Authentication required' }
    }
    
    // Validate user is admin
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()
    
    if (!profile || !['admin', 'super_admin'].includes(profile.role)) {
      return { error: 'Admin access required' }
    }
    
    // Validate all rows first
    const { conflicts } = await validateBulkBookings(rows)
    const hasBlockingConflicts = conflicts.some(c => 
      c.conflicts.some(conf => conf.type !== 'overlap_pending')
    )
    
    if (hasBlockingConflicts) {
      return { error: 'Please resolve all conflicts before submitting', conflicts }
    }
    
    // Prepare booking data
    const bookingData = rows.map(row => ({
      resource_id: row.resource_id,
      user_id: user.id,
      start_date: row.start_date,
      end_date: row.end_date,
      start_time: row.start_time,
      end_time: row.end_time,
      reason: row.reason,
      faculty_name: row.faculty_name || null,
      subject: row.subject,
      class_name: row.class_name,
      weekdays: row.weekdays,
      status: 'approved',
      approved_by: user.id,
      approved_at: new Date().toISOString()
    }))
    
    // Insert bookings
    const { data: bookings, error: insertError } = await supabase
      .from('bookings')
      .insert(bookingData)
      .select()
    
    if (insertError) {
      console.error('Error inserting bookings:', insertError)
      return { error: 'Failed to create bookings' }
    }
    
    revalidatePath('/admin/bookings')
    revalidatePath('/bookings')
    
    return { 
      success: true, 
      bookings,
      message: `Successfully created ${bookings.length} bookings`
    }
    
  } catch (error) {
    console.error('Error in createBulkBookings:', error)
    return { error: 'Failed to create bookings' }
  }
}