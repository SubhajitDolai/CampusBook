import { CalendarBooking, CalendarEvent } from './actions'

// Helper function to generate calendar events from bookings
export function generateCalendarEvents(bookings: CalendarBooking[]): CalendarEvent[] {
  const events: CalendarEvent[] = []

  bookings.forEach((booking) => {
    const startDate = new Date(booking.start_date)
    const endDate = new Date(booking.end_date)
    
    // Parse time strings
    const [startHour, startMinute] = booking.start_time.split(':').map(Number)
    const [endHour, endMinute] = booking.end_time.split(':').map(Number)

    // Generate events for each day in the booking period based on weekdays
    const currentDate = new Date(startDate)
    
    while (currentDate <= endDate) {
      const dayOfWeek = currentDate.getDay() // 0 = Sunday, 1 = Monday, etc.
      // Convert to our system (1 = Sunday, 2 = Monday, etc.) to match database
      const dbDayOfWeek = dayOfWeek === 0 ? 1 : dayOfWeek + 1
      
      if (booking.weekdays.includes(dbDayOfWeek)) {
        const eventStart = new Date(currentDate)
        eventStart.setHours(startHour, startMinute, 0, 0)
        
        const eventEnd = new Date(currentDate)
        eventEnd.setHours(endHour, endMinute, 0, 0)
        
        events.push({
          id: `${booking.id}-${currentDate.toISOString().split('T')[0]}`,
          title: `${booking.subject} - ${booking.class_name}`,
          start: eventStart,
          end: eventEnd,
          resource: booking,
          allDay: false
        })
      }
      
      // Move to next day
      currentDate.setDate(currentDate.getDate() + 1)
    }
  })

  return events
}