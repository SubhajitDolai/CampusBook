'use server'

import { createClient } from '@/utils/supabase/server'

export async function getBuildingDetails(buildingId: string) {
  const supabase = await createClient()

  try {
    const { data: building, error } = await supabase
      .from('buildings')
      .select(`
        id,
        name,
        code,
        description,
        is_active
      `)
      .eq('id', buildingId)
      .eq('is_active', true)
      .single()

    if (error) {
      console.error('Error fetching building:', error)
      return null
    }

    return building
  } catch (error) {
    console.error('Error in getBuildingDetails:', error)
    return null
  }
}

export async function getBuildingResources(buildingId: string) {
  const supabase = await createClient()

  try {
    const { data: resources, error } = await supabase
      .from('resources')
      .select(`
        id,
        building_id,
        floor_id,
        name,
        type,
        capacity,
        description,
        equipment,
        is_active,
        created_at,
        floors (
          id,
          floor_number,
          name
        )
      `)
      .eq('building_id', buildingId)
      .eq('is_active', true)
      .order('name')

    if (error) {
      console.error('Error fetching building resources:', error)
      return []
    }

    // Enhance resources with floor information and status
    const enhancedResources = resources?.map(resource => {
      const floor = Array.isArray(resource.floors) ? resource.floors[0] : resource.floors
      return {
        ...resource,
        floor: floor?.name || `Floor ${floor?.floor_number}`,
        status: 'Available', // Default status - will be enhanced with booking logic later
        equipmentList: resource.equipment ? resource.equipment.split(',').map((item: string) => item.trim()) : []
      }
    }) || []

    return enhancedResources
  } catch (error) {
    console.error('Error in getBuildingResources:', error)
    return []
  }
}

export async function getResourceTypes() {
  const supabase = await createClient()

  try {
    const { data, error } = await supabase
      .from('resources')
      .select('type')
      .eq('is_active', true)

    if (error) {
      console.error('Error fetching resource types:', error)
      return ['All']
    }

    // Get unique types and add 'All' option
    const types = ['All', ...Array.from(new Set(data?.map(r => r.type) || []))]
    return types
  } catch (error) {
    console.error('Error in getResourceTypes:', error)
    return ['All']
  }
}

export async function getFloorsByBuilding(buildingId: string) {
  const supabase = await createClient()

  try {
    const { data: floors, error } = await supabase
      .from('floors')
      .select(`
        id,
        floor_number,
        name,
        is_active
      `)
      .eq('building_id', buildingId)
      .eq('is_active', true)
      .order('floor_number')

    if (error) {
      console.error('Error fetching floors:', error)
      return ['All']
    }

    // Get floor names and add 'All' option
    const floorNames = ['All', ...floors?.map(floor => floor.name || `Floor ${floor.floor_number}`) || []]
    return floorNames
  } catch (error) {
    console.error('Error in getFloorsByBuilding:', error)
    return ['All']
  }
}

export async function searchBuildingResources(buildingId: string, searchTerm?: string, type?: string, floor?: string) {
  const supabase = await createClient()

  try {
    let query = supabase
      .from('resources')
      .select(`
        id,
        building_id,
        floor_id,
        name,
        type,
        capacity,
        description,
        equipment,
        is_active,
        created_at,
        floors (
          id,
          floor_number,
          name
        )
      `)
      .eq('building_id', buildingId)
      .eq('is_active', true)

    // Apply filters
    if (type && type !== 'All') {
      query = query.eq('type', type)
    }

    if (floor && floor !== 'All') {
      // We need to join with floors table to filter by floor name
      // For now, we'll filter client-side after fetching
    }

    const { data: resources, error } = await query.order('name')

    if (error) {
      console.error('Error searching building resources:', error)
      return []
    }

    // Enhance resources with floor information and status
    let enhancedResources = resources?.map(resource => {
      const floor = Array.isArray(resource.floors) ? resource.floors[0] : resource.floors
      return {
        ...resource,
        floor: floor?.name || `Floor ${floor?.floor_number}`,
        status: 'Available', // Default status - will be enhanced with booking logic later
        equipmentList: resource.equipment ? resource.equipment.split(',').map((item: string) => item.trim()) : []
      }
    }) || []

    // Apply floor filter client-side (since we can't easily filter by floor name in the query)
    if (floor && floor !== 'All') {
      enhancedResources = enhancedResources.filter(resource => resource.floor === floor)
    }

    // Apply search filter client-side
    if (searchTerm) {
      const searchLower = searchTerm.toLowerCase()
      enhancedResources = enhancedResources.filter(resource => 
        resource.name.toLowerCase().includes(searchLower) ||
        resource.description.toLowerCase().includes(searchLower)
      )
    }

    return enhancedResources
  } catch (error) {
    console.error('Error in searchBuildingResources:', error)
    return []
  }
} 