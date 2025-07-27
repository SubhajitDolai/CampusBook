'use server'

import { createClient } from '@/utils/supabase/server'

export async function getDashboardStats() {
  const supabase = await createClient()

  try {
    // Get total buildings count
    const { count: buildingsCount } = await supabase
      .from('buildings')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get total floors count
    const { count: floorsCount } = await supabase
      .from('floors')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get total resources count
    const { count: resourcesCount } = await supabase
      .from('resources')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get pending bookings count (using exact enum value)
    const { count: pendingBookingsCount } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'pending')

    // Get total users count
    const { count: usersCount } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })

    return {
      buildings: buildingsCount || 0,
      floors: floorsCount || 0,
      resources: resourcesCount || 0,
      pendingBookings: pendingBookingsCount || 0,
      users: usersCount || 0,
    }
  } catch (error) {
    console.error('Error fetching dashboard stats:', error)
    return {
      buildings: 0,
      floors: 0,
      resources: 0,
      pendingBookings: 0,
      users: 0,
    }
  }
}

export async function getRecentBookings() {
  const supabase = await createClient()

  try {
    const { data: recentBookings } = await supabase
      .from('bookings')
      .select(`
        id,
        start_date,
        end_date,
        start_time,
        end_time,
        reason,
        status,
        recurring,
        created_at,
        resources (
          id,
          name,
          type,
          capacity
        ),
        profiles (
          id,
          name,
          university_id,
          department
        )
      `)
      .order('created_at', { ascending: false })
      .limit(5)

    return recentBookings || []
  } catch (error) {
    console.error('Error fetching recent bookings:', error)
    return []
  }
}

export async function getSystemOverview() {
  const supabase = await createClient()

  try {
    // Get active buildings count
    const { count: activeBuildings } = await supabase
      .from('buildings')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get active floors count
    const { count: activeFloors } = await supabase
      .from('floors')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get available resources count
    const { count: availableResources } = await supabase
      .from('resources')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get pending approvals count
    const { count: pendingApprovals } = await supabase
      .from('bookings')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'pending')

    return {
      activeBuildings: activeBuildings || 0,
      activeFloors: activeFloors || 0,
      availableResources: availableResources || 0,
      pendingApprovals: pendingApprovals || 0,
    }
  } catch (error) {
    console.error('Error fetching system overview:', error)
    return {
      activeBuildings: 0,
      activeFloors: 0,
      availableResources: 0,
      pendingApprovals: 0,
    }
  }
}

export async function getUsers() {
  const supabase = await createClient()

  try {
    const { data: users } = await supabase
      .from('profiles')
      .select(`
        id,
        name,
        email,
        university_id,
        phone,
        gender,
        designation,
        department,
        role,
        created_at
      `)
      .order('created_at', { ascending: false })

    return users || []
  } catch (error) {
    console.error('Error fetching users:', error)
    return []
  }
} 