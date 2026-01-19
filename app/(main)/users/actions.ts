'use server'

import { createClient } from '@/utils/supabase/server'
import { redirect } from 'next/navigation'

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
  avatar_url?: string | null
  seating_location?: string | null
  building_name?: string | null
  floor_number?: number | null
  room_number?: number | null
  cabin?: string | null
  cubicle?: string | null
  workstation?: string | null
  created_at: string
}

export interface UserStats {
  total: number
  faculty: number
  admin: number
  superAdmin: number
}

export interface UsersPageData {
  users: UserProfile[]
  departments: string[]
  buildings: string[]
  stats: UserStats
}

export async function getAllUsersData(): Promise<UsersPageData> {
  const supabase = await createClient()

  try {
    // Single auth check
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      redirect('/login')
    }

    // Single optimized query to get all users data
    const { data: profiles, error: profilesError } = await supabase
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
        avatar_url,
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

    if (profilesError) {
      throw new Error(`Failed to fetch users: ${profilesError.message}`)
    }

    const users = profiles || []

    // Calculate stats from fetched data (no separate queries)
    const stats = {
      total: users.length,
      faculty: users.filter(u => u.role === 'faculty').length,
      admin: users.filter(u => u.role === 'admin').length,
      superAdmin: users.filter(u => u.role === 'super_admin').length
    }

    // Extract unique departments and buildings from fetched data
    const departments = ['All', ...Array.from(new Set(
      users.map(u => u.department).filter(Boolean)
    )).sort()]

    const buildings = ['All', ...Array.from(new Set(
      users.map(u => u.building_name).filter(Boolean)
    )).sort()]

    return {
      users,
      departments,
      buildings,
      stats
    }
  } catch (error) {
    console.error('Error in getAllUsersData:', error)
    throw error
  }
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
        avatar_url,
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
        avatar_url,
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
