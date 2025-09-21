'use server'

import { createClient } from '@/utils/supabase/server'
import { getISTDateString } from '@/lib/ist'
import { redirect } from 'next/navigation'
import { calculateDynamicStatus, type Booking } from '@/lib/dynamic-status'

// Database booking type with resource_id for our queries
interface DatabaseBooking extends Booking {
  resource_id: string
}

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

export interface ResourcesPageData {
  resources: ResourceWithDetails[]
  resourceTypes: string[]
  buildings: string[]
  statuses: string[]
  totalCount: number
  hasMore: boolean
}

export interface PaginatedResourcesData {
  resources: ResourceWithDetails[]
  hasMore: boolean
  totalCount: number
}

const RESOURCES_PER_PAGE = 12 // Pagination size to avoid URL length issues

export async function getInitialResourcesData(): Promise<ResourcesPageData> {
  const supabase = await createClient()

  try {
    // Single auth check
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      redirect('/login')
    }

    // Get filter options first (lightweight queries)
    const [resourceTypesResult, buildingsResult] = await Promise.all([
      supabase
        .from('resources')
        .select('type')
        .eq('is_active', true),
      supabase
        .from('buildings')
        .select('name')
        .eq('is_active', true)
        .order('name')
    ])

    // Extract unique types and buildings
    const resourceTypes = ['All', ...Array.from(new Set(
      (resourceTypesResult.data || []).map(r => r.type)
    )).sort()]

    const buildings = ['All', ...(buildingsResult.data || []).map(b => b.name)]

    // Define available statuses based on the enum from schema
    const statuses = ['All', 'Available', 'In Use', 'Maintenance', 'Unavailable']

    // Get total count
    const { count: totalCount } = await supabase
      .from('resources')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true)

    // Get first page of resources with default filters (no filters)
    const firstPageData = await getPaginatedResources(1, RESOURCES_PER_PAGE, '', 'All', 'All', 'All')

    return {
      resources: firstPageData.resources,
      resourceTypes,
      buildings,
      statuses,
      totalCount: totalCount || 0,
      hasMore: firstPageData.hasMore
    }
  } catch (error) {
    console.error('Error in getInitialResourcesData:', error)
    throw error
  }
}

export async function getPaginatedResources(
  page: number = 1,
  limit: number = RESOURCES_PER_PAGE,
  searchTerm: string = '',
  typeFilter: string = 'All',
  buildingFilter: string = 'All',
  statusFilter: string = 'All'
): Promise<PaginatedResourcesData> {
  const supabase = await createClient()

  try {
    // When status filter is applied, we need to fetch more data because status is calculated dynamically
    // We'll fetch a larger batch and then filter client-side
    const batchSize = statusFilter !== 'All' ? limit * 3 : limit // Fetch 3x more when status filter is active
    const from = (page - 1) * batchSize
    const to = from + batchSize - 1

    let query = supabase
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
        buildings!inner (
          id,
          name,
          code
        ),
        floors (
          id,
          floor_number,
          name
        )
      `, { count: 'exact' })
      .eq('is_active', true)
      .order('created_at', { ascending: false })
      .order('id', { ascending: true }) // Secondary sort for consistency
      .range(from, to)

    // Apply filters
    if (typeFilter !== 'All') {
      query = query.eq('type', typeFilter)
    }

    if (buildingFilter !== 'All') {
      query = query.eq('buildings.name', buildingFilter)
    }

    // Apply search term
    if (searchTerm.trim()) {
      query = query.or(
        `name.ilike.%${searchTerm}%,description.ilike.%${searchTerm}%,equipment.ilike.%${searchTerm}%`
      )
    }

  const { data: resources, error, count } = await query

    if (error) {
      console.error('Error fetching paginated resources:', error)
      throw new Error('Failed to fetch resources')
    }

    const resourcesData = resources || []
    const totalCount = count || 0

    // Get bookings for current page resources only (small batch)
    const resourceIds = resourcesData.map(r => r.id)
    
    let bookings: DatabaseBooking[] = []
    if (resourceIds.length > 0) {
      const { data: bookingsData, error: bookingsError } = await supabase
        .from('bookings')
        .select('resource_id, start_date, end_date, start_time, end_time, status, weekdays')
        .in('resource_id', resourceIds)
        .eq('status', 'approved')
        .gte('end_date', getISTDateString())

      if (bookingsError) {
        console.error('Error fetching bookings:', bookingsError)
      }
      bookings = bookingsData || []
    }

    // Group bookings by resource_id
    const bookingsByResource = new Map<string, Booking[]>()
    bookings.forEach(dbBooking => {
      if (!bookingsByResource.has(dbBooking.resource_id)) {
        bookingsByResource.set(dbBooking.resource_id, [])
      }
      // Convert DatabaseBooking back to Booking for calculateDynamicStatus
      const booking: Booking = {
        start_date: dbBooking.start_date,
        end_date: dbBooking.end_date,
        start_time: dbBooking.start_time,
        end_time: dbBooking.end_time,
        status: dbBooking.status,
        weekdays: dbBooking.weekdays
      }
      bookingsByResource.get(dbBooking.resource_id)?.push(booking)
    })

    // Transform the data
    const transformedResources: ResourceWithDetails[] = resourcesData.map((resource) => {
      const building = Array.isArray(resource.buildings) ? resource.buildings[0] : resource.buildings
      const floor = Array.isArray(resource.floors) ? resource.floors[0] : resource.floors
      
      const resourceBookings = bookingsByResource.get(resource.id) || []
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

    // Apply status filter after transformation (since status is dynamically calculated)
    let filteredResources = transformedResources
    if (statusFilter !== 'All') {
      filteredResources = transformedResources.filter(resource => resource.status === statusFilter)
      
      // When status filtering, trim to requested page size
      const startIndex = 0
      const endIndex = limit
      filteredResources = filteredResources.slice(startIndex, endIndex)
    }

    // Calculate if there are more results
    const hasMore = statusFilter !== 'All' 
      ? filteredResources.length === limit // For status filtering, assume more if we got full page
      : (from + limit) < totalCount

    return {
      resources: filteredResources,
      hasMore,
      totalCount: statusFilter !== 'All' ? filteredResources.length : totalCount
    }
  } catch (error) {
    console.error('Error in getPaginatedResources:', error)
    throw new Error('Failed to fetch resources')
  }
}