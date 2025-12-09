'use server'

import { createClient } from '@/utils/supabase/server'

export type ClassScheduleBooking = {
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
  resources?: {
    id: string
    name: string
    type: string
    capacity: number | null
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
  approved_by_profile?: {
    id: string
    name: string
    email: string
  }
}

export type ClassScheduleEvent = {
  id: string
  title: string
  start: Date
  end: Date
  resource: ClassScheduleBooking
  allDay?: boolean
}

// Get all unique class names from bookings
export async function getAllClassNames(): Promise<{
  success: boolean
  data?: string[]
  error?: string
}> {
  try {
    const supabase = await createClient()

    const { data: bookings, error } = await supabase
      .from('bookings')
      .select('class_name')
      .in('status', ['pending', 'approved'])
      .order('class_name', { ascending: true })

    if (error) {
      console.error('Error fetching class names:', error)
      return { success: false, error: error.message }
    }

    // Get unique class names
    const uniqueClassNames = [...new Set(bookings.map(b => b.class_name).filter(Boolean))]

    return { success: true, data: uniqueClassNames }
  } catch (error) {
    console.error('Error in getAllClassNames:', error)
    return { success: false, error: 'Failed to fetch class names' }
  }
}

// Get bookings by class name
export async function getClassScheduleBookings(className: string): Promise<{
  success: boolean
  data?: ClassScheduleBooking[]
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
        resources:resource_id (
          id,
          name,
          type,
          capacity,
          buildings:building_id (
            id,
            name,
            code
          ),
          floors:floor_id (
            id,
            floor_number,
            name
          )
        ),
        approved_by_profile:approved_by (
          id,
          name,
          email
        )
      `)
      .eq('class_name', className)
      .in('status', ['pending', 'approved'])
      .order('start_date', { ascending: true })

    if (error) {
      console.error('Error fetching class schedule bookings:', error)
      return { success: false, error: error.message }
    }

    return { success: true, data: bookings as ClassScheduleBooking[] }
  } catch (error) {
    console.error('Error in getClassScheduleBookings:', error)
    return { success: false, error: 'Failed to fetch class schedule bookings' }
  }
}
