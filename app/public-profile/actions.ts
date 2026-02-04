'use server'

import { createClient } from '@/utils/supabase/server'

export type PublicProfileData = {
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

export async function getPublicProfile(universityId: string): Promise<PublicProfileData | null> {
  const supabase = await createClient()

  try {
    // Query by university_id for exact match
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
      .eq('university_id', universityId)
      .single()

    if (profileError) {
      console.error('Error fetching public profile:', profileError.message)
      return null
    }

    return profile
  } catch (error) {
    console.error('Error in getPublicProfile:', error)
    return null
  }
}
