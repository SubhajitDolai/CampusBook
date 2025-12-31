'use client'

import React from 'react'
import { AppSidebar } from "../../../components/app-sidebar"
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
import { getBookingById, BookingWithDetails } from '../../actions'
import { LoadingSpinner } from '../../components/LoadingSpinner'
import { ErrorDisplay } from '../../components/ErrorDisplay'
import { EditBookingForm } from './components/EditBookingForm'

export default function EditBookingPage({ params }: { params: Promise<{ bookingId: string }> }) {
  const resolvedParams = React.use(params)
  const [booking, setBooking] = React.useState<BookingWithDetails | null>(null)
  const [loading, setLoading] = React.useState(true)
  const [error, setError] = React.useState<string | null>(null)

  React.useEffect(() => {
    async function fetchBooking() {
      try {
        setError(null)
        setLoading(true)
        console.log('Fetching booking:', resolvedParams.bookingId)
        const result = await getBookingById(resolvedParams.bookingId)
        
        console.log('Booking result:', result)
        
        if (result.error) {
          setError(result.error)
          console.error('Error from getBookingById:', result.error)
        } else if (result.booking) {
          if (result.booking.status !== 'pending') {
            setError('Only pending bookings can be edited')
          } else {
            console.log('Setting booking:', result.booking)
            setBooking(result.booking)
          }
        } else {
          setError('No booking data received')
        }
      } catch (error) {
        console.error('Error fetching booking:', error)
        setError(error instanceof Error ? error.message : 'Failed to load booking')
      } finally {
        setLoading(false)
      }
    }

    if (resolvedParams.bookingId) {
      fetchBooking()
    }
  }, [resolvedParams.bookingId])

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
                  <BreadcrumbPage>Edit Booking</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <h1 className="text-3xl font-bold mb-2">Edit Booking</h1>
            <p className="text-muted-foreground">Update your resource booking details</p>
          </div>

          {loading && <LoadingSpinner message="Loading booking details..." />}
          
          {error && (
            <ErrorDisplay 
              error={error} 
              onRetry={() => window.location.reload()} 
            />
          )}

          {!loading && !error && booking && (
            <EditBookingForm booking={booking} />
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
