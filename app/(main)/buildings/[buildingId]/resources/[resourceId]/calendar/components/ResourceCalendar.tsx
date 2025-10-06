'use client'

import { Calendar, momentLocalizer } from 'react-big-calendar'
import moment from 'moment'
import 'react-big-calendar/lib/css/react-big-calendar.css'
import { CalendarEvent } from '../actions'
import { Badge } from '@/components/ui/badge'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { useState } from 'react'
import { Clock, User, Calendar as CalendarIcon, MapPin, Users } from 'lucide-react'

const localizer = momentLocalizer(moment)

interface ResourceCalendarProps {
  events: CalendarEvent[]
}

export default function ResourceCalendar({ events }: ResourceCalendarProps) {
  const [selectedEvent, setSelectedEvent] = useState<CalendarEvent | null>(null)
  const [isDialogOpen, setIsDialogOpen] = useState(false)

  const handleSelectEvent = (event: CalendarEvent) => {
    setSelectedEvent(event)
    setIsDialogOpen(true)
  }

  const getEventStyle = (event: CalendarEvent) => {
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

  const formatTime = (timeString: string) => {
    const [hours, minutes] = timeString.slice(0, 5).split(':')
    const hour24 = parseInt(hours)
    const hour12 = hour24 === 0 ? 12 : hour24 > 12 ? hour24 - 12 : hour24
    const ampm = hour24 >= 12 ? 'PM' : 'AM'
    return `${hour12}:${minutes} ${ampm}`
  }

  const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    const year = date.getFullYear()
    const month = (date.getMonth() + 1).toString().padStart(2, '0')
    const day = date.getDate().toString().padStart(2, '0')
    return `${month}/${day}/${year}`
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
          background-color: #f8fafc;
          border-bottom: 1px solid #e2e8f0;
          padding: 8px;
          font-weight: 600;
          color: #334155;
        }
        .rbc-today {
          background-color: #fef3c7;
        }
        .rbc-off-range-bg {
          background-color: #f8fafc;
        }
        .rbc-toolbar {
          margin-bottom: 20px;
          padding: 0 10px;
        }
        .rbc-toolbar button {
          background-color: white;
          border: 1px solid #d1d5db;
          border-radius: 6px;
          padding: 8px 12px;
          margin: 0 2px;
          color: #374151;
          font-weight: 500;
        }
        .rbc-toolbar button:hover {
          background-color: #f3f4f6;
        }
        .rbc-toolbar button.rbc-active {
          background-color: #3b82f6;
          color: white;
          border-color: #3b82f6;
        }
        .rbc-month-view,
        .rbc-time-view {
          border: 1px solid #e2e8f0;
          border-radius: 8px;
        }
        .rbc-time-slot {
          border-top: 1px solid #f1f5f9;
        }
        .rbc-timeslot-group {
          border-bottom: 1px solid #e2e8f0;
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
        min={new Date(2024, 0, 1, 5, 0)} // 5 AM
        max={new Date(2024, 0, 1, 23, 0)} // 11 PM
      />

      {/* Event Details Dialog */}
      <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              <CalendarIcon className="h-5 w-5" />
              Booking Details
            </DialogTitle>
            <DialogDescription>
              Detailed information about this resource booking
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
                {getStatusBadge(selectedEvent.resource.status)}
              </div>

              {/* Time and Date Info */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <Clock className="h-4 w-4 text-muted-foreground" />
                    <span className="font-medium">Schedule</span>
                  </div>
                  <div className="pl-6 space-y-1">
                    <div className="text-sm">
                      <span className="font-medium">Date:</span> {formatDate(selectedEvent.resource.start_date)} to {formatDate(selectedEvent.resource.end_date)}
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
                    <span className="font-medium">Faculty Details</span>
                  </div>
                  <div className="pl-6 space-y-1">
                    <div className="text-sm">
                      <span className="font-medium">Name:</span> {selectedEvent.resource.profiles?.name || 'N/A'}
                    </div>
                    <div className="text-sm">
                      <span className="font-medium">Email:</span> {selectedEvent.resource.profiles?.email || 'N/A'}
                    </div>
                    <div className="text-sm">
                      <span className="font-medium">Department:</span> {selectedEvent.resource.profiles?.department || 'N/A'}
                    </div>
                    <div className="text-sm">
                      <span className="font-medium">ID:</span> {selectedEvent.resource.profiles?.university_id || 'N/A'}
                    </div>
                  </div>
                </div>
              </div>

              {/* Academic Info */}
              <div className="space-y-2">
                <div className="flex items-center gap-2">
                  <Users className="h-4 w-4 text-muted-foreground" />
                  <span className="font-medium">Academic Information</span>
                </div>
                <div className="pl-6 space-y-1">
                  <div className="text-sm">
                    <span className="font-medium">Subject:</span> {selectedEvent.resource.subject}
                  </div>
                  <div className="text-sm">
                    <span className="font-medium">Class:</span> {selectedEvent.resource.class_name}
                  </div>
                  {selectedEvent.resource.faculty_name && (
                    <div className="text-sm">
                      <span className="font-medium">Faculty:</span> {selectedEvent.resource.faculty_name}
                    </div>
                  )}
                </div>
              </div>

              {/* Reason */}
              <div className="space-y-2">
                <div className="flex items-center gap-2">
                  <MapPin className="h-4 w-4 text-muted-foreground" />
                  <span className="font-medium">Booking Reason</span>
                </div>
                <div className="pl-6">
                  <p className="text-sm text-muted-foreground">{selectedEvent.resource.reason}</p>
                </div>
              </div>

              {/* Approval Info */}
              {selectedEvent.resource.approved_by_profile && (
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <User className="h-4 w-4 text-muted-foreground" />
                    <span className="font-medium">Approval Details</span>
                  </div>
                  <div className="pl-6 space-y-1">
                    <div className="text-sm">
                      <span className="font-medium">Approved by:</span> {selectedEvent.resource.approved_by_profile.name}
                    </div>
                    {selectedEvent.resource.approved_at && (
                      <div className="text-sm">
                        <span className="font-medium">Approved on:</span> {formatDate(selectedEvent.resource.approved_at)}
                      </div>
                    )}
                  </div>
                </div>
              )}

              {/* Created Date */}
              <div className="text-xs text-muted-foreground border-t pt-4">
                Created on {formatDate(selectedEvent.resource.created_at)}
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  )
}