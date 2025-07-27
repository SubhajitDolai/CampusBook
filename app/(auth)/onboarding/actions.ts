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

  if (existingProfile) {
    // Update existing profile
    const { error } = await supabase
      .from('profiles')
      .update({
        name,
        email: user.email || '',
        university_id,
        phone,
        gender,
        department,
        designation
      })
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
        id: user.id,
        name,
        email: user.email || '',
        university_id,
        phone,
        gender,
        department,
        designation,
        role: 'faculty' // default role
      })

    if (error) {
      console.error('Profile insert error:', error)
      return { error: 'Failed to create profile. Please try again.' }
    }
  }

  return { success: true }
} 