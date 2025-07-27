'use server'

import { createClient } from '@/utils/supabase/server'

export async function getResources() {
  try {
    const supabase = await createClient()
    
    const { data, error } = await supabase
      .from('resources')
      .select(`
        *,
        buildings (
          name,
          code
        ),
        floors (
          floor_number,
          name
        )
      `)
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching resources:', error)
      return []
    }

    return data || []
  } catch (error) {
    console.error('Error fetching resources:', error)
    return []
  }
}

export async function addResource(formData: FormData) {
  try {
    const supabase = await createClient()
    
    const building_id = formData.get('building_id') as string
    const floor_id = formData.get('floor_id') as string
    const name = formData.get('name') as string
    const type = formData.get('type') as string
    const capacity = formData.get('capacity') as string
    const description = formData.get('description') as string
    const equipment = formData.get('equipment') as string
    const is_active = formData.get('is_active') === 'true'

    if (!building_id || !floor_id || !name || !type) {
      return { error: 'Building, floor, name, and type are required' }
    }

    // Check if resource name already exists for this floor
    const { data: existingResource } = await supabase
      .from('resources')
      .select('id')
      .eq('floor_id', floor_id)
      .eq('name', name.trim())
      .single()

    if (existingResource) {
      return { error: 'Resource name already exists for this floor' }
    }

    const { data, error } = await supabase
      .from('resources')
      .insert({
        building_id,
        floor_id,
        name: name.trim(),
        type,
        capacity: capacity ? parseInt(capacity) : null,
        description: description.trim() || null,
        equipment: equipment.trim() || null,
        is_active
      })
      .select()
      .single()

    if (error) {
      console.error('Error adding resource:', error)
      return { error: error.message }
    }

    return { success: true, data }
  } catch (error) {
    console.error('Error adding resource:', error)
    return { error: 'Failed to add resource' }
  }
}

export async function updateResource(id: string, formData: FormData) {
  try {
    const supabase = await createClient()
    
    const building_id = formData.get('building_id') as string
    const floor_id = formData.get('floor_id') as string
    const name = formData.get('name') as string
    const type = formData.get('type') as string
    const capacity = formData.get('capacity') as string
    const description = formData.get('description') as string
    const equipment = formData.get('equipment') as string
    const is_active = formData.get('is_active') === 'true'

    if (!building_id || !floor_id || !name || !type) {
      return { error: 'Building, floor, name, and type are required' }
    }

    // Check if resource name already exists for this floor (excluding current resource)
    const { data: existingResource } = await supabase
      .from('resources')
      .select('id')
      .eq('floor_id', floor_id)
      .eq('name', name.trim())
      .neq('id', id)
      .single()

    if (existingResource) {
      return { error: 'Resource name already exists for this floor' }
    }

    const { data, error } = await supabase
      .from('resources')
      .update({
        building_id,
        floor_id,
        name: name.trim(),
        type,
        capacity: capacity ? parseInt(capacity) : null,
        description: description.trim() || null,
        equipment: equipment.trim() || null,
        is_active
      })
      .eq('id', id)
      .select()
      .single()

    if (error) {
      console.error('Error updating resource:', error)
      return { error: error.message }
    }

    return { success: true, data }
  } catch (error) {
    console.error('Error updating resource:', error)
    return { error: 'Failed to update resource' }
  }
}

export async function deleteResource(id: string) {
  try {
    const supabase = await createClient()
    
    const { error } = await supabase
      .from('resources')
      .delete()
      .eq('id', id)

    if (error) {
      console.error('Error deleting resource:', error)
      return { error: error.message }
    }

    return { success: true }
  } catch (error) {
    console.error('Error deleting resource:', error)
    return { error: 'Failed to delete resource' }
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

export async function getFloors() {
  try {
    const supabase = await createClient()
    
    const { data, error } = await supabase
      .from('floors')
      .select('id, building_id, floor_number, name')
      .eq('is_active', true)
      .order('building_id', { ascending: true })
      .order('floor_number', { ascending: true })

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