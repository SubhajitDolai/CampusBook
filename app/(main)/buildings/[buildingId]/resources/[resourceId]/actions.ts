'use server'

import { createClient } from '@/utils/supabase/server'
import { calculateDynamicStatus } from '@/lib/dynamic-status'

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
        is_active
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

export async function getResourceDetails(resourceId: string) {
  const supabase = await createClient()

  try {
    const { data: resource, error } = await supabase
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
      .eq('id', resourceId)
      .eq('is_active', true)
      .single()

    if (error) {
      console.error('Error fetching resource:', error)
      return null
    }

    return resource
  } catch (error) {
    console.error('Error in getResourceDetails:', error)
    return null
  }
}

export async function getResourceWithDetails(resourceId: string) {
  const supabase = await createClient()

  try {
    const { data: resource, error: resourceError } = await supabase
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
      .eq('id', resourceId)
      .eq('is_active', true)
      .single()

    if (resourceError) {
      console.error('Error fetching resource:', resourceError)
      return null
    }

    // Get floor details for location info
    const { data: floor, error: floorError } = await supabase
      .from('floors')
      .select(`
        id,
        floor_number,
        name
      `)
      .eq('id', resource.floor_id)
      .eq('is_active', true)
      .single()

    if (floorError) {
      console.error('Error fetching floor:', floorError)
    }

    // Get building details
    const { data: building, error: buildingError } = await supabase
      .from('buildings')
      .select(`
        id,
        name,
        code
      `)
      .eq('id', resource.building_id)
      .eq('is_active', true)
      .single()

    if (buildingError) {
      console.error('Error fetching building:', buildingError)
    }



    // Fetch active bookings for dynamic status calculation (only approved bookings)
    const { data: allBookings, error: allBookingsError } = await supabase
      .from('bookings')
      .select('start_date, end_date, start_time, end_time, status, weekdays')
      .eq('resource_id', resourceId)
      .eq('status', 'approved')  // Only approved bookings affect resource status
      .gte('end_date', new Date().toISOString().split('T')[0])

    if (allBookingsError) {
      console.error('Error fetching bookings for status:', allBookingsError)
    }

    // Calculate dynamic status
    const dynamicStatus = calculateDynamicStatus(resource.status, allBookings || [])

    // Enhance resource with additional details
    const enhancedResource = {
      ...resource,
      location: `${building?.name || 'Unknown Building'} - ${floor?.name || `Floor ${floor?.floor_number}`}`,
      floor: floor?.name || `Floor ${floor?.floor_number}`,
      status: dynamicStatus,
      equipmentList: resource.equipment ? resource.equipment.split(',').map((item: string) => item.trim()) : []
    }

    return enhancedResource
  } catch (error) {
    console.error('Error in getResourceWithDetails:', error)
    return null
  }
}

export async function createBooking(formData: FormData) {
  const supabase = await createClient()

  try {
    const resourceId = formData.get('resourceId') as string
    const startDate = formData.get('startDate') as string
    const endDate = formData.get('endDate') as string
    const startTime = formData.get('startTime') as string
    const endTime = formData.get('endTime') as string
    const reason = formData.get('reason') as string
    const weekdaysJson = formData.get('weekdays') as string
    const facultyName = formData.get('facultyName') as string
    const subject = formData.get('subject') as string
    const className = formData.get('className') as string
    
    if (!resourceId || !startDate || !endDate || !startTime || !endTime || !reason || !weekdaysJson || !subject || !className) {
      return { error: 'All fields are required' }
    }

    // Parse weekdays array
    let weekdays: number[]
    try {
      weekdays = JSON.parse(weekdaysJson)
      if (!Array.isArray(weekdays) || weekdays.length === 0) {
        return { error: 'Please select at least one day of the week' }
      }
    } catch {
      return { error: 'Invalid weekdays format' }
    }

    // Get current user ID from authentication
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    
    if (userError || !user) {
      console.error('Error getting user:', userError)
      return { error: 'User not authenticated' }
    }

    // Verify that the resource exists and is active
    const { data: resource, error: resourceError } = await supabase
      .from('resources')
      .select('id, name, is_active')
      .eq('id', resourceId)
      .eq('is_active', true)
      .single()

    if (resourceError || !resource) {
      console.error('Error verifying resource:', resourceError)
      return { error: 'Resource not found or inactive' }
    }

    // Log the booking data for debugging
    const { data, error } = await supabase
      .from('bookings')
      .insert({
        resource_id: resourceId,
        user_id: user.id,
        start_date: startDate,
        end_date: endDate,
        start_time: startTime,
        end_time: endTime,
        reason: reason,
        weekdays: weekdays,
        faculty_name: facultyName,
        subject: subject,
        class_name: className,
        status: 'pending'
      })
      .select()
      .single()

    if (error) {
      console.error('Error creating booking:', error)
      return { error: `Failed to create booking: ${error.message}` }
    }

    return { data }
  } catch (error) {
    console.error('Error in createBooking:', error)
    return { error: 'Failed to create booking' }
  }
}

export async function getResourceBookings(resourceId: string) {
  const supabase = await createClient()

  try {
    // First, get the bookings
    const { data: bookings, error: bookingsError } = await supabase
      .from('bookings')
      .select(`
        id,
        start_date,
        end_date,
        start_time,
        end_time,
        reason,
        status,
        created_at,
        user_id,
        weekdays,
        faculty_name,
        subject,
        class_name
      `)
      .eq('resource_id', resourceId)
      .gte('end_date', new Date().toISOString().split('T')[0]) // Only show current and future bookings
      .order('start_date', { ascending: true })
      .order('start_time', { ascending: true })

    if (bookingsError) {
      console.error('Error fetching resource bookings:', bookingsError)
      console.error('Error details:', JSON.stringify(bookingsError, null, 2))
      return []
    }

    if (!bookings || bookings.length === 0) {
      return []
    }

    // Get user IDs from bookings
    const userIds = bookings.map(booking => booking.user_id)

    // Fetch user profiles
    const { data: profiles, error: profilesError } = await supabase
      .from('profiles')
      .select('id, name, email, department, seating_location, building_name, floor_number, room_number, cabin, cubicle, workstation')
      .in('id', userIds)

    if (profilesError) {
      console.error('Error fetching profiles:', profilesError)
      console.error('Profile error details:', JSON.stringify(profilesError, null, 2))
      // Return bookings with fallback profile data
      return bookings.map(booking => ({
        ...booking,
        profiles: {
          id: booking.user_id,
          name: 'Unknown User',
          email: 'unknown@example.com',
          department: 'Unknown Department',
          seating_location: null,
          building_name: null,
          floor_number: null,
          room_number: null,
          cabin: null,
          cubicle: null,
          workstation: null
        }
      }))
    }

    // Create a map of user profiles
    const profilesMap = new Map(profiles?.map(profile => [profile.id, profile]) || [])

    // Combine bookings with profile data
    const bookingsWithProfiles = bookings.map(booking => ({
      ...booking,
      profiles: profilesMap.get(booking.user_id) || {
        id: booking.user_id,
        name: 'Unknown User',
        email: 'unknown@example.com',
        department: 'Unknown Department',
        seating_location: null,
        building_name: null,
        floor_number: null,
        room_number: null,
        cabin: null,
        cubicle: null,
        workstation: null
      }
    }))

    return bookingsWithProfiles
  } catch (error) {
    console.error('Error in getResourceBookings:', error)
    console.error('Full error details:', JSON.stringify(error, null, 2))
    return []
  }
} 