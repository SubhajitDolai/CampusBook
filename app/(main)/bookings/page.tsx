'use client'

import { AppSidebar } from "../components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbList,
  BreadcrumbPage,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
import { Button } from '@/components/ui/button'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import Link from 'next/link'
import React from 'react'
import { getUserBookings, cancelBooking, BookingWithDetails } from './actions'
import { isUpcomingBooking, isPastBooking } from './utils'
import { BookingCard } from './components/BookingCard'
import { LoadingSpinner } from './components/LoadingSpinner'
import { ErrorDisplay } from './components/ErrorDisplay'



export default function BookingsPage() {
  const [bookings, setBookings] = React.useState<BookingWithDetails[]>([])
  const [loading, setLoading] = React.useState(true)
  const [error, setError] = React.useState<string | null>(null)

  // Fetch bookings on component mount
  React.useEffect(() => {
    async function fetchBookings() {
      try {
        setError(null)
        const bookingsData = await getUserBookings()
        setBookings(bookingsData)
      } catch (error) {
        console.error('Error fetching bookings:', error)
        setError(error instanceof Error ? error.message : 'Failed to load bookings')
      } finally {
        setLoading(false)
      }
    }

    fetchBookings()
  }, [])

  const upcomingBookings = bookings.filter(booking => isUpcomingBooking(booking))
  const pastBookings = bookings.filter(booking => isPastBooking(booking))

  const handleCancelBooking = async (bookingId: string) => {
    try {
      const result = await cancelBooking(bookingId)
      if (result.success) {
        // Refresh bookings after successful cancellation
        const updatedBookings = await getUserBookings()
        setBookings(updatedBookings)
      } else {
        alert(`Failed to cancel booking: ${result.error}`)
      }
    } catch (error) {
      console.error('Error cancelling booking:', error)
      alert('An error occurred while cancelling the booking')
    }
  }

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
                  <BreadcrumbPage>My Bookings</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <h1 className="text-3xl font-bold mb-2">My Bookings</h1>
            <p className="text-muted-foreground">Manage your resource bookings and reservations</p>
          </div>

          {/* Loading State */}
          {loading && <LoadingSpinner />}

          {/* Error State */}
          {error && (
            <ErrorDisplay 
              error={error} 
              onRetry={() => window.location.reload()} 
            />
          )}

          {/* Bookings Content */}
          {!loading && !error && (
            <Tabs defaultValue="upcoming" className="space-y-6">
              <TabsList>
                <TabsTrigger value="upcoming">Upcoming ({upcomingBookings.length})</TabsTrigger>
                <TabsTrigger value="past">Past ({pastBookings.length})</TabsTrigger>
              </TabsList>

              <TabsContent value="upcoming" className="space-y-4">
                {upcomingBookings.length === 0 ? (
                  <div className="text-center py-12">
                    <p className="text-muted-foreground">No upcoming bookings found.</p>
                    <Link href="/resources">
                      <Button className="mt-4">Browse Resources</Button>
                    </Link>
                  </div>
                ) : (
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {upcomingBookings.map((booking) => (
                      <BookingCard 
                        key={booking.id} 
                        booking={booking}
                        onCancel={handleCancelBooking}
                        showCancelButton={true}
                      />
                    ))}
                  </div>
                )}
              </TabsContent>

              <TabsContent value="past" className="space-y-4">
                {pastBookings.length === 0 ? (
                  <div className="text-center py-12">
                    <p className="text-muted-foreground">No past bookings found.</p>
                  </div>
                ) : (
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {pastBookings.map((booking) => (
                      <BookingCard 
                        key={booking.id} 
                        booking={booking}
                        showCancelButton={false}
                      />
                    ))}
                  </div>
                )}
              </TabsContent>
            </Tabs>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 