'use server'

import { createClient } from '@/utils/supabase/server'

export async function getBookings() {
  try {
    const supabase = await createClient()
    
    const { data, error } = await supabase
      .from('bookings')
      .select(`
        *,
        resources (
          id,
          name,
          type,
          capacity,
          buildings (
            name,
            code
          ),
          floors (
            floor_number,
            name
          )
        ),
        profiles!bookings_user_id_fkey (
          id,
          name,
          email,
          university_id,
          department,
          role,
          seating_location,
          building_name,
          floor_number,
          room_number,
          cabin,
          cubicle,
          workstation
        ),
        approved_by_profile:profiles!bookings_approved_by_fkey (
          id,
          name,
          email
        )
      `)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching bookings:', error)
      return []
    }

    return data || []
  } catch (error) {
    console.error('Error fetching bookings:', error)
    return []
  }
}

export async function approveBooking(bookingId: string) {
  try {
    const supabase = await createClient()
    
    // Get current user
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return { error: 'User not authenticated' }
    }

    // Get current user's role
    const { data: currentUserProfile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (!currentUserProfile || currentUserProfile.role !== 'super_admin') {
      return { error: 'Only super admins can approve bookings' }
    }

    // Check if booking exists and is pending
    const { data: booking } = await supabase
      .from('bookings')
      .select('status')
      .eq('id', bookingId)
      .single()

    if (!booking) {
      return { error: 'Booking not found' }
    }

    if (booking.status !== 'pending') {
      return { error: 'Booking is not pending approval' }
    }

    // Approve the booking
    const { error } = await supabase
      .from('bookings')
      .update({
        status: 'approved',
        approved_by: user.id,
        approved_at: new Date().toISOString()
      })
      .eq('id', bookingId)

    if (error) {
      console.error('Error approving booking:', error)
      return { error: error.message }
    }

    return { success: true }
  } catch (error) {
    console.error('Error approving booking:', error)
    return { error: 'Failed to approve booking' }
  }
}

export async function rejectBooking(bookingId: string) {
  try {
    const supabase = await createClient()
    
    // Get current user
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return { error: 'User not authenticated' }
    }

    // Get current user's role
    const { data: currentUserProfile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (!currentUserProfile || currentUserProfile.role !== 'super_admin') {
      return { error: 'Only super admins can reject bookings' }
    }

    // Check if booking exists and is pending
    const { data: booking } = await supabase
      .from('bookings')
      .select('status')
      .eq('id', bookingId)
      .single()

    if (!booking) {
      return { error: 'Booking not found' }
    }

    if (booking.status !== 'pending') {
      return { error: 'Booking is not pending approval' }
    }

    // Reject the booking
    const { error } = await supabase
      .from('bookings')
      .update({
        status: 'rejected',
        approved_by: user.id,
        approved_at: new Date().toISOString()
      })
      .eq('id', bookingId)

    if (error) {
      console.error('Error rejecting booking:', error)
      return { error: error.message }
    }

    return { success: true }
  } catch (error) {
    console.error('Error rejecting booking:', error)
    return { error: 'Failed to reject booking' }
  }
}

export async function updateBooking(bookingId: string, updates: {
  start_date?: string
  end_date?: string
  start_time?: string
  end_time?: string
  reason?: string
  faculty_name?: string
  subject?: string
  class_name?: string
  weekdays?: number[]
}) {
  try {
    const supabase = await createClient()
    
    // Get current user
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return { error: 'User not authenticated' }
    }

    // Get current user's role - only super_admin can edit
    const { data: currentUserProfile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (!currentUserProfile || currentUserProfile.role !== 'super_admin') {
      return { error: 'Only super admins can edit bookings' }
    }

    // Check if booking exists
    const { data: booking } = await supabase
      .from('bookings')
      .select('*')
      .eq('id', bookingId)
      .single()

    if (!booking) {
      return { error: 'Booking not found' }
    }

    // Update the booking
    const { error } = await supabase
      .from('bookings')
      .update(updates)
      .eq('id', bookingId)

    if (error) {
      console.error('Error updating booking:', error)
      return { error: error.message }
    }

    return { success: true }
  } catch (error) {
    console.error('Error updating booking:', error)
    return { error: 'Failed to update booking' }
  }
}

export async function deleteBooking(bookingId: string) {
  try {
    const supabase = await createClient()
    
    // Get current user
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return { error: 'User not authenticated' }
    }

    // Get current user's role
    const { data: currentUserProfile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (!currentUserProfile || currentUserProfile.role !== 'super_admin') {
      return { error: 'Only super admins can delete bookings' }
    }

    // Delete the booking
    const { error } = await supabase
      .from('bookings')
      .delete()
      .eq('id', bookingId)

    if (error) {
      console.error('Error deleting booking:', error)
      return { error: error.message }
    }

    return { success: true }
  } catch (error) {
    console.error('Error deleting booking:', error)
    return { error: 'Failed to delete booking' }
  }
}

export async function getCurrentUserRole() {
  try {
    const supabase = await createClient()
    
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return { role: null }
    }

    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    return { role: profile?.role || null }
  } catch (error) {
    console.error('Error fetching user role:', error)
    return { role: null }
  }
}

export async function getBookingsWithUserRole() {
  try {
    const supabase = await createClient()
    
    // Get current user role
    const { data: { user } } = await supabase.auth.getUser()
    let userRole = null
    
    if (user) {
      const { data: profile } = await supabase
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .single()
      
      userRole = profile?.role || null
    }

    // Get bookings
    const { data, error } = await supabase
      .from('bookings')
      .select(`
        *,
        resources (
          id,
          name,
          type,
          capacity,
          buildings (
            name,
            code
          ),
          floors (
            floor_number,
            name
          )
        ),
        profiles!bookings_user_id_fkey (
          id,
          name,
          email,
          university_id,
          department,
          role,
          seating_location,
          building_name,
          floor_number,
          room_number,
          cabin,
          cubicle,
          workstation
        ),
        approved_by_profile:profiles!bookings_approved_by_fkey (
          id,
          name,
          email
        )
      `)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching bookings:', error)
      return { bookings: [], userRole }
    }

    return { bookings: data || [], userRole }
  } catch (error) {
    console.error('Error fetching bookings:', error)
    return { bookings: [], userRole: null }
  }
}

export async function getBookingStats() {
  try {
    const supabase = await createClient()
    
    // Get total bookings count
    const { count: totalBookings } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })

    // Get pending bookings count
    const { count: pendingBookings } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'pending')

    // Get approved bookings count
    const { count: approvedBookings } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'approved')

    // Get rejected bookings count
    const { count: rejectedBookings } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'rejected')

    // Get cancelled bookings count
    const { count: cancelledBookings } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'cancelled')

    return {
      total: totalBookings || 0,
      pending: pendingBookings || 0,
      approved: approvedBookings || 0,
      rejected: rejectedBookings || 0,
      cancelled: cancelledBookings || 0,
    }
  } catch (error) {
    console.error('Error fetching booking stats:', error)
    return {
      total: 0,
      pending: 0,
      approved: 0,
      rejected: 0,
      cancelled: 0,
    }
  }
} 