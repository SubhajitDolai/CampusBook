'use server'

import { createClient } from '@/utils/supabase/server'
import { redirect } from 'next/navigation'

export type ProfileData = {
  name: string
  email: string
  university_id: string
  phone: string | null
  gender: 'male' | 'female' | 'other'
  designation: string
  department: string
  role: string
  seating_location?: string | null
  building_name?: string | null
  floor_number?: number | null
  room_number?: number | null
  cabin?: string | null
  cubicle?: string | null
  workstation?: string | null
}

export type UpdateProfileData = {
  name: string
  university_id: string
  phone: string | null
  gender: 'male' | 'female' | 'other'
  designation: string
  department: string
  seating_location?: string | null
  building_name?: string | null
  floor_number?: number | null
  room_number?: number | null
  cabin?: string | null
  cubicle?: string | null
  workstation?: string | null
}

export async function getProfile(): Promise<ProfileData> {
  const supabase = await createClient()

  try {
    // Single auth check
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      redirect('/login')
    }

    // Fetch profile data
    const { data: profile, error: profileError } = await supabase
      .from('profiles')
      .select(`
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
        workstation
      `)
      .eq('id', user.id)
      .single()

    if (profileError) {
      throw new Error(`Failed to fetch profile: ${profileError.message}`)
    }

    if (!profile) {
      throw new Error('Profile not found')
    }

    return profile
  } catch (error) {
    console.error('Error in getProfile:', error)
    throw error
  }
}

export async function updateProfile(profileData: UpdateProfileData): Promise<{ error?: string }> {
  const supabase = await createClient()

  try {
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      return { error: 'Not authenticated' }
    }

    // Check if university_id is unique (only if it's being changed)
    const { data: existingProfile, error: checkError } = await supabase
      .from('profiles')
      .select('university_id')
      .eq('id', user.id)
      .single()

    if (checkError) {
      return { error: 'Failed to verify current profile' }
    }

    // Only check uniqueness if university_id is changing
    if (existingProfile?.university_id !== profileData.university_id) {
      const { data: duplicate, error: duplicateError } = await supabase
        .from('profiles')
        .select('id')
        .eq('university_id', profileData.university_id)
        .neq('id', user.id)

      if (duplicateError) {
        return { error: 'Failed to check University ID uniqueness' }
      }

      if (duplicate && duplicate.length > 0) {
        return { error: 'This University ID is already taken' }
      }
    }

    // Update profile
    const { error: updateError } = await supabase
      .from('profiles')
      .update({
        name: profileData.name,
        university_id: profileData.university_id,
        phone: profileData.phone,
        gender: profileData.gender,
        designation: profileData.designation,
        department: profileData.department,
        seating_location: profileData.seating_location,
        building_name: profileData.building_name,
        floor_number: profileData.floor_number,
        room_number: profileData.room_number,
        cabin: profileData.cabin,
        cubicle: profileData.cubicle,
        workstation: profileData.workstation
      })
      .eq('id', user.id)

    if (updateError) {
      return { error: `Failed to update profile: ${updateError.message}` }
    }

    return {}
  } catch (error) {
    console.error('Error in updateProfile:', error)
    return { error: 'Something went wrong. Please try again.' }
  }
}
