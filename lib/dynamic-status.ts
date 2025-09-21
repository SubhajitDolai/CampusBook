// Dynamic resource status calculation based on APPROVED bookings only

export interface Booking {
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  status: 'pending' | 'approved' | 'rejected' | 'cancelled'
  weekdays?: number[] // Array of weekday numbers (1=Sunday, 2=Monday, ..., 7=Saturday)
}

import { getISTDateString, getISTTimeString, getISTDayOfWeek } from './ist'

export function calculateDynamicStatus(
  manualStatus: string | null,
  bookings: Booking[] = []
): string {
  // If manually set to Maintenance or Unavailable, respect that
  if (manualStatus === 'Maintenance' || manualStatus === 'Unavailable') {
    return manualStatus
  }

  // Use IST-based current date/time/day
  const currentDate = getISTDateString() // YYYY-MM-DD in IST
  const currentTime = getISTTimeString() // HH:MM in IST
  const currentDayOfWeek = getISTDayOfWeek()


  // Helper: normalize a time string (HH:MM or HH:MM:SS) to seconds since midnight
  function normalizeTimeToSeconds(t: string): number {
    if (!t) return NaN
    const parts = t.split(':').map(p => parseInt(p, 10))
    if (parts.length === 2) {
      const [h, m] = parts
      return (h * 3600) + (m * 60)
    }
    if (parts.length >= 3) {
      const [h, m, s] = parts
      return (h * 3600) + (m * 60) + (s || 0)
    }
    return NaN
  }

  const currentSec = normalizeTimeToSeconds(currentTime)

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
    const weekdays = booking.weekdays || [1, 2, 3, 4, 5, 6, 7] // Default to all days if not specified

    // Check if current date is within booking date range
    const isWithinDateRange = currentDate >= startDate && currentDate <= endDate

    if (!isWithinDateRange) {
      return false
    }

    // Check if current day of week is included in the booking's selected weekdays
    const isCurrentDaySelected = weekdays.includes(currentDayOfWeek)

    if (!isCurrentDaySelected) {
      return false
    }

    // Numeric time comparison (handles HH:MM and HH:MM:SS formats)
    const startSec = normalizeTimeToSeconds(startTime)
    const endSec = normalizeTimeToSeconds(endTime)

    if (Number.isNaN(startSec) || Number.isNaN(endSec) || Number.isNaN(currentSec)) {
      // If any time is malformed, skip this booking as a safety measure
      return false
    }

    // Handle normal range and overnight spans (start > end means spans midnight)
    let isWithinTimeRange = false
    if (startSec <= endSec) {
      isWithinTimeRange = (currentSec >= startSec && currentSec <= endSec)
    } else {
      // Overnight booking (e.g., 22:00 - 02:00): true if current >= start OR current <= end
      isWithinTimeRange = (currentSec >= startSec || currentSec <= endSec)
    }

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
