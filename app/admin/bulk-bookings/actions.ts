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
  class_name: string // Combined storage
  // Frontend class components
  year?: string
  course?: string
  specialization?: string
  batch?: string
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
  
  for (let i = 0; i < rows.length; i++) {
    const row = rows[i]
    const rowConflicts: ConflictCheck['conflicts'] = []
    
    // Temporal validation - check date range
    if (row.start_date && row.end_date && new Date(row.end_date) < new Date(row.start_date)) {
      rowConflicts.push({
        type: 'resource_inactive',
        message: 'End date cannot be before start date'
      })
    }
    
    // Temporal validation - check time range
    if (row.start_time && row.end_time) {
      const startTimeMinutes = parseInt(row.start_time.split(':')[0]) * 60 + parseInt(row.start_time.split(':')[1])
      const endTimeMinutes = parseInt(row.end_time.split(':')[0]) * 60 + parseInt(row.end_time.split(':')[1])
      
      if (endTimeMinutes <= startTimeMinutes) {
        rowConflicts.push({
          type: 'resource_inactive',
          message: 'End time must be after start time'
        })
      }
    }
    
    // Check for conflicts with OTHER ROWS in this batch
    for (let j = 0; j < rows.length; j++) {
      if (i === j) continue // Skip self-comparison
      
      const otherRow = rows[j]
      
      // Only check if same resource
      if (row.resource_id && otherRow.resource_id && row.resource_id === otherRow.resource_id) {
        // Check date overlap
        const dateOverlap = !(
          new Date(row.end_date) < new Date(otherRow.start_date) ||
          new Date(row.start_date) > new Date(otherRow.end_date)
        )
        
        if (dateOverlap) {
          // Check weekday overlap
          const weekdayOverlap = row.weekdays.some(day => otherRow.weekdays.includes(day))
          
          if (weekdayOverlap) {
            // Check time overlap
            const rowStartMinutes = parseInt(row.start_time.split(':')[0]) * 60 + parseInt(row.start_time.split(':')[1])
            const rowEndMinutes = parseInt(row.end_time.split(':')[0]) * 60 + parseInt(row.end_time.split(':')[1])
            const otherStartMinutes = parseInt(otherRow.start_time.split(':')[0]) * 60 + parseInt(otherRow.start_time.split(':')[1])
            const otherEndMinutes = parseInt(otherRow.end_time.split(':')[0]) * 60 + parseInt(otherRow.end_time.split(':')[1])
            
            const timeOverlap = (
              rowStartMinutes < otherEndMinutes && rowEndMinutes > otherStartMinutes
            )
            
            if (timeOverlap) {
              const overlappingDays = row.weekdays
                .filter(day => otherRow.weekdays.includes(day))
                .map(day => ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][day - 1])
                .join(', ')
              
              rowConflicts.push({
                type: 'overlap_approved',
                message: `Conflicts with Row ${j + 1} (${otherRow.start_time}-${otherRow.end_time}) on ${overlappingDays}`
              })
            }
          }
        }
      }
    }
    
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
      // Skip conflict checking if temporal validation already failed
      if (rowConflicts.length === 0) {
        // Check for conflicting approved bookings
        const { data: approvedBookings } = await supabase
          .from('bookings')
          .select('id, start_date, end_date, start_time, end_time, weekdays, status')
          .eq('resource_id', row.resource_id)
          .eq('status', 'approved')
          .gte('end_date', row.start_date)
          .lte('start_date', row.end_date)
        
        // Check for conflicting pending bookings
        const { data: pendingBookings } = await supabase
          .from('bookings')
          .select('id, start_date, end_date, start_time, end_time, weekdays, status')
          .eq('resource_id', row.resource_id)
          .eq('status', 'pending')
          .gte('end_date', row.start_date)
          .lte('start_date', row.end_date)
        
        const allConflictingBookings = [...(approvedBookings || []), ...(pendingBookings || [])]
        
        if (allConflictingBookings && allConflictingBookings.length > 0) {
          const rowStartMinutes = parseInt(row.start_time.split(':')[0]) * 60 + parseInt(row.start_time.split(':')[1])
          const rowEndMinutes = parseInt(row.end_time.split(':')[0]) * 60 + parseInt(row.end_time.split(':')[1])
          
          for (const conflict of allConflictingBookings) {
            // Check weekday intersection
            const hasWeekdayOverlap = row.weekdays.some(day => 
              conflict.weekdays.includes(day)
            )
            
            if (hasWeekdayOverlap) {
              // Improved time overlap check using minutes
              const conflictStartMinutes = parseInt(conflict.start_time.split(':')[0]) * 60 + parseInt(conflict.start_time.split(':')[1])
              const conflictEndMinutes = parseInt(conflict.end_time.split(':')[0]) * 60 + parseInt(conflict.end_time.split(':')[1])
              
              // Check if times overlap
              const timeOverlap = (
                (rowStartMinutes < conflictEndMinutes && rowEndMinutes > conflictStartMinutes)
              )
              
              if (timeOverlap) {
                const conflictType = conflict.status === 'approved' ? 'overlap_approved' : 'overlap_pending'
                const statusText = conflict.status === 'approved' ? 'approved' : 'pending'
                
                rowConflicts.push({
                  type: conflictType,
                  message: `Conflicts with ${statusText} booking (${conflict.start_time}-${conflict.end_time}) on ${row.weekdays.filter(day => conflict.weekdays.includes(day)).map(day => ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][day - 1]).join(', ')}`,
                  conflictingBookingId: conflict.id
                })
              }
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