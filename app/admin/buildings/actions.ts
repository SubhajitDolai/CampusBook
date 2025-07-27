'use server'

import { createClient } from '@/utils/supabase/server'

export async function getBuildings() {
  const supabase = await createClient()

  const { data: buildings, error } = await supabase
    .from('buildings')
    .select('*')
    .order('name')

  if (error) {
    console.error('Error fetching buildings:', error)
    return []
  }

  return buildings || []
}

export async function addBuilding(formData: FormData) {
  const supabase = await createClient()

  const name = formData.get('name') as string
  const code = formData.get('code') as string
  const description = formData.get('description') as string
  const is_active = formData.get('is_active') === 'true'

  if (!name || !code) {
    return { error: 'Name and code are required' }
  }

  const { data, error } = await supabase
    .from('buildings')
    .insert({
      name,
      code,
      description: description || null,
      is_active
    })
    .select()
    .single()

  if (error) {
    console.error('Error adding building:', error)
    return { error: 'Failed to add building' }
  }

  return { data }
}

export async function updateBuilding(id: string, formData: FormData) {
  const supabase = await createClient()

  const name = formData.get('name') as string
  const code = formData.get('code') as string
  const description = formData.get('description') as string
  const is_active = formData.get('is_active') === 'true'

  if (!name || !code) {
    return { error: 'Name and code are required' }
  }

  const { data, error } = await supabase
    .from('buildings')
    .update({
      name,
      code,
      description: description || null,
      is_active
    })
    .eq('id', id)
    .select()
    .single()

  if (error) {
    console.error('Error updating building:', error)
    return { error: 'Failed to update building' }
  }

  return { data }
}

export async function deleteBuilding(id: string) {
  const supabase = await createClient()

  const { error } = await supabase
    .from('buildings')
    .delete()
    .eq('id', id)

  if (error) {
    console.error('Error deleting building:', error)
    return { error: 'Failed to delete building' }
  }

  return { success: true }
}

export async function getBuildingStats() {
  const supabase = await createClient()

  const { data: buildings, error } = await supabase
    .from('buildings')
    .select('is_active')

  if (error) {
    console.error('Error fetching building stats:', error)
    return { total: 0, active: 0, inactive: 0 }
  }

  const total = buildings?.length || 0
  const active = buildings?.filter(b => b.is_active).length || 0
  const inactive = total - active

  return { total, active, inactive }
} 