'use server'

import { createClient } from '@/utils/supabase/server'

export type ScheduleBooking = {
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

export type ScheduleEvent = {
  id: string
  title: string
  start: Date
  end: Date
  resource: ScheduleBooking
  allDay?: boolean
}

export async function getUserProfile(): Promise<{
  success: boolean
  data?: { id: string; name: string; email: string }
  error?: string
}> {
  try {
    const supabase = await createClient()
    
    const { data: { user } } = await supabase.auth.getUser()
    
    if (!user) {
      return { success: false, error: 'User not authenticated' }
    }

    const { data: profile, error } = await supabase
      .from('profiles')
      .select('id, name, email')
      .eq('id', user.id)
      .single()

    if (error) {
      console.error('Error fetching user profile:', error)
      return { success: false, error: error.message }
    }

    return { success: true, data: profile }
  } catch (error) {
    console.error('Error in getUserProfile:', error)
    return { success: false, error: 'Failed to fetch user profile' }
  }
}

export async function getMyScheduleBookings(facultyName: string): Promise<{
  success: boolean
  data?: ScheduleBooking[]
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
      .eq('faculty_name', facultyName)
      .in('status', ['pending', 'approved'])
      .order('start_date', { ascending: true })

    if (error) {
      console.error('Error fetching schedule bookings:', error)
      return { success: false, error: error.message }
    }

    return { success: true, data: bookings as ScheduleBooking[] }
  } catch (error) {
    console.error('Error in getMyScheduleBookings:', error)
    return { success: false, error: 'Failed to fetch schedule bookings' }
  }
}
