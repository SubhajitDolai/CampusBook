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
  avatar_url?: string | null
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
  avatar_url?: string | null
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
        avatar_url,
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

export async function uploadAvatar(file: File): Promise<{ url?: string; error?: string }> {
  const supabase = await createClient()

  try {
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      return { error: 'Not authenticated' }
    }

    // Validate file type
    if (!file.type.startsWith('image/')) {
      return { error: 'File must be an image' }
    }

    // Validate file size (max 5MB)
    if (file.size > 5 * 1024 * 1024) {
      return { error: 'Image size must be less than 5MB' }
    }

    // Create unique filename
    const fileExt = file.name.split('.').pop()
    const fileName = `${user.id}-${Date.now()}.${fileExt}`
    const filePath = `avatars/${fileName}`

    // Upload to Supabase Storage
    const { data: uploadData, error: uploadError } = await supabase.storage
      .from('profiles')
      .upload(filePath, file, {
        cacheControl: '3600',
        upsert: true,
        contentType: file.type
      })

    if (uploadError) {
      console.error('Storage upload error:', uploadError)
      return { error: `Upload failed: ${uploadError.message}` }
    }

    // Get public URL
    const { data: { publicUrl } } = supabase.storage
      .from('profiles')
      .getPublicUrl(filePath)

    // Update profile with avatar URL
    const { error: updateError } = await supabase
      .from('profiles')
      .update({ avatar_url: publicUrl })
      .eq('id', user.id)

    if (updateError) {
      return { error: 'Failed to update profile with avatar URL' }
    }

    return { url: publicUrl }
  } catch (error) {
    console.error('Error in uploadAvatar:', error)
    return { error: 'Failed to upload avatar' }
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
        avatar_url: profileData.avatar_url,
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
