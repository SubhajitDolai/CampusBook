import { BookingWithDetails } from './actions'

export function getBookingStatus(status: string): string {
  switch (status) {
    case 'pending':
      return 'Pending'
    case 'approved':
      return 'Confirmed'
    case 'rejected':
      return 'Rejected'
    case 'cancelled':
      return 'Cancelled'
    default:
      return status
  }
}

export function getStatusColor(status: string): string {
  switch (status) {
    case 'pending':
      return 'yellow'
    case 'approved':
      return 'green'
    case 'rejected':
      return 'red'
    case 'cancelled':
      return 'gray'
    default:
      return 'gray'
  }
}

export function isUpcomingBooking(booking: BookingWithDetails): boolean {
  const today = new Date()
  const endDate = new Date(booking.end_date)
  
  // Booking is upcoming if it ends in the future and is approved/pending
  return endDate >= today && (booking.status === 'pending' || booking.status === 'approved')
}

export function isPastBooking(booking: BookingWithDetails): boolean {
  const today = new Date()
  const endDate = new Date(booking.end_date)
  
  // Booking is past if it ended in the past or was cancelled/rejected
  return endDate < today || booking.status === 'cancelled' || booking.status === 'rejected'
} 