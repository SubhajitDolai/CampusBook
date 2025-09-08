import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Calendar, Clock, MapPin, ArrowRight } from 'lucide-react'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { useRouter } from 'next/navigation'
import { RecentBooking } from '../actions'

interface RecentBookingsCardProps {
  bookings: RecentBooking[]
}

export function RecentBookingsCard({ bookings }: RecentBookingsCardProps) {
  const { start } = useGlobalLoadingBar()
  const router = useRouter()

  const handleNavigation = (href: string) => {
    start()
    router.push(href)
  }

  // Sort bookings by most recent first (by created_at time)
  const sortedBookings = [...bookings].sort((a, b) => {
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  })

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'approved':
        return <Badge variant="default">Confirmed</Badge>
      case 'pending':
        return <Badge variant="secondary">Pending</Badge>
      case 'cancelled':
        return <Badge variant="destructive">Cancelled</Badge>
      case 'rejected':
        return <Badge variant="destructive">Rejected</Badge>
      default:
        return <Badge variant="secondary">{status}</Badge>
    }
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

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle>Recent Bookings</CardTitle>
          <Button 
            variant="ghost" 
            size="sm"
            onClick={() => handleNavigation('/bookings')}
          >
            View All
            <ArrowRight className="ml-2 h-4 w-4" />
          </Button>
        </div>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {bookings.length === 0 ? (
            <div className="text-center py-8">
              <p className="text-muted-foreground">No recent bookings</p>
              <Button 
                className="mt-2" 
                size="sm"
                onClick={() => handleNavigation('/resources')}
              >
                Browse Resources
              </Button>
            </div>
          ) : (
            sortedBookings.map((booking) => (
              <div key={booking.id} className="flex items-center justify-between p-3 border rounded-lg">
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <h4 className="font-medium">{booking.resource_name}</h4>
                    {getStatusBadge(booking.status)}
                  </div>
                  <div className="flex items-center gap-4 text-sm text-muted-foreground">
                    <div className="flex items-center gap-1">
                      <MapPin className="h-3 w-3" />
                      <span>{booking.building_name}</span>
                    </div>
                    <div className="flex items-center gap-1">
                      <Calendar className="h-3 w-3" />
                      <span>{formatDateRange(booking.start_date, booking.end_date)}</span>
                    </div>
                    <div className="flex items-center gap-1">
                      <Clock className="h-3 w-3" />
                      <span>{booking.start_time} - {booking.end_time}</span>
                    </div>
                  </div>
                  {/* Academic Information */}
                  {(booking.subject || booking.faculty_name || booking.class_name) && (
                    <div className="flex items-center gap-4 text-xs text-muted-foreground">
                      {booking.subject && (
                        <span className="bg-blue-50 text-blue-700 px-2 py-1 rounded-full">
                          {booking.subject}
                        </span>
                      )}
                      {booking.faculty_name && (
                        <span>Faculty: {booking.faculty_name}</span>
                      )}
                      {booking.class_name && (
                        <span>Class: {booking.class_name}</span>
                      )}
                    </div>
                  )}
                  <p className="text-xs text-muted-foreground truncate max-w-xs">
                    {booking.reason}
                  </p>
                </div>
              </div>
            ))
          )}
        </div>
      </CardContent>
    </Card>
  )
} 