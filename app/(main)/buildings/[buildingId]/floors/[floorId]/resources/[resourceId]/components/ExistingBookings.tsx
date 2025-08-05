'use client'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Calendar, Clock, User, FileText } from 'lucide-react'
import { format } from 'date-fns'

interface Booking {
  id: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  reason: string
  status: 'pending' | 'approved' | 'rejected' | 'cancelled'
  created_at: string
  profiles: {
    id: string
    name: string
    email: string
    department: string
  } | null
}

interface ExistingBookingsProps {
  bookings: Booking[]
}

const getStatusColor = (status: string) => {
  switch (status) {
    case 'approved':
      return 'bg-green-100 text-green-800 hover:bg-green-100'
    case 'pending':
      return 'bg-yellow-100 text-yellow-800 hover:bg-yellow-100'
    case 'rejected':
      return 'bg-red-100 text-red-800 hover:bg-red-100'
    case 'cancelled':
      return 'bg-gray-100 text-gray-800 hover:bg-gray-100'
    default:
      return 'bg-gray-100 text-gray-800 hover:bg-gray-100'
  }
}

const formatTime = (time: string) => {
  const [hours, minutes] = time.split(':')
  const hour = parseInt(hours)
  const ampm = hour >= 12 ? 'PM' : 'AM'
  const displayHour = hour > 12 ? hour - 12 : hour === 0 ? 12 : hour
  return `${displayHour}:${minutes} ${ampm}`
}

export default function ExistingBookings({ bookings }: ExistingBookingsProps) {
  // Sort bookings by status priority: approved > pending > rejected > cancelled
  const sortedBookings = [...bookings].sort((a, b) => {
    const statusPriority = {
      'approved': 1,
      'pending': 2,
      'rejected': 3,
      'cancelled': 4
    }
    
    const priorityA = statusPriority[a.status] || 5
    const priorityB = statusPriority[b.status] || 5
    
    if (priorityA !== priorityB) {
      return priorityA - priorityB
    }
    
    // If same status, sort by start date (earliest first)
    return new Date(a.start_date).getTime() - new Date(b.start_date).getTime()
  })

  if (bookings.length === 0) {
    return (
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Calendar className="h-5 w-5" />
            Existing Bookings
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="text-center py-8">
            <Calendar className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
            <p className="text-muted-foreground mb-2">No active bookings found</p>
            <p className="text-sm text-muted-foreground">This resource is available for booking</p>
          </div>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Calendar className="h-5 w-5" />
          Existing Bookings ({bookings.length})
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {sortedBookings.map((booking) => (
            <div
              key={booking.id}
              className="border rounded-lg p-4 space-y-3"
            >
              <div className="flex items-start justify-between">
                <div className="flex items-center gap-2">
                  <User className="h-4 w-4 text-muted-foreground" />
                  <span className="font-medium">{booking.profiles?.name || 'Unknown User'}</span>
                  <span className="text-sm text-muted-foreground">
                    ({booking.profiles?.department || 'Unknown Department'})
                  </span>
                </div>
                <Badge 
                  variant="secondary" 
                  className={getStatusColor(booking.status)}
                >
                  {booking.status.charAt(0).toUpperCase() + booking.status.slice(1)}
                </Badge>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                <div className="flex items-center gap-2">
                  <Calendar className="h-4 w-4 text-muted-foreground" />
                  <span>
                    {format(new Date(booking.start_date), 'MMM dd, yyyy')}
                    {booking.start_date !== booking.end_date && 
                      ` - ${format(new Date(booking.end_date), 'MMM dd, yyyy')}`
                    }
                  </span>
                </div>
                
                <div className="flex items-center gap-2">
                  <Clock className="h-4 w-4 text-muted-foreground" />
                  <span>
                    {formatTime(booking.start_time)} - {formatTime(booking.end_time)}
                  </span>
                </div>
              </div>

              {booking.reason && (
                <div className="flex items-start gap-2">
                  <FileText className="h-4 w-4 text-muted-foreground mt-0.5" />
                  <p className="text-sm text-muted-foreground">{booking.reason}</p>
                </div>
              )}

              <div className="text-xs text-muted-foreground">
                Booked on {format(new Date(booking.created_at), 'MMM dd, yyyy at h:mm a')}
              </div>
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  )
} 