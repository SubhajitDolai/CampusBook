'use server'

import { createClient } from '@/utils/supabase/server'

export type CalendarBooking = {
  id: string
  resource_id: string
  user_id: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  reason: string
  faculty_name?: string
  subject: string
  class_name: string
  status: 'pending' | 'approved' | 'rejected' | 'cancelled'
  weekdays: number[]
  approved_by?: string
  approved_at?: string
  created_at: string
  profiles?: {
    id: string
    name: string
    email: string
    university_id: string
    department: string
    role: string
  }
  approved_by_profile?: {
    id: string
    name: string
    email: string
  }
}

export type CalendarEvent = {
  id: string
  title: string
  start: Date
  end: Date
  resource: CalendarBooking
  allDay?: boolean
}

export async function getResourceBookings(resourceId: string): Promise<{
  success: boolean
  data?: CalendarBooking[]
  error?: string
}> {
  try {
    const supabase = await createClient()

    const { data: bookings, error } = await supabase
      .from('bookings')
      .select(`
        *,
        profiles:user_id (
          id,
          name,
          email,
          university_id,
          department,
          role
        ),
        approved_by_profile:approved_by (
          id,
          name,
          email
        )
      `)
      .eq('resource_id', resourceId)
      .order('start_date', { ascending: true })

    if (error) {
      console.error('Error fetching resource bookings:', error)
      return { success: false, error: error.message }
    }

    return { success: true, data: bookings as CalendarBooking[] }
  } catch (error) {
    console.error('Error in getResourceBookings:', error)
    return { success: false, error: 'Failed to fetch resource bookings' }
  }
}

export async function getResourceDetails(resourceId: string): Promise<{
  success: boolean
  data?: {
    id: string
    name: string
    type: string
    capacity: number | null
    description: string | null
    buildings?: {
      id: string
      name: string
      code: string
    } | null
    floors?: {
      id: string
      floor_number: number
      name: string | null
    } | null
  }
  error?: string
}> {
  try {
    const supabase = await createClient()

    const { data: resource, error } = await supabase
      .from('resources')
      .select(`
        id,
        name,
        type,
        capacity,
        description,
        buildings!inner (
          id,
          name,
          code
        ),
        floors!inner (
          id,
          floor_number,
          name
        )
      `)
      .eq('id', resourceId)
      .single()

    if (error) {
      console.error('Error fetching resource details:', error)
      return { success: false, error: error.message }
    }

    // Transform the data to match our expected type
    const transformedResource = {
      id: resource.id,
      name: resource.name,
      type: resource.type,
      capacity: resource.capacity,
      description: resource.description,
      buildings: Array.isArray(resource.buildings) ? resource.buildings[0] : resource.buildings,
      floors: Array.isArray(resource.floors) ? resource.floors[0] : resource.floors,
    }

    return { success: true, data: transformedResource }
  } catch (error) {
    console.error('Error in getResourceDetails:', error)
    return { success: false, error: 'Failed to fetch resource details' }
  }
}