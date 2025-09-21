'use server'

import { createClient } from '@/utils/supabase/server'

export interface ApproverDetails {
  id: string
  name: string
  email: string
  department: string
  role: string
}

export interface BookingWithDetails {
  id: string
  resource_id: string
  user_id: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  reason: string
  status: string
  approved_by: string | null
  approved_at: string | null
  approver?: ApproverDetails | null
  created_at: string
  weekdays?: number[]
  faculty_name?: string
  subject?: string
  class_name?: string
  resources: {
    id: string
    name: string
    type: string
    capacity: number | null
    description: string | null
    buildings: {
      id: string
      name: string
      code: string
    }
    floors: {
      id: string
      floor_number: number
      name: string | null
    }
  }
  profiles: {
    id: string
    name: string
    email: string
    university_id: string
    department: string
    role: string
  }
}

export async function getUserBookings(): Promise<BookingWithDetails[]> {
  const supabase = await createClient()

  try {
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      throw new Error('User not authenticated')
    }

    // First, get the user's profile
    const { data: userProfile, error: profileError } = await supabase
      .from('profiles')
      .select('id, name, email, university_id, department, role, seating_location, building_name, floor_number, room_number, cabin, cubicle, workstation')
      .eq('id', user.id)
      .single()

    if (profileError) {
      console.error('Error fetching user profile:', profileError)
      throw new Error(`Failed to fetch user profile: ${profileError.message}`)
    }

    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select(`
        id,
        resource_id,
        user_id,
        start_date,
        end_date,
        start_time,
        end_time,
        reason,
        status,
        approved_by,
        approved_at,
        created_at,
        weekdays,
        faculty_name,
        subject,
        class_name,
        resources (
          id,
          name,
          type,
          capacity,
          description,
          buildings (
            id,
            name,
            code
          ),
          floors (
            id,
            floor_number,
            name
          )
        )
      `)
      .eq('user_id', user.id)
      .order('start_date', { ascending: false })
      .order('start_time', { ascending: false })

    if (bookingsError) {
      console.error('Error fetching bookings:', bookingsError)
      throw new Error(`Failed to fetch bookings: ${bookingsError.message}`)
    }

    if (!bookings) {
      return []
    }

    // Fetch approver profiles in a single batch to avoid per-row lookups
    const approverIds = Array.from(new Set((bookings as Array<{ approved_by?: string | null }>)
      .map(b => b.approved_by)
      .filter(Boolean))) as string[]

    let approverMap: Record<string, ApproverDetails> = {}
    if (approverIds.length > 0) {
      const { data: approvers, error: approversError } = await supabase
        .from('profiles')
        .select('id, name, email, department, role')
        .in('id', approverIds)

      if (approvers && !approversError) {
        approverMap = (approvers as ApproverDetails[]).reduce((acc, a) => {
          acc[a.id] = {
            id: a.id,
            name: a.name,
            email: a.email,
            department: a.department,
            role: a.role
          }
          return acc
        }, {} as Record<string, ApproverDetails>)
      } else if (approversError) {
        console.error('Error fetching approvers:', approversError)
      }
    }

    // Transform the data to handle array responses from joins
    const transformedBookings: BookingWithDetails[] = bookings.map((booking) => {
      const resource = Array.isArray(booking.resources) ? booking.resources[0] : booking.resources
      const building = Array.isArray(resource?.buildings) ? resource.buildings[0] : resource?.buildings
      const floor = Array.isArray(resource?.floors) ? resource.floors[0] : resource?.floors

      return {
        id: booking.id,
        resource_id: booking.resource_id,
        user_id: booking.user_id,
        start_date: booking.start_date,
        end_date: booking.end_date,
        start_time: booking.start_time,
        end_time: booking.end_time,
        reason: booking.reason,
        status: booking.status,
        approved_by: booking.approved_by,
        approved_at: booking.approved_at,
        created_at: booking.created_at,
        weekdays: booking.weekdays,
        faculty_name: booking.faculty_name,
        subject: booking.subject,
        class_name: booking.class_name,
        resources: {
          id: resource?.id || '',
          name: resource?.name || 'Unknown Resource',
          type: resource?.type || 'Unknown',
          capacity: resource?.capacity,
          description: resource?.description,
          buildings: building || { id: '', name: 'Unknown Building', code: '' },
          floors: floor || { id: '', floor_number: 0, name: null }
        },
        approver: booking.approved_by ? approverMap[booking.approved_by] || null : null,
        profiles: userProfile || {
          id: '',
          name: 'Unknown User',
          email: '',
          university_id: '',
          department: '',
          role: ''
        }
      }
    })

    return transformedBookings
  } catch (error) {
    console.error('Error in getUserBookings:', error)
    throw error
  }
}

export interface ApproverDetails {
  id: string
  name: string
  email: string
  department: string
  role: string
}

export async function getBookingApprovalDetails(bookingId: string): Promise<{ approver?: ApproverDetails; error?: string }> {
  const supabase = await createClient()

  try {
    const { data: booking, error: bookingError } = await supabase
      .from('bookings')
      .select('approved_by, approved_at')
      .eq('id', bookingId)
      .single()

    if (bookingError || !booking || !booking.approved_by) {
      return {}
    }

    const { data: approver, error: approverError } = await supabase
      .from('profiles')
      .select('id, name, email, department, role')
      .eq('id', booking.approved_by)
      .single()

    if (approverError) {
      console.error('Error fetching approver:', approverError)
      return { error: 'Failed to fetch approver details' }
    }

    return { approver }
  } catch (error) {
    console.error('Error in getBookingApprovalDetails:', error)
    return { error: 'An error occurred while fetching approval details' }
  }
}

export async function cancelBooking(bookingId: string): Promise<{ success: boolean; error?: string }> {
  const supabase = await createClient()

  try {
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      return { success: false, error: 'User not authenticated' }
    }

    // Verify the booking belongs to the current user
    const { data: booking, error: bookingError } = await supabase
      .from('bookings')
      .select('id, user_id, status')
      .eq('id', bookingId)
      .eq('user_id', user.id)
      .single()

    if (bookingError || !booking) {
      return { success: false, error: 'Booking not found or access denied' }
    }

    // Only allow cancellation of pending or confirmed bookings
    if (booking.status !== 'pending' && booking.status !== 'approved') {
      return { success: false, error: 'Cannot cancel this booking' }
    }

    // Update booking status to cancelled
    const { error: updateError } = await supabase
      .from('bookings')
      .update({ status: 'cancelled' })
      .eq('id', bookingId)
      .eq('user_id', user.id)

    if (updateError) {
      console.error('Error cancelling booking:', updateError)
      return { success: false, error: 'Failed to cancel booking' }
    }

    return { success: true }
  } catch (error) {
    console.error('Error in cancelBooking:', error)
    return { success: false, error: 'An error occurred while cancelling the booking' }
  }
}

 