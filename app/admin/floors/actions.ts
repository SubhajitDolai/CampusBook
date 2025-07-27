'use server'

import { createClient } from '@/utils/supabase/server'

export async function getFloors() {
  try {
    const supabase = await createClient()
    
    const { data, error } = await supabase
      .from('floors')
      .select(`
        *,
        buildings (
          name,
          code
        )
      `)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching floors:', error)
      return []
    }

    return data || []
  } catch (error) {
    console.error('Error fetching floors:', error)
    return []
  }
}

export async function addFloor(formData: FormData) {
  try {
    const supabase = await createClient()
    
    const building_id = formData.get('building_id') as string
    const floor_number = parseInt(formData.get('floor_number') as string)
    const name = formData.get('name') as string
    const is_active = formData.get('is_active') === 'true'

    if (!building_id || !floor_number) {
      return { error: 'Building and floor number are required' }
    }

    // Check if floor number already exists for this building
    const { data: existingFloor } = await supabase
      .from('floors')
      .select('id')
      .eq('building_id', building_id)
      .eq('floor_number', floor_number)
      .single()

    if (existingFloor) {
      return { error: 'Floor number already exists for this building' }
    }

    const { data, error } = await supabase
      .from('floors')
      .insert({
        building_id,
        floor_number,
        name: name || null,
        is_active
      })
      .select()
      .single()

    if (error) {
      console.error('Error adding floor:', error)
      return { error: error.message }
    }

    return { success: true, data }
  } catch (error) {
    console.error('Error adding floor:', error)
    return { error: 'Failed to add floor' }
  }
}

export async function updateFloor(id: string, formData: FormData) {
  try {
    const supabase = await createClient()
    
    const building_id = formData.get('building_id') as string
    const floor_number = parseInt(formData.get('floor_number') as string)
    const name = formData.get('name') as string
    const is_active = formData.get('is_active') === 'true'

    if (!building_id || !floor_number) {
      return { error: 'Building and floor number are required' }
    }

    // Check if floor number already exists for this building (excluding current floor)
    const { data: existingFloor } = await supabase
      .from('floors')
      .select('id')
      .eq('building_id', building_id)
      .eq('floor_number', floor_number)
      .neq('id', id)
      .single()

    if (existingFloor) {
      return { error: 'Floor number already exists for this building' }
    }

    const { data, error } = await supabase
      .from('floors')
      .update({
        building_id,
        floor_number,
        name: name || null,
        is_active
      })
      .eq('id', id)
      .select()
      .single()

    if (error) {
      console.error('Error updating floor:', error)
      return { error: error.message }
    }

    return { success: true, data }
  } catch (error) {
    console.error('Error updating floor:', error)
    return { error: 'Failed to update floor' }
  }
}

export async function deleteFloor(id: string) {
  try {
    const supabase = await createClient()
    
    const { error } = await supabase
      .from('floors')
      .delete()
      .eq('id', id)

    if (error) {
      console.error('Error deleting floor:', error)
      return { error: error.message }
    }

    return { success: true }
  } catch (error) {
    console.error('Error deleting floor:', error)
    return { error: 'Failed to delete floor' }
  }
}

export async function getBuildings() {
  try {
    const supabase = await createClient()
    
    const { data, error } = await supabase
      .from('buildings')
      .select('id, name, code')
      .eq('is_active', true)
      .order('name', { ascending: true })

    if (error) {
      console.error('Error fetching buildings:', error)
      return []
    }

    return data || []
  } catch (error) {
    console.error('Error fetching buildings:', error)
    return []
  }
} 