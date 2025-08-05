import React from 'react'
import { AppSidebar } from "../../components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle, AlertDialogTrigger } from '@/components/ui/alert-dialog'
import { Calendar, Clock, MapPin, Building2, Users, AlertCircle, CheckCircle, XCircle } from 'lucide-react'
import Link from 'next/link'

// Mock data - replace with actual data from your database
const booking = {
  id: '1',
  resourceName: 'Computer Lab A',
  building: 'Engineering Building',
  floor: 'Ground Floor',
  room: 'Room 101',
  date: '2024-01-15',
  startTime: '10:00',
  endTime: '12:00',
  duration: 2,
  status: 'Confirmed',
  purpose: 'Programming class preparation for CS 101 course. Need to set up development environment and prepare lecture materials.',
  capacity: 25,
  equipment: ['25 Workstations', 'Projector', 'Whiteboard', 'High-speed Internet'],
  bookingDate: '2024-01-10',
  bookingTime: '14:30'
}

const getStatusIcon = (status: string) => {
  switch (status) {
    case 'Confirmed':
      return <CheckCircle className="h-5 w-5 text-green-500" />
    case 'Pending':
      return <AlertCircle className="h-5 w-5 text-yellow-500" />
    case 'Cancelled':
      return <XCircle className="h-5 w-5 text-red-500" />
    case 'Completed':
      return <CheckCircle className="h-5 w-5 text-blue-500" />
    default:
      return <AlertCircle className="h-5 w-5 text-gray-500" />
  }
}

const getStatusBadge = (status: string) => {
  switch (status) {
    case 'Confirmed':
      return <Badge variant="default">Confirmed</Badge>
    case 'Pending':
      return <Badge variant="secondary">Pending</Badge>
    case 'Cancelled':
      return <Badge variant="destructive">Cancelled</Badge>
    case 'Completed':
      return <Badge variant="outline">Completed</Badge>
    default:
      return <Badge variant="secondary">{status}</Badge>
  }
}

export default function BookingDetailsPage({ params }: { params: Promise<{ bookingId: string }> }) {
  const resolvedParams = React.use(params)
  const handleCancelBooking = () => {
    // Handle cancellation logic here
    console.log('Cancelling booking:', resolvedParams.bookingId)
  }

  const canCancel = booking.status === 'Confirmed' && new Date(booking.date) > new Date()

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2">
          <div className="flex items-center gap-2 px-4">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem>
                  <BreadcrumbLink href="/bookings">My Bookings</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbPage>Booking Details</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-3xl font-bold mb-2">Booking Details</h1>
                <p className="text-muted-foreground">View and manage your resource booking</p>
              </div>
              <div className="flex items-center gap-2">
                {getStatusIcon(booking.status)}
                {getStatusBadge(booking.status)}
              </div>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Booking Information */}
            <div className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Booking Information</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Building2 className="h-4 w-4" />
                        <span>Building</span>
                      </div>
                      <p className="font-medium">{booking.building}</p>
                    </div>
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <MapPin className="h-4 w-4" />
                        <span>Floor</span>
                      </div>
                      <p className="font-medium">{booking.floor}</p>
                    </div>
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <MapPin className="h-4 w-4" />
                        <span>Room</span>
                      </div>
                      <p className="font-medium">{booking.room}</p>
                    </div>
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Users className="h-4 w-4" />
                        <span>Capacity</span>
                      </div>
                      <p className="font-medium">{booking.capacity} people</p>
                    </div>
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Schedule</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Calendar className="h-4 w-4" />
                        <span>Date</span>
                      </div>
                      <p className="font-medium">{new Date(booking.date).toLocaleDateString('en-US', { 
                        weekday: 'long', 
                        year: 'numeric', 
                        month: 'long', 
                        day: 'numeric' 
                      })}</p>
                    </div>
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Clock className="h-4 w-4" />
                        <span>Time</span>
                      </div>
                      <p className="font-medium">{booking.startTime} - {booking.endTime} ({booking.duration}h)</p>
                    </div>
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Purpose</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-sm">{booking.purpose}</p>
                </CardContent>
              </Card>
            </div>

            {/* Resource Details & Actions */}
            <div className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Resource Details</CardTitle>
                  <CardDescription>{booking.resourceName}</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <h4 className="font-medium mb-2">Equipment & Features</h4>
                    <div className="grid grid-cols-1 gap-2">
                      {booking.equipment.map((item, index) => (
                        <div key={index} className="flex items-center gap-2 text-sm">
                          <div className="w-2 h-2 bg-primary rounded-full"></div>
                          <span>{item}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Booking History</CardTitle>
                </CardHeader>
                <CardContent className="space-y-2">
                  <div className="flex justify-between text-sm">
                    <span className="text-muted-foreground">Booked on:</span>
                    <span>{new Date(booking.bookingDate).toLocaleDateString()}</span>
                  </div>
                  <div className="flex justify-between text-sm">
                    <span className="text-muted-foreground">Booking time:</span>
                    <span>{booking.bookingTime}</span>
                  </div>
                </CardContent>
              </Card>

              {/* Actions */}
              <Card>
                <CardHeader>
                  <CardTitle>Actions</CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  {canCancel && (
                    <AlertDialog>
                      <AlertDialogTrigger asChild>
                        <Button variant="destructive" className="w-full">
                          Cancel Booking
                        </Button>
                      </AlertDialogTrigger>
                      <AlertDialogContent>
                        <AlertDialogHeader>
                          <AlertDialogTitle>Cancel Booking</AlertDialogTitle>
                          <AlertDialogDescription>
                            Are you sure you want to cancel this booking? This action cannot be undone.
                          </AlertDialogDescription>
                        </AlertDialogHeader>
                        <AlertDialogFooter>
                          <AlertDialogCancel>Keep Booking</AlertDialogCancel>
                          <AlertDialogAction onClick={handleCancelBooking}>
                            Cancel Booking
                          </AlertDialogAction>
                        </AlertDialogFooter>
                      </AlertDialogContent>
                    </AlertDialog>
                  )}
                  
                  <Link href="/resources">
                    <Button variant="outline" className="w-full">
                      Book Another Resource
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 