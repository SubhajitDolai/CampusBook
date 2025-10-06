import { CalendarBooking, CalendarEvent } from './actions'

// Helper function to generate calendar events from bookings
export function generateCalendarEvents(bookings: CalendarBooking[]): CalendarEvent[] {
  const events: CalendarEvent[] = []

  bookings.forEach((booking) => {
    // Parse dates using IST timezone offset (+05:30)
    const startDate = new Date(booking.start_date + 'T00:00:00+05:30')
    const endDate = new Date(booking.end_date + 'T00:00:00+05:30')
    
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
        // Create dates in IST timezone by using local date constructor
        const year = currentDate.getFullYear()
        const month = currentDate.getMonth()
        const day = currentDate.getDate()
        
        // Create event start and end times in local timezone (IST)
        const eventStart = new Date(year, month, day, startHour, startMinute)
        const eventEnd = new Date(year, month, day, endHour, endMinute)
        
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