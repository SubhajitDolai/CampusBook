import moment from 'moment-timezone'
import { ScheduleBooking, ScheduleEvent } from './actions'

// Helper function to generate calendar events from bookings
export function generateScheduleEvents(bookings: ScheduleBooking[]): ScheduleEvent[] {
  const events: ScheduleEvent[] = []

  bookings.forEach((booking) => {
    // Parse dates in IST timezone using moment
    const startDate = moment.tz(booking.start_date, 'Asia/Kolkata')
    const endDate = moment.tz(booking.end_date, 'Asia/Kolkata')
    
    // Parse time strings
    const [startHour, startMinute] = booking.start_time.split(':').map(Number)
    const [endHour, endMinute] = booking.end_time.split(':').map(Number)

    // Generate events for each day in the booking period based on weekdays
    const currentDate = moment(startDate)
    
    while (currentDate.isSameOrBefore(endDate, 'day')) {
      const dayOfWeek = currentDate.day() // 0 = Sunday, 1 = Monday, etc.
      // Convert to our system (1 = Sunday, 2 = Monday, etc.) to match database
      const dbDayOfWeek = dayOfWeek === 0 ? 1 : dayOfWeek + 1
      
      if (booking.weekdays.includes(dbDayOfWeek)) {
        // Create event start and end times in IST timezone using moment
        const eventStart = moment.tz(currentDate.format('YYYY-MM-DD'), 'Asia/Kolkata')
          .hour(startHour)
          .minute(startMinute)
          .second(0)
          .millisecond(0)
          .toDate()
        
        const eventEnd = moment.tz(currentDate.format('YYYY-MM-DD'), 'Asia/Kolkata')
          .hour(endHour)
          .minute(endMinute)
          .second(0)
          .millisecond(0)
          .toDate()
        
        // Create title with resource location info
        const resourceName = booking.resources?.name || 'Unknown Resource'
        const locationPart = resourceName ? ` @ ${resourceName}` : ''
        
        events.push({
          id: `${booking.id}-${currentDate.format('YYYY-MM-DD')}`,
          title: `${booking.subject} - ${booking.class_name}${locationPart}`,
          start: eventStart,
          end: eventEnd,
          resource: booking,
          allDay: false
        })
      }
      
      // Move to next day
      currentDate.add(1, 'day')
    }
  })

  return events
}
