'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Calendar, Clock, MapPin, Building2, AlertCircle, CheckCircle, XCircle } from 'lucide-react'
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
        month: 'short',
        day: 'numeric'
      })
    } else {
      // Date range booking
      return `${start.toLocaleDateString('en-US', {
        month: 'short',
        day: 'numeric'
      })} - ${end.toLocaleDateString('en-US', {
        month: 'short',
        day: 'numeric'
      })}`
    }
  }

  const duration = calculateDuration(booking.start_time, booking.end_time)

  return (
    <Card className="hover:shadow-lg transition-shadow">
      <CardHeader>
        <div className="flex items-start justify-between">
          <div>
            <CardTitle className="text-lg">{booking.resources.name}</CardTitle>
            <CardDescription>{booking.reason}</CardDescription>
          </div>
          {getStatusIcon(booking.status)}
        </div>
      </CardHeader>
      <CardContent className="space-y-3">
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <Building2 className="h-4 w-4" />
          <span>{booking.resources.buildings.name}</span>
        </div>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <MapPin className="h-4 w-4" />
          <span>{booking.resources.floors.name || `Floor ${booking.resources.floors.floor_number}`}</span>
        </div>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <Calendar className="h-4 w-4" />
          <span>{formatDateRange(booking.start_date, booking.end_date)}</span>
        </div>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <Clock className="h-4 w-4" />
          <span>{booking.start_time} - {booking.end_time} ({duration}h)</span>
        </div>
        
        <div className="flex items-center justify-between pt-2">
          {getStatusBadge(booking.status)}
          {showCancelButton && (booking.status === 'approved' || booking.status === 'pending') && onCancel && (
            <Button 
              variant="outline" 
              size="sm"
              onClick={() => onCancel(booking.id)}
            >
              Cancel
            </Button>
          )}
        </div>
      </CardContent>
    </Card>
  )
} 