'use server'

import { createClient } from '@/utils/supabase/server'
import { calculateDynamicStatus, type Booking } from '@/lib/dynamic-status'

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
        created_at,
        status
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
        created_at,
        status
      `)
      .eq('floor_id', floorId)
      .eq('is_active', true)
      .order('name')

    if (error) {
      console.error('Error fetching resources:', error)
      return []
    }

    if (!resources) {
      return []
    }

    // Get all resource IDs to fetch their bookings
    const resourceIds = resources.map(r => r.id)
    
    // Fetch active bookings for all resources (only approved bookings)
    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select('resource_id, start_date, end_date, start_time, end_time, status')
      .in('resource_id', resourceIds)
      .eq('status', 'approved')  // Only approved bookings affect resource status
      .gte('end_date', new Date().toISOString().split('T')[0])

    if (bookingsError) {
      console.error('Error fetching bookings:', bookingsError)
    }

    // Group bookings by resource_id
    const bookingsByResource = new Map<string, Booking[]>()
    bookings?.forEach(booking => {
      if (!bookingsByResource.has(booking.resource_id)) {
        bookingsByResource.set(booking.resource_id, [])
      }
      bookingsByResource.get(booking.resource_id)?.push(booking)
    })

    // Use database status with dynamic calculation based on bookings
    const resourcesWithStatus = resources?.map(resource => {
      // Get bookings for this resource
      const resourceBookings = bookingsByResource.get(resource.id) || []
      
      // Calculate dynamic status
      const dynamicStatus = calculateDynamicStatus(resource.status, resourceBookings)
      
      return {
        ...resource,
        status: dynamicStatus
      }
    }) || []

    return resourcesWithStatus
  } catch (error) {
    console.error('Error in getResourcesWithStatus:', error)
    return []
  }
} 