'use server'

import { createClient } from '@/utils/supabase/server'

export async function getActiveBuildings() {
  const supabase = await createClient()

  try {
    const { data: buildings, error } = await supabase
      .from('buildings')
      .select(`
        id,
        name,
        code,
        description,
        is_active,
        created_at
      `)
      .eq('is_active', true)
      .order('name')

    if (error) {
      console.error('Error fetching buildings:', error)
      return []
    }

    return buildings || []
  } catch (error) {
    console.error('Error in getActiveBuildings:', error)
    return []
  }
}

export async function getBuildingsWithStats() {
  const supabase = await createClient()

  try {
    // Get buildings with floor and resource counts
    const { data: buildings, error: buildingsError } = await supabase
      .from('buildings')
      .select(`
        id,
        name,
        code,
        description,
        is_active,
        created_at
      `)
      .eq('is_active', true)
      .order('name')

    if (buildingsError) {
      console.error('Error fetching buildings:', buildingsError)
      return []
    }

    // Get floor counts for each building
    const { data: floorCounts, error: floorError } = await supabase
      .from('floors')
      .select('building_id')
      .eq('is_active', true)

    if (floorError) {
      console.error('Error fetching floor counts:', floorError)
    }

    // Get resource counts for each building
    const { data: resourceCounts, error: resourceError } = await supabase
      .from('resources')
      .select('building_id')
      .eq('is_active', true)

    if (resourceError) {
      console.error('Error fetching resource counts:', resourceError)
    }

    // Combine the data
    const buildingsWithStats = buildings?.map(building => {
      const floorCount = floorCounts?.filter(f => f.building_id === building.id).length || 0
      const resourceCount = resourceCounts?.filter(r => r.building_id === building.id).length || 0
      
      return {
        ...building,
        floors: floorCount,
        totalResources: resourceCount
      }
    }) || []

    return buildingsWithStats
  } catch (error) {
    console.error('Error in getBuildingsWithStats:', error)
    return []
  }
}

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
        is_active,
        created_at
      `)
      .eq('id', buildingId)
      .eq('is_active', true)
      .single()

    if (error) {
      console.error('Error fetching building details:', error)
      return null
    }

    return building
  } catch (error) {
    console.error('Error in getBuildingDetails:', error)
    return null
  }
}

export async function getBuildingWithStats(buildingId: string) {
  const supabase = await createClient()

  try {
    // Get building details
    const { data: building, error: buildingError } = await supabase
      .from('buildings')
      .select(`
        id,
        name,
        code,
        description,
        is_active,
        created_at
      `)
      .eq('id', buildingId)
      .eq('is_active', true)
      .single()

    if (buildingError) {
      console.error('Error fetching building:', buildingError)
      return null
    }

    // Get floor count
    const { count: floorCount, error: floorError } = await supabase
      .from('floors')
      .select('*', { count: 'exact', head: true })
      .eq('building_id', buildingId)
      .eq('is_active', true)

    if (floorError) {
      console.error('Error fetching floor count:', floorError)
    }

    // Get resource count
    const { count: resourceCount, error: resourceError } = await supabase
      .from('resources')
      .select('*', { count: 'exact', head: true })
      .eq('building_id', buildingId)
      .eq('is_active', true)

    if (resourceError) {
      console.error('Error fetching resource count:', resourceError)
    }

    return {
      ...building,
      floors: floorCount || 0,
      totalResources: resourceCount || 0
    }
  } catch (error) {
    console.error('Error in getBuildingWithStats:', error)
    return null
  }
}

export async function getFloorsWithStats(buildingId: string) {
  const supabase = await createClient()

  try {
    // Get floors
    const { data: floors, error: floorsError } = await supabase
      .from('floors')
      .select(`
        id,
        building_id,
        floor_number,
        name,
        is_active,
        created_at
      `)
      .eq('building_id', buildingId)
      .eq('is_active', true)
      .order('floor_number')

    if (floorsError) {
      console.error('Error fetching floors:', floorsError)
      return []
    }

    // Get resource counts for each floor
    const { data: resourceCounts, error: resourceError } = await supabase
      .from('resources')
      .select('floor_id')
      .eq('building_id', buildingId)
      .eq('is_active', true)

    if (resourceError) {
      console.error('Error fetching resource counts:', resourceError)
    }

    // Combine the data
    const floorsWithStats = floors?.map(floor => {
      const resourceCount = resourceCounts?.filter(r => r.floor_id === floor.id).length || 0
      
      return {
        ...floor,
        resources: resourceCount,
        description: `${floor.name || `Floor ${floor.floor_number}`} - ${resourceCount} resources available`
      }
    }) || []

    return floorsWithStats
  } catch (error) {
    console.error('Error in getFloorsWithStats:', error)
    return []
  }
} 