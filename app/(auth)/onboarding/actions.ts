'use server'

import { createClient } from '@/utils/supabase/server'

export async function completeOnboarding(formData: FormData) {
  const supabase = await createClient()

  // Get current user
  const { data: { user } } = await supabase.auth.getUser()
  
  if (!user) {
    return { error: 'User not authenticated' }
  }

  // Get form data
  const name = formData.get('name') as string
  const university_id = formData.get('university_id') as string
  const phone = formData.get('phone') as string
  const gender = formData.get('gender') as string
  const department = formData.get('department') as string
  const designation = formData.get('designation') as string
  
  // Get new seating location fields
  const seating_location = formData.get('seating_location') as string
  const building_name = formData.get('building_name') as string
  const floor_number = formData.get('floor_number') as string
  const room_number = formData.get('room_number') as string
  const specific_location = formData.get('specific_location') as string

  // Validate required fields
  if (!name || !university_id || !phone || !gender || !department || !designation) {
    return { error: 'Please fill in all required fields' }
  }

  // Check if university_id already exists
  const { data: existingUser } = await supabase
    .from('profiles')
    .select('university_id')
    .eq('university_id', university_id)
    .neq('id', user.id)
    .single()

  if (existingUser) {
    return { error: 'University ID already exists' }
  }

  // Check if profile already exists
  const { data: existingProfile } = await supabase
    .from('profiles')
    .select('id')
    .eq('id', user.id)
    .single()

  // Prepare profile data with new fields
  const profileData = {
    name,
    email: user.email || '',
    university_id,
    phone,
    gender,
    department,
    designation,
    seating_location: seating_location || null,
    building_name: building_name || null,
    floor_number: floor_number ? parseInt(floor_number) : null,
    room_number: room_number ? parseInt(room_number) : null,
    cabin: seating_location === 'cabin' ? specific_location : null,
    cubicle: seating_location === 'cubicle' ? specific_location : null,
    workstation: seating_location === 'workstation' ? specific_location : null
  }

  if (existingProfile) {
    // Update existing profile
    const { error } = await supabase
      .from('profiles')
      .update(profileData)
      .eq('id', user.id)

    if (error) {
      console.error('Profile update error:', error)
      return { error: 'Failed to update profile. Please try again.' }
    }
  } else {
    // Insert new profile
    const { error } = await supabase
      .from('profiles')
      .insert({
        ...profileData,
        id: user.id,
        role: 'faculty' // default role
      })

    if (error) {
      console.error('Profile insert error:', error)
      return { error: 'Failed to create profile. Please try again.' }
    }
  }

  return { success: true }
} 