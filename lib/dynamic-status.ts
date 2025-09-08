// Dynamic resource status calculation based on APPROVED bookings only

export interface Booking {
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  status: 'pending' | 'approved' | 'rejected' | 'cancelled'
}

export function calculateDynamicStatus(
  manualStatus: string | null,
  bookings: Booking[] = []
): string {
  // If manually set to Maintenance or Unavailable, respect that
  if (manualStatus === 'Maintenance' || manualStatus === 'Unavailable') {
    return manualStatus
  }

  // Get current date and time
  const now = new Date()
  const currentDate = now.toISOString().split('T')[0] // YYYY-MM-DD
  const currentTime = now.toTimeString().split(' ')[0].substring(0, 5) // HH:MM

  // Check if resource is currently in use based on APPROVED bookings only
  const isCurrentlyInUse = bookings.some(booking => {
    // Only check APPROVED bookings (pending bookings don't affect resource status)
    if (booking.status !== 'approved') {
      return false
    }

    const startDate = booking.start_date
    const endDate = booking.end_date
    const startTime = booking.start_time
    const endTime = booking.end_time

    // Check if current date is within booking date range
    const isWithinDateRange = currentDate >= startDate && currentDate <= endDate

    if (!isWithinDateRange) {
      return false
    }

    // Check if current time is within booking time range
    const isWithinTimeRange = currentTime >= startTime && currentTime <= endTime

    return isWithinTimeRange
  })

  return isCurrentlyInUse ? 'In Use' : 'Available'
}

export function getResourceStatusWithBookings(
  manualStatus: string | null,
  bookings: Booking[] = []
): string {
  return calculateDynamicStatus(manualStatus, bookings)
}
