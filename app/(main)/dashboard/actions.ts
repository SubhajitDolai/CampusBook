'use server'

import { createClient } from '@/utils/supabase/server'

export interface DashboardStats {
  totalBookings: number
  upcomingBookings: number
  completedBookings: number
  cancelledBookings: number
  pendingBookings: number
  totalResources: number
  favoriteBuildings: string[]
}

export interface RecentBooking {
  id: string
  resource_name: string
  building_name: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  status: string
  reason: string
  created_at: string
}

export interface QuickStats {
  todayBookings: number
  thisWeekBookings: number
  thisMonthBookings: number
  averageBookingDuration: number
}

export async function getDashboardStats(): Promise<DashboardStats> {
  const supabase = await createClient()

  try {
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      throw new Error('User not authenticated')
    }

    // Get all user's bookings
    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select(`
        id,
        status,
        start_date,
        end_date,
        resources (
          buildings (
            name
          )
        )
      `)
      .eq('user_id', user.id)

    if (bookingsError) {
      console.error('Error fetching bookings:', bookingsError)
      throw new Error(`Failed to fetch bookings: ${bookingsError.message}`)
    }

    // Get total resources count
    const { count: totalResources, error: resourcesError } = await supabase
      .from('resources')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    if (resourcesError) {
      console.error('Error fetching resources count:', resourcesError)
    }

    // Transform the data to handle array responses from joins
    const transformedBookings = bookings?.map(booking => {
      const resource = Array.isArray(booking.resources) ? booking.resources[0] : booking.resources
      const building = Array.isArray(resource?.buildings) ? resource.buildings[0] : resource?.buildings
      
      return {
        id: booking.id,
        status: booking.status,
        start_date: booking.start_date,
        end_date: booking.end_date,
        building_name: building?.name || 'Unknown'
      }
    }) || []

    // Calculate stats
    const totalBookings = transformedBookings.length
    const upcomingBookings = transformedBookings.filter(booking => {
      const today = new Date()
      const endDate = new Date(booking.end_date)
      // Booking is upcoming if it ends in the future and is approved/pending
      return endDate >= today && (booking.status === 'pending' || booking.status === 'approved')
    }).length

    const completedBookings = transformedBookings.filter(booking => {
      const today = new Date()
      const endDate = new Date(booking.end_date)
      // Booking is completed if it ended in the past or was cancelled
      return endDate < today || booking.status === 'cancelled'
    }).length

    const cancelledBookings = transformedBookings.filter(booking => booking.status === 'cancelled').length
    const pendingBookings = transformedBookings.filter(booking => booking.status === 'pending').length

    // Get favorite buildings (most booked)
    const buildingCounts: { [key: string]: number } = {}
    transformedBookings.forEach(booking => {
      const buildingName = booking.building_name
      buildingCounts[buildingName] = (buildingCounts[buildingName] || 0) + 1
    })

    const favoriteBuildings = Object.entries(buildingCounts)
      .sort(([,a], [,b]) => b - a)
      .slice(0, 3)
      .map(([building]) => building)

    return {
      totalBookings,
      upcomingBookings,
      completedBookings,
      cancelledBookings,
      pendingBookings,
      totalResources: totalResources || 0,
      favoriteBuildings
    }
  } catch (error) {
    console.error('Error in getDashboardStats:', error)
    throw error
  }
}

export async function getRecentBookings(limit: number = 5): Promise<RecentBooking[]> {
  const supabase = await createClient()

  try {
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      throw new Error('User not authenticated')
    }

    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select(`
        id,
        start_date,
        end_date,
        start_time,
        end_time,
        status,
        reason,
        created_at,
        resources (
          name,
          buildings (
            name
          )
        )
      `)
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })
      .limit(limit)

    if (bookingsError) {
      console.error('Error fetching recent bookings:', bookingsError)
      throw new Error(`Failed to fetch recent bookings: ${bookingsError.message}`)
    }

    if (!bookings) {
      return []
    }

    return bookings.map(booking => {
      const resource = Array.isArray(booking.resources) ? booking.resources[0] : booking.resources
      const building = Array.isArray(resource?.buildings) ? resource.buildings[0] : resource?.buildings
      
      return {
        id: booking.id,
        resource_name: resource?.name || 'Unknown Resource',
        building_name: building?.name || 'Unknown Building',
        start_date: booking.start_date,
        end_date: booking.end_date,
        start_time: booking.start_time,
        end_time: booking.end_time,
        status: booking.status,
        reason: booking.reason,
        created_at: booking.created_at
      }
    })
  } catch (error) {
    console.error('Error in getRecentBookings:', error)
    throw error
  }
}

export async function getQuickStats(): Promise<QuickStats> {
  const supabase = await createClient()

  try {
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      throw new Error('User not authenticated')
    }

    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select('start_date, end_date, start_time, end_time')
      .eq('user_id', user.id)

    if (bookingsError) {
      console.error('Error fetching bookings for quick stats:', bookingsError)
      throw new Error(`Failed to fetch bookings: ${bookingsError.message}`)
    }

    if (!bookings) {
      return {
        todayBookings: 0,
        thisWeekBookings: 0,
        thisMonthBookings: 0,
        averageBookingDuration: 0
      }
    }

    const today = new Date()
    const startOfWeek = new Date(today)
    startOfWeek.setDate(today.getDate() - today.getDay())
    const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1)

    const todayBookings = bookings.filter(booking => {
      const startDate = new Date(booking.start_date)
      const endDate = new Date(booking.end_date)
      // Check if today falls within the booking period
      return startDate <= today && endDate >= today
    }).length

    const thisWeekBookings = bookings.filter(booking => {
      const startDate = new Date(booking.start_date)
      const endDate = new Date(booking.end_date)
      // Check if the booking period overlaps with this week
      return startDate <= new Date(startOfWeek.getTime() + 6 * 24 * 60 * 60 * 1000) && endDate >= startOfWeek
    }).length

    const thisMonthBookings = bookings.filter(booking => {
      const startDate = new Date(booking.start_date)
      const endDate = new Date(booking.end_date)
      const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0)
      // Check if the booking period overlaps with this month
      return startDate <= endOfMonth && endDate >= startOfMonth
    }).length

    // Calculate average booking duration
    const totalDuration = bookings.reduce((total, booking) => {
      const start = new Date(`2000-01-01T${booking.start_time}`)
      const end = new Date(`2000-01-01T${booking.end_time}`)
      const duration = (end.getTime() - start.getTime()) / (1000 * 60 * 60) // hours
      return total + duration
    }, 0)

    const averageBookingDuration = bookings.length > 0 ? Math.round(totalDuration / bookings.length) : 0

    return {
      todayBookings,
      thisWeekBookings,
      thisMonthBookings,
      averageBookingDuration
    }
  } catch (error) {
    console.error('Error in getQuickStats:', error)
    throw error
  }
} 