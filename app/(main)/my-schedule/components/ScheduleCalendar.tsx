'use client'

import { Calendar, momentLocalizer } from 'react-big-calendar'
import moment from 'moment-timezone'
import 'react-big-calendar/lib/css/react-big-calendar.css'
import { ScheduleEvent } from '../actions'
import { Badge } from '@/components/ui/badge'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { useState } from 'react'
import { Clock, User, Calendar as CalendarIcon, MapPin, Building, Layers } from 'lucide-react'

// Set moment to use IST timezone
moment.tz.setDefault('Asia/Kolkata')
const localizer = momentLocalizer(moment)

interface ScheduleCalendarProps {
  events: ScheduleEvent[]
}

export default function ScheduleCalendar({ events }: ScheduleCalendarProps) {
  const [selectedEvent, setSelectedEvent] = useState<ScheduleEvent | null>(null)
  const [isDialogOpen, setIsDialogOpen] = useState(false)

  const handleSelectEvent = (event: ScheduleEvent) => {
    setSelectedEvent(event)
    setIsDialogOpen(true)
  }

  const getEventStyle = (event: ScheduleEvent) => {
    const booking = event.resource
    let backgroundColor = '#3174ad' // default blue
    let borderColor = '#265985'

    switch (booking.status) {
      case 'approved':
        backgroundColor = '#22c55e' // green
        borderColor = '#16a34a'
        break
      case 'pending':
        backgroundColor = '#f59e0b' // amber
        borderColor = '#d97706'
        break
      case 'rejected':
        backgroundColor = '#ef4444' // red
        borderColor = '#dc2626'
        break
      case 'cancelled':
        backgroundColor = '#6b7280' // gray
        borderColor = '#4b5563'
        break
    }

    return {
      style: {
        backgroundColor,
        borderColor,
        color: 'white',
        border: `1px solid ${borderColor}`,
        borderRadius: '4px',
        fontSize: '12px',
        padding: '2px 4px'
      }
    }
  }

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'pending':
        return <Badge variant="secondary" className="bg-amber-100 text-amber-800">Pending</Badge>
      case 'approved':
        return <Badge variant="default" className="bg-green-100 text-green-800">Approved</Badge>
      case 'rejected':
        return <Badge variant="destructive">Rejected</Badge>
      case 'cancelled':
        return <Badge variant="outline" className="bg-gray-100 text-gray-800">Cancelled</Badge>
      default:
        return <Badge variant="outline">{status}</Badge>
    }
  }

  const getTypeBadge = (type: string) => {
    const typeColors: Record<string, string> = {
      classroom: 'bg-blue-100 text-blue-800',
      lab: 'bg-green-100 text-green-800',
      hall: 'bg-purple-100 text-purple-800',
      auditorium: 'bg-orange-100 text-orange-800',
      others: 'bg-gray-100 text-gray-800'
    }
    
    return (
      <Badge className={typeColors[type] || 'bg-gray-100 text-gray-800'}>
        {type.charAt(0).toUpperCase() + type.slice(1)}
      </Badge>
    )
  }

  const formatTime = (timeString: string) => {
    const [hours, minutes] = timeString.slice(0, 5).split(':')
    const hour24 = parseInt(hours)
    const hour12 = hour24 === 0 ? 12 : hour24 > 12 ? hour24 - 12 : hour24
    const ampm = hour24 >= 12 ? 'PM' : 'AM'
    return `${hour12}:${minutes} ${ampm}`
  }

  const formatDate = (dateString: string) => {
    return moment.tz(dateString, 'Asia/Kolkata').format('MM/DD/YYYY')
  }

  const formatWeekdays = (weekdays: number[]) => {
    const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    return weekdays.sort().map(day => dayNames[day - 1]).join(', ')
  }

  return (
    <div className="h-full">
      <style jsx global>{`
        .rbc-calendar {
          font-family: inherit;
          height: 600px;
        }
        .rbc-header {
          background-color: hsl(var(--muted));
          border-bottom: 1px solid hsl(var(--border));
          padding: 8px;
          font-weight: 600;
          color: hsl(var(--foreground));
        }
        .rbc-today {
          background-color: hsl(var(--accent) / 0.3);
        }
        .rbc-off-range-bg {
          background-color: hsl(var(--muted) / 0.5);
        }
        .rbc-toolbar {
          margin-bottom: 20px;
          padding: 0 10px;
        }
        .rbc-toolbar button {
          background-color: hsl(var(--background));
          border: 1px solid hsl(var(--border));
          border-radius: 6px;
          padding: 8px 12px;
          margin: 0 2px;
          color: hsl(var(--foreground));
          font-weight: 500;
        }
        .rbc-toolbar button:hover {
          background-color: hsl(var(--accent));
        }
        .rbc-toolbar button.rbc-active {
          background-color: hsl(var(--primary));
          color: hsl(var(--primary-foreground));
          border-color: hsl(var(--primary));
        }
        .rbc-month-view,
        .rbc-time-view {
          border: 1px solid hsl(var(--border));
          border-radius: 8px;
          background-color: hsl(var(--background));
        }
        .rbc-time-slot {
          border-top: 1px solid hsl(var(--border) / 0.5);
        }
        .rbc-timeslot-group {
          border-bottom: 1px solid hsl(var(--border));
        }
        .rbc-event {
          border-radius: 4px;
          padding: 2px 4px;
          font-size: 12px;
          font-weight: 500;
        }
        .rbc-event:hover {
          opacity: 0.8;
          cursor: pointer;
        }
        .rbc-day-bg {
          background-color: hsl(var(--background));
        }
        .rbc-time-content {
          background-color: hsl(var(--background));
        }
        .rbc-time-header-content {
          background-color: hsl(var(--muted));
        }
        .rbc-time-gutter {
          background-color: hsl(var(--muted));
        }
        .rbc-label {
          color: hsl(var(--muted-foreground));
        }
        .rbc-allday-cell {
          background-color: hsl(var(--muted));
        }
        .rbc-month-row {
          background-color: hsl(var(--background));
        }
        .rbc-date-cell {
          color: hsl(var(--foreground));
        }
        .rbc-off-range {
          color: hsl(var(--muted-foreground));
        }
      `}</style>
      
      <Calendar
        localizer={localizer}
        events={events}
        startAccessor="start"
        endAccessor="end"
        onSelectEvent={handleSelectEvent}
        eventPropGetter={getEventStyle}
        views={['month', 'week', 'day']}
        defaultView="week"
        popup
        style={{ height: '100%' }}
        step={30}
        timeslots={2}
        min={moment.tz('2024-01-01 05:00', 'YYYY-MM-DD HH:mm', 'Asia/Kolkata').toDate()}
        max={moment.tz('2024-01-01 23:00', 'YYYY-MM-DD HH:mm', 'Asia/Kolkata').toDate()}
        culture="en-IN"
        formats={{
          timeGutterFormat: (date) => moment.tz(date, 'Asia/Kolkata').format('h:mm A'),
          dayFormat: (date) => moment.tz(date, 'Asia/Kolkata').format('ddd M/D'),
          dateFormat: (date) => moment.tz(date, 'Asia/Kolkata').format('D'),
          dayHeaderFormat: (date) => moment.tz(date, 'Asia/Kolkata').format('dddd, MMMM Do'),
          dayRangeHeaderFormat: ({ start, end }) => 
            `${moment.tz(start, 'Asia/Kolkata').format('MMMM Do')} - ${moment.tz(end, 'Asia/Kolkata').format('MMMM Do, YYYY')}`,
          agendaDateFormat: (date) => moment.tz(date, 'Asia/Kolkata').format('ddd M/D'),
          agendaTimeFormat: (date) => moment.tz(date, 'Asia/Kolkata').format('h:mm A'),
          agendaTimeRangeFormat: ({ start, end }) => 
            `${moment.tz(start, 'Asia/Kolkata').format('h:mm A')} - ${moment.tz(end, 'Asia/Kolkata').format('h:mm A')}`,
          eventTimeRangeFormat: ({ start, end }) => 
            `${moment.tz(start, 'Asia/Kolkata').format('h:mm A')} - ${moment.tz(end, 'Asia/Kolkata').format('h:mm A')}`,
          selectRangeFormat: ({ start, end }) => 
            `${moment.tz(start, 'Asia/Kolkata').format('h:mm A')} - ${moment.tz(end, 'Asia/Kolkata').format('h:mm A')}`
        }}
      />

      {/* Event Details Dialog */}
      <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              <CalendarIcon className="h-5 w-5" />
              Class Details
            </DialogTitle>
            <DialogDescription>
              Detailed information about this scheduled class
            </DialogDescription>
          </DialogHeader>
          
          {selectedEvent && (
            <div className="grid gap-6">
              {/* Header Info */}
              <div className="flex items-start justify-between">
                <div>
                  <h3 className="text-lg font-semibold">{selectedEvent.resource.subject}</h3>
                  <p className="text-muted-foreground">{selectedEvent.resource.class_name}</p>
                </div>
                <div className="flex gap-2">
                  {selectedEvent.resource.resources?.type && getTypeBadge(selectedEvent.resource.resources.type)}
                  {getStatusBadge(selectedEvent.resource.status)}
                </div>
              </div>

              {/* Location Info */}
              {selectedEvent.resource.resources && (
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <MapPin className="h-4 w-4 text-muted-foreground" />
                    <span className="font-medium">Location</span>
                  </div>
                  <div className="pl-6 space-y-1">
                    <div className="text-sm">
                      <span className="font-medium">Resource:</span> {selectedEvent.resource.resources.name}
                    </div>
                    {selectedEvent.resource.resources.buildings && (
                      <div className="text-sm">
                        <span className="font-medium">Building:</span> {selectedEvent.resource.resources.buildings.name} ({selectedEvent.resource.resources.buildings.code})
                      </div>
                    )}
                    {selectedEvent.resource.resources.floors && (
                      <div className="text-sm">
                        <span className="font-medium">Floor:</span> {selectedEvent.resource.resources.floors.name || `Floor ${selectedEvent.resource.resources.floors.floor_number}`}
                      </div>
                    )}
                    {selectedEvent.resource.resources.capacity && (
                      <div className="text-sm">
                        <span className="font-medium">Capacity:</span> {selectedEvent.resource.resources.capacity} seats
                      </div>
                    )}
                  </div>
                </div>
              )}

              {/* Time and Date Info */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <Clock className="h-4 w-4 text-muted-foreground" />
                    <span className="font-medium">Schedule</span>
                  </div>
                  <div className="pl-6 space-y-1">
                    <div className="text-sm">
                      <span className="font-medium">Date Range:</span> {formatDate(selectedEvent.resource.start_date)} to {formatDate(selectedEvent.resource.end_date)}
                    </div>
                    <div className="text-sm">
                      <span className="font-medium">Time:</span> {formatTime(selectedEvent.resource.start_time)} to {formatTime(selectedEvent.resource.end_time)}
                    </div>
                    {selectedEvent.resource.weekdays && selectedEvent.resource.weekdays.length > 0 && (
                      <div className="text-sm">
                        <span className="font-medium">Days:</span> {formatWeekdays(selectedEvent.resource.weekdays)}
                      </div>
                    )}
                  </div>
                </div>

                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <User className="h-4 w-4 text-muted-foreground" />
                    <span className="font-medium">Booked By</span>
                  </div>
                  <div className="pl-6 space-y-1">
                    {selectedEvent.resource.profiles && (
                      <>
                        <div className="text-sm">
                          <span className="font-medium">Name:</span> {selectedEvent.resource.profiles.name}
                        </div>
                        <div className="text-sm">
                          <span className="font-medium">Email:</span> {selectedEvent.resource.profiles.email}
                        </div>
                        <div className="text-sm">
                          <span className="font-medium">Department:</span> {selectedEvent.resource.profiles.department}
                        </div>
                      </>
                    )}
                  </div>
                </div>
              </div>

              {/* Reason */}
              <div className="space-y-2">
                <h4 className="font-medium">Reason/Purpose</h4>
                <p className="text-sm text-muted-foreground bg-muted p-3 rounded-md">
                  {selectedEvent.resource.reason}
                </p>
              </div>

              {/* Approval Info */}
              {selectedEvent.resource.status === 'approved' && selectedEvent.resource.approved_by_profile && (
                <div className="space-y-2 border-t pt-4">
                  <h4 className="font-medium text-green-700">Approved By</h4>
                  <div className="text-sm">
                    {selectedEvent.resource.approved_by_profile.name} ({selectedEvent.resource.approved_by_profile.email})
                    {selectedEvent.resource.approved_at && (
                      <span className="text-muted-foreground ml-2">
                        on {moment.tz(selectedEvent.resource.approved_at, 'Asia/Kolkata').format('MMM D, YYYY h:mm A')}
                      </span>
                    )}
                  </div>
                </div>
              )}
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  )
}
