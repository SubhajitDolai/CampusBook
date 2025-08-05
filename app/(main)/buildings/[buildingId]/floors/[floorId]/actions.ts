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

export async function getFloorDetails(floorId: string) {
  const supabase = await createClient()

  try {
    const { data: floor, error } = await supabase
      .from('floors')
      .select(`
        id,
        building_id,
        floor_number,
        name,
        is_active,
        created_at
      `)
      .eq('id', floorId)
      .eq('is_active', true)
      .single()

    if (error) {
      console.error('Error fetching floor:', error)
      return null
    }

    return floor
  } catch (error) {
    console.error('Error in getFloorDetails:', error)
    return null
  }
}

export async function getFloorWithStats(floorId: string) {
  const supabase = await createClient()

  try {
    // Get floor details
    const { data: floor, error: floorError } = await supabase
      .from('floors')
      .select(`
        id,
        building_id,
        floor_number,
        name,
        is_active,
        created_at
      `)
      .eq('id', floorId)
      .eq('is_active', true)
      .single()

    if (floorError) {
      console.error('Error fetching floor:', floorError)
      return null
    }

    // Get resource count for this floor
    const { count: resourceCount, error: resourceError } = await supabase
      .from('resources')
      .select('*', { count: 'exact', head: true })
      .eq('floor_id', floorId)
      .eq('is_active', true)

    if (resourceError) {
      console.error('Error fetching resource count:', resourceError)
    }

    return {
      ...floor,
      resources: resourceCount || 0,
      description: `${floor.name || `Floor ${floor.floor_number}`} - ${resourceCount || 0} resources available`
    }
  } catch (error) {
    console.error('Error in getFloorWithStats:', error)
    return null
  }
}

export async function getResourcesByFloor(floorId: string) {
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
        created_at
      `)
      .eq('floor_id', floorId)
      .eq('is_active', true)
      .order('name')

    if (error) {
      console.error('Error fetching resources:', error)
      return []
    }

    return resources || []
  } catch (error) {
    console.error('Error in getResourcesByFloor:', error)
    return []
  }
}

export async function getResourcesWithStatus(floorId: string) {
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
        created_at
      `)
      .eq('floor_id', floorId)
      .eq('is_active', true)
      .order('name')

    if (error) {
      console.error('Error fetching resources:', error)
      return []
    }

    // For now, we'll mark all resources as 'Available'
    // Later we can add booking status logic
    const resourcesWithStatus = resources?.map(resource => ({
      ...resource,
      status: 'Available' // This will be enhanced with booking logic later
    })) || []

    return resourcesWithStatus
  } catch (error) {
    console.error('Error in getResourcesWithStatus:', error)
    return []
  }
} 