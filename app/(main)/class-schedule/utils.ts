import moment from 'moment-timezone'
import { ClassScheduleBooking, ClassScheduleEvent } from './actions'

// Helper function to generate calendar events from class bookings
export function generateClassScheduleEvents(bookings: ClassScheduleBooking[]): ClassScheduleEvent[] {
  const events: ClassScheduleEvent[] = []

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
        
        // Create title with subject and faculty info
        const resourceName = booking.resources?.name || 'Unknown Resource'
        const facultyPart = booking.faculty_name ? ` (${booking.faculty_name})` : ''
        
        events.push({
          id: `${booking.id}-${currentDate.format('YYYY-MM-DD')}`,
          title: `${booking.subject}${facultyPart} @ ${resourceName}`,
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
