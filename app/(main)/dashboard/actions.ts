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
  faculty_name?: string
  subject?: string
  class_name?: string
}

export interface QuickStats {
  todayBookings: number
  thisWeekBookings: number
  thisMonthBookings: number
  averageBookingDuration: number
}

// Optimized: Single function that gets user once and returns all dashboard data
export async function getAllDashboardData(): Promise<{
  stats: DashboardStats
  recentBookings: RecentBooking[]
  quickStats: QuickStats
}> {
  const supabase = await createClient()

  try {
    // Single auth check
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      throw new Error('User not authenticated')
    }

    // Single optimized query for all user bookings with resource and building data
    const [bookingsResult, resourcesCountResult] = await Promise.all([
      supabase
        .from('bookings')
        .select(`
          id,
          status,
          start_date,
          end_date,
          start_time,
          end_time,
          reason,
          created_at,
          faculty_name,
          subject,
          class_name,
          resources (
            name,
            buildings (
              name
            )
          )
        `)
        .eq('user_id', user.id)
        .order('created_at', { ascending: false }),
      
      // Get total resources count in parallel
      supabase
        .from('resources')
        .select('*', { count: 'exact', head: true })
        .eq('is_active', true)
    ])

    if (bookingsResult.error) {
      throw new Error(`Failed to fetch bookings: ${bookingsResult.error.message}`)
    }

    if (resourcesCountResult.error) {
      console.error('Error fetching resources count:', resourcesCountResult.error)
    }

    const bookings = bookingsResult.data || []
    const totalResources = resourcesCountResult.count || 0

    // Transform bookings data once
    const transformedBookings = bookings.map(booking => {
      const resource = Array.isArray(booking.resources) ? booking.resources[0] : booking.resources
      const building = Array.isArray(resource?.buildings) ? resource.buildings[0] : resource?.buildings
      
      return {
        id: booking.id,
        status: booking.status,
        start_date: booking.start_date,
        end_date: booking.end_date,
        start_time: booking.start_time,
        end_time: booking.end_time,
        reason: booking.reason,
        created_at: booking.created_at,
        faculty_name: booking.faculty_name,
        subject: booking.subject,
        class_name: booking.class_name,
        resource_name: resource?.name || 'Unknown Resource',
        building_name: building?.name || 'Unknown Building'
      }
    })

    // Calculate all stats from the same dataset
    const stats = calculateDashboardStats(transformedBookings, totalResources)
    const recentBookings = transformedBookings.slice(0, 5).map(booking => ({
      id: booking.id,
      resource_name: booking.resource_name,
      building_name: booking.building_name,
      start_date: booking.start_date,
      end_date: booking.end_date,
      start_time: booking.start_time,
      end_time: booking.end_time,
      status: booking.status,
      reason: booking.reason,
      created_at: booking.created_at,
      faculty_name: booking.faculty_name,
      subject: booking.subject,
      class_name: booking.class_name
    }))
    const quickStats = calculateQuickStats(transformedBookings)

    return {
      stats,
      recentBookings,
      quickStats
    }
  } catch (error) {
    console.error('Error in getAllDashboardData:', error)
    throw error
  }
}

interface TransformedBooking {
  id: string
  status: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  reason: string
  created_at: string
  faculty_name?: string
  subject?: string
  class_name?: string
  resource_name: string
  building_name: string
}

function calculateDashboardStats(bookings: TransformedBooking[], totalResources: number): DashboardStats {
  const totalBookings = bookings.length
  const today = new Date()
  
  const upcomingBookings = bookings.filter(booking => {
    const endDate = new Date(booking.end_date)
    return endDate >= today && (booking.status === 'pending' || booking.status === 'approved')
  }).length

  const completedBookings = bookings.filter(booking => {
    const endDate = new Date(booking.end_date)
    return endDate < today || booking.status === 'cancelled'
  }).length

  const cancelledBookings = bookings.filter(booking => booking.status === 'cancelled').length
  const pendingBookings = bookings.filter(booking => booking.status === 'pending').length

  // Calculate favorite buildings
  const buildingCounts: { [key: string]: number } = {}
  bookings.forEach(booking => {
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
    totalResources,
    favoriteBuildings
  }
}

function calculateQuickStats(bookings: TransformedBooking[]): QuickStats {
  const today = new Date()
  const startOfWeek = new Date(today)
  startOfWeek.setDate(today.getDate() - today.getDay())
  const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1)

  const todayBookings = bookings.filter(booking => {
    const startDate = new Date(booking.start_date)
    const endDate = new Date(booking.end_date)
    return startDate <= today && endDate >= today
  }).length

  const thisWeekBookings = bookings.filter(booking => {
    const startDate = new Date(booking.start_date)
    const endDate = new Date(booking.end_date)
    return startDate <= new Date(startOfWeek.getTime() + 6 * 24 * 60 * 60 * 1000) && endDate >= startOfWeek
  }).length

  const thisMonthBookings = bookings.filter(booking => {
    const startDate = new Date(booking.start_date)
    const endDate = new Date(booking.end_date)
    const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0)
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
}

// Keep the old functions for backwards compatibility, but mark as deprecated
export async function getDashboardStats(): Promise<DashboardStats> {
  const data = await getAllDashboardData()
  return data.stats
}

export async function getRecentBookings(limit: number = 5): Promise<RecentBooking[]> {
  const data = await getAllDashboardData()
  return data.recentBookings.slice(0, limit)
}

export async function getQuickStats(): Promise<QuickStats> {
  const data = await getAllDashboardData()
  return data.quickStats
}
