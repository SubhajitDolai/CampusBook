'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Calendar, Clock, MapPin, Building2, AlertCircle, CheckCircle, XCircle, Users, Hash, GraduationCap, UserCheck, Calendar as CalendarIcon } from 'lucide-react'
import { BookingWithDetails } from '../actions'
import { getBookingStatus } from '../utils'

interface BookingCardProps {
  booking: BookingWithDetails
  onCancel?: (bookingId: string) => void
  showCancelButton?: boolean
}

export function BookingCard({ booking, onCancel, showCancelButton = false }: BookingCardProps) {
  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'approved':
        return <CheckCircle className="h-4 w-4 text-green-500" />
      case 'pending':
        return <AlertCircle className="h-4 w-4 text-yellow-500" />
      case 'cancelled':
        return <XCircle className="h-4 w-4 text-red-500" />
      case 'completed':
        return <CheckCircle className="h-4 w-4 text-blue-500" />
      case 'rejected':
        return <XCircle className="h-4 w-4 text-red-500" />
      default:
        return <AlertCircle className="h-4 w-4 text-gray-500" />
    }
  }

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'approved':
        return <Badge variant="default">Confirmed</Badge>
      case 'pending':
        return <Badge variant="secondary">Pending</Badge>
      case 'cancelled':
        return <Badge variant="destructive">Cancelled</Badge>
      case 'completed':
        return <Badge variant="outline">Completed</Badge>
      case 'rejected':
        return <Badge variant="destructive">Rejected</Badge>
      default:
        return <Badge variant="secondary">{getBookingStatus(status)}</Badge>
    }
  }

  const calculateDuration = (startTime: string, endTime: string) => {
    const start = new Date(`2000-01-01T${startTime}`)
    const end = new Date(`2000-01-01T${endTime}`)
    const diffMs = end.getTime() - start.getTime()
    const diffHours = diffMs / (1000 * 60 * 60)
    return Math.round(diffHours)
  }

  const formatDateRange = (startDate: string, endDate: string) => {
    const start = new Date(startDate)
    const end = new Date(endDate)
    
    if (start.toDateString() === end.toDateString()) {
      // Same day booking
      return start.toLocaleDateString('en-US', {
        weekday: 'short',
        month: 'short',
        day: 'numeric',
        year: 'numeric'
      })
    } else {
      // Date range booking
      return `${start.toLocaleDateString('en-US', {
        month: 'short',
        day: 'numeric'
      })} - ${end.toLocaleDateString('en-US', {
        month: 'short',
        day: 'numeric',
        year: 'numeric'
      })}`
    }
  }

  const formatWeekdays = (weekdays: number[] = []) => {
    const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    if (weekdays.length === 7) return 'Every day'
    if (weekdays.length === 0) return 'No days selected'
    return weekdays.map(day => dayNames[day - 1]).join(', ')
  }

  const formatDateTime = (dateTime: string | null) => {
    if (!dateTime) return 'N/A'
    return new Date(dateTime).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
  }

  const duration = calculateDuration(booking.start_time, booking.end_time)

  return (
    <Card className="hover:shadow-lg transition-shadow">
      <CardHeader>
        <div className="flex items-start justify-between">
          <div className="flex-1">
            <CardTitle className="text-lg">{booking.resources.name}</CardTitle>
            <CardDescription className="mt-1">
              <span className="font-medium">Booking ID:</span> {booking.id.slice(0, 8)}...
            </CardDescription>
            <CardDescription className="mt-1">{booking.reason}</CardDescription>
          </div>
          <div className="flex flex-col items-end gap-2">
            {getStatusIcon(booking.status)}
            {getStatusBadge(booking.status)}
          </div>
        </div>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Resource Information */}
        <div className="space-y-2 border-b pb-3">
          <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Resource Details</h4>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-2 text-sm">
            <div className="flex items-center gap-2">
              <Building2 className="h-4 w-4 text-muted-foreground" />
              <span>{booking.resources.buildings.name}</span>
            </div>
            <div className="flex items-center gap-2">
              <MapPin className="h-4 w-4 text-muted-foreground" />
              <span>{booking.resources.floors.name || `Floor ${booking.resources.floors.floor_number}`}</span>
            </div>
            <div className="flex items-center gap-2">
              <Badge variant="outline" className="text-xs">
                {booking.resources.type}
              </Badge>
              {booking.resources.capacity && (
                <div className="flex items-center gap-1">
                  <Users className="h-4 w-4 text-muted-foreground" />
                  <span>{booking.resources.capacity}</span>
                </div>
              )}
            </div>
          </div>
          {booking.resources.description && (
            <p className="text-xs text-muted-foreground italic mt-2">
              {booking.resources.description}
            </p>
          )}
        </div>

        {/* Scheduling Information */}
        <div className="space-y-2 border-b pb-3">
          <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Schedule</h4>
          <div className="space-y-2 text-sm">
            <div className="flex items-center gap-2">
              <Calendar className="h-4 w-4 text-muted-foreground" />
              <span>{formatDateRange(booking.start_date, booking.end_date)}</span>
            </div>
            <div className="flex items-center gap-2">
              <Clock className="h-4 w-4 text-muted-foreground" />
              <span>{booking.start_time} - {booking.end_time} ({duration}h)</span>
            </div>
            {booking.weekdays && booking.weekdays.length < 7 && (
              <div className="flex items-center gap-2">
                <CalendarIcon className="h-4 w-4 text-muted-foreground" />
                <span className="text-xs">Days: {formatWeekdays(booking.weekdays)}</span>
              </div>
            )}
          </div>
        </div>

        {/* Academic Information */}
        {(booking.subject || booking.faculty_name || booking.class_name) && (
          <div className="space-y-2 border-b pb-3">
            <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Academic Details</h4>
            <div className="space-y-2">
              {booking.subject && (
                <div className="flex items-center gap-2">
                  <GraduationCap className="h-4 w-4 text-muted-foreground" />
                  <span className="text-sm">Subject: <span className="font-medium">{booking.subject}</span></span>
                </div>
              )}
              {booking.class_name && (
                <div className="flex items-center gap-2">
                  <Hash className="h-4 w-4 text-muted-foreground" />
                  <span className="text-sm">Class: <span className="font-medium">{booking.class_name}</span></span>
                </div>
              )}
              {booking.faculty_name && (
                <div className="flex items-center gap-2">
                  <UserCheck className="h-4 w-4 text-muted-foreground" />
                  <span className="text-sm">Faculty: <span className="font-medium">{booking.faculty_name}</span></span>
                </div>
              )}
            </div>
          </div>
        )}

        {/* Requester Information */}
        <div className="space-y-2 border-b pb-3">
          <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Requested By</h4>
          <div className="space-y-1 text-sm">
            <div>
              <span className="font-medium">{booking.profiles.name}</span>
              <span className="text-muted-foreground ml-2">({booking.profiles.university_id})</span>
            </div>
            <div className="text-muted-foreground">
              {booking.profiles.department} • {booking.profiles.role}
            </div>
            <div className="text-xs text-muted-foreground">
              {booking.profiles.email}
            </div>
          </div>
        </div>

        {/* Approval Information */}
        {(booking.status === 'approved' || booking.status === 'rejected') && (booking.approved_by || booking.approved_at) && (
          <div className="space-y-2 border-b pb-3">
            <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">
              {booking.status === 'approved' ? 'Approval' : 'Rejection'} Details
            </h4>
            <div className="text-sm space-y-1">
              {booking.approved_at && (
                <div className="text-muted-foreground">
                  <span className="capitalize">{booking.status}</span> on {formatDateTime(booking.approved_at)}
                </div>
              )}
              {booking.approved_by && (
                <div className="text-xs text-muted-foreground">
                  Approved by: {booking.approver?.name ?? booking.approved_by}
                </div>
              )}
            </div>
          </div>
        )}

        {/* Booking Metadata */}
        <div className="space-y-2">
          <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Booking Info</h4>
          <div className="text-xs text-muted-foreground space-y-1">
            <div>Created: {formatDateTime(booking.created_at)}</div>
            <div>Booking ID: <span className="font-mono">{booking.id}</span></div>
            <div>Resource ID: <span className="font-mono">{booking.resource_id}</span></div>
          </div>
        </div>
        
        {/* Actions */}
        <div className="flex items-center justify-end gap-2 pt-4">
          {showCancelButton && booking.status === 'pending' && (
            <>
              <Button 
                variant="outline" 
                size="sm"
                onClick={() => window.location.href = `/bookings/${booking.id}/edit`}
              >
                Edit Booking
              </Button>
              {onCancel && (
                <Button 
                  variant="outline" 
                  size="sm"
                  onClick={() => onCancel(booking.id)}
                  className="text-red-600 hover:text-red-700 border-red-200 hover:border-red-300"
                >
                  Cancel Booking
                </Button>
              )}
            </>
          )}
        </div>
      </CardContent>
    </Card>
  )
} 