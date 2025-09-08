'use server'

import { createClient } from '@/utils/supabase/server'
import { calculateDynamicStatus, type Booking } from '@/lib/dynamic-status'

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
        status,
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

    // Get all resource IDs to fetch their bookings
    const resourceIds = resources.map(r => r.id)
    
    // Fetch active bookings for all resources (only approved bookings)
    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select('resource_id, start_date, end_date, start_time, end_time, status, weekdays')
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

    // Transform the data to match the expected format
    const transformedResources: ResourceWithDetails[] = resources.map((resource) => {
      const building = Array.isArray(resource.buildings) ? resource.buildings[0] : resource.buildings
      const floor = Array.isArray(resource.floors) ? resource.floors[0] : resource.floors
      
      // Get bookings for this resource
      const resourceBookings = bookingsByResource.get(resource.id) || []
      
      // Calculate dynamic status
      const dynamicStatus = calculateDynamicStatus(resource.status, resourceBookings)
      
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
        status: dynamicStatus,
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