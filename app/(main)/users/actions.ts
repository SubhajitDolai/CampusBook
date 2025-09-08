'use server'

import { createClient } from '@/utils/supabase/server'

export interface UserProfile {
  id: string
  name: string
  email: string
  university_id: string
  phone: string | null
  gender: string | null
  designation: string | null
  department: string
  role: 'faculty' | 'admin' | 'super_admin'
  seating_location?: string | null
  building_name?: string | null
  floor_number?: number | null
  room_number?: number | null
  cabin?: string | null
  cubicle?: string | null
  workstation?: string | null
  created_at: string
}

export async function searchUsers(
  searchTerm: string = '',
  departmentFilter: string = 'All',
  roleFilter: string = 'All',
  buildingFilter: string = 'All'
): Promise<UserProfile[]> {
  const supabase = await createClient()

  try {
    let query = supabase
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
        seating_location,
        building_name,
        floor_number,
        room_number,
        cabin,
        cubicle,
        workstation,
        created_at
      `)
      .order('name', { ascending: true })

    // Apply filters
    if (departmentFilter !== 'All') {
      query = query.eq('department', departmentFilter)
    }

    if (roleFilter !== 'All') {
      query = query.eq('role', roleFilter)
    }

    if (buildingFilter !== 'All') {
      query = query.eq('building_name', buildingFilter)
    }

    // Apply search term
    if (searchTerm.trim()) {
      query = query.or(
        `name.ilike.%${searchTerm}%,email.ilike.%${searchTerm}%,university_id.ilike.%${searchTerm}%,department.ilike.%${searchTerm}%,designation.ilike.%${searchTerm}%`
      )
    }

    const { data, error } = await query

    if (error) {
      console.error('Error fetching users:', error)
      throw new Error('Failed to fetch users')
    }

    return data || []
  } catch (error) {
    console.error('Error in searchUsers:', error)
    throw new Error('Failed to search users')
  }
}

export async function getUserById(userId: string): Promise<UserProfile | null> {
  const supabase = await createClient()

  try {
    const { data, error } = await supabase
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
        seating_location,
        building_name,
        floor_number,
        room_number,
        cabin,
        cubicle,
        workstation,
        created_at
      `)
      .eq('id', userId)
      .single()

    if (error) {
      console.error('Error fetching user:', error)
      return null
    }

    return data
  } catch (error) {
    console.error('Error in getUserById:', error)
    return null
  }
}

export async function getDepartments(): Promise<string[]> {
  const supabase = await createClient()

  try {
    const { data, error } = await supabase
      .from('profiles')
      .select('department')
      .not('department', 'is', null)

    if (error) {
      console.error('Error fetching departments:', error)
      return []
    }

    // Get unique departments and sort them
    const departments = Array.from(new Set(data.map(item => item.department)))
    return ['All', ...departments.sort()]
  } catch (error) {
    console.error('Error in getDepartments:', error)
    return ['All']
  }
}

export async function getBuildings(): Promise<string[]> {
  const supabase = await createClient()

  try {
    const { data, error } = await supabase
      .from('profiles')
      .select('building_name')
      .not('building_name', 'is', null)

    if (error) {
      console.error('Error fetching buildings:', error)
      return []
    }

    // Get unique buildings and sort them
    const buildings = Array.from(new Set(data.map(item => item.building_name).filter(Boolean)))
    return ['All', ...buildings.sort()]
  } catch (error) {
    console.error('Error in getBuildings:', error)
    return ['All']
  }
}

export async function getUserStats() {
  const supabase = await createClient()

  try {
    // Get total users count
    const { count: totalUsers } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })

    // Get faculty count
    const { count: facultyCount } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })
      .eq('role', 'faculty')

    // Get admin count
    const { count: adminCount } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })
      .eq('role', 'admin')

    // Get super admin count
    const { count: superAdminCount } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true })
      .eq('role', 'super_admin')

    return {
      total: totalUsers || 0,
      faculty: facultyCount || 0,
      admin: adminCount || 0,
      superAdmin: superAdminCount || 0
    }
  } catch (error) {
    console.error('Error fetching user stats:', error)
    return {
      total: 0,
      faculty: 0,
      admin: 0,
      superAdmin: 0
    }
  }
}
