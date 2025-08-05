'use server'

import { createClient } from '@/utils/supabase/server'

export interface ResourceWithDetails {
  id: string
  name: string
  type: string
  capacity: number | null
  description: string | null
  equipment: string | null
  is_active: boolean
  created_at: string
  building: {
    id: string
    name: string
    code: string
  }
  floor: {
    id: string
    floor_number: number
    name: string | null
  }
  location: string
  status: string
  equipmentList: string[]
}

export async function getAllResources(): Promise<ResourceWithDetails[]> {
  const supabase = await createClient()

  try {
    const { data: resources, error: resourcesError } = await supabase
      .from('resources')
      .select(`
        id,
        name,
        type,
        capacity,
        description,
        equipment,
        is_active,
        created_at,
        buildings (
          id,
          name,
          code
        ),
        floors (
          id,
          floor_number,
          name
        )
      `)
      .eq('is_active', true)
      .order('name')

    if (resourcesError) {
      console.error('Error fetching resources:', resourcesError)
      throw new Error(`Failed to fetch resources: ${resourcesError.message}`)
    }

    if (!resources) {
      return []
    }

    // Transform the data to match the expected format
    const transformedResources: ResourceWithDetails[] = resources.map((resource) => {
      const building = Array.isArray(resource.buildings) ? resource.buildings[0] : resource.buildings
      const floor = Array.isArray(resource.floors) ? resource.floors[0] : resource.floors
      
      return {
        id: resource.id,
        name: resource.name,
        type: resource.type,
        capacity: resource.capacity,
        description: resource.description,
        equipment: resource.equipment,
        is_active: resource.is_active,
        created_at: resource.created_at,
        building: building || { id: '', name: 'Unknown Building', code: '' },
        floor: floor || { id: '', floor_number: 0, name: null },
        location: `${building?.name || 'Unknown Building'} - ${floor?.name || `Floor ${floor?.floor_number}`}`,
        status: 'Available', // Default status - will be enhanced with booking logic later
        equipmentList: resource.equipment ? resource.equipment.split(',').map((item: string) => item.trim()) : []
      }
    })

    return transformedResources
  } catch (error) {
    console.error('Error in getAllResources:', error)
    throw error
  }
}

export async function getResourceTypes(): Promise<string[]> {
  const supabase = await createClient()

  try {
    const { data, error } = await supabase
      .from('resources')
      .select('type')
      .eq('is_active', true)

    if (error) {
      console.error('Error fetching resource types:', error)
      return []
    }

    // Get unique types and format them
    const types = [...new Set(data.map(resource => resource.type))]
    return ['All', ...types]
  } catch (error) {
    console.error('Error in getResourceTypes:', error)
    return ['All']
  }
}

export async function getBuildings(): Promise<string[]> {
  const supabase = await createClient()

  try {
    const { data, error } = await supabase
      .from('buildings')
      .select('name')
      .eq('is_active', true)
      .order('name')

    if (error) {
      console.error('Error fetching buildings:', error)
      return []
    }

    return ['All', ...data.map(building => building.name)]
  } catch (error) {
    console.error('Error in getBuildings:', error)
    return ['All']
  }
} 