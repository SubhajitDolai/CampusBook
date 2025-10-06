import { AppSidebar } from "../../../../../components/app-sidebar"
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
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { 
  Calendar,
  Building,
  MapPin,
  Users,
  Clock
} from "lucide-react"
import { notFound } from "next/navigation"
import { getResourceBookings, getResourceDetails } from "./actions"
import { generateCalendarEvents } from "./utils"
import ResourceCalendar from "./components/ResourceCalendar"

interface CalendarPageProps {
  params: Promise<{
    buildingId: string
    resourceId: string
  }>
}

export default async function CalendarPage({ params }: CalendarPageProps) {
  const { buildingId, resourceId } = await params

  // Fetch resource details and bookings in parallel
  const [resourceResult, bookingsResult] = await Promise.all([
    getResourceDetails(resourceId),
    getResourceBookings(resourceId)
  ])

  if (!resourceResult.success || !resourceResult.data) {
    notFound()
  }

  if (!bookingsResult.success) {
    console.error('Failed to fetch bookings:', bookingsResult.error)
  }

  const resource = resourceResult.data
  const bookings = bookingsResult.data || []
  const events = generateCalendarEvents(bookings)

  const getTypeBadge = (type: string) => {
    const typeColors = {
      classroom: 'bg-blue-100 text-blue-800',
      lab: 'bg-green-100 text-green-800',
      hall: 'bg-purple-100 text-purple-800',
      auditorium: 'bg-orange-100 text-orange-800',
      others: 'bg-gray-100 text-gray-800'
    }
    
    return (
      <Badge className={typeColors[type as keyof typeof typeColors] || 'bg-gray-100 text-gray-800'}>
        {type.charAt(0).toUpperCase() + type.slice(1)}
      </Badge>
    )
  }

  const getBookingStats = () => {
    const total = bookings.length
    const approved = bookings.filter(b => b.status === 'approved').length
    const pending = bookings.filter(b => b.status === 'pending').length
    const rejected = bookings.filter(b => b.status === 'rejected').length
    const cancelled = bookings.filter(b => b.status === 'cancelled').length

    return { total, approved, pending, rejected, cancelled }
  }

  const stats = getBookingStats()

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12">
            <div className="flex items-center gap-2 px-4 min-w-0">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem>
                  <BreadcrumbLink href="/buildings">Buildings</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink href={`/buildings/${resource.buildings?.id}`}>{resource.buildings?.name}</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink href={`/buildings/${buildingId}/floors/${resource.floors?.id}`}>{resource.floors?.name}</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink href={`/buildings/${buildingId}/resources/${resourceId}`}>{resource.name}</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbPage>Calendar</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          {/* Header */}
          <div className="flex flex-col gap-4">
            <div className="flex items-center gap-4">
              <div className="flex-1">
                <h1 className="text-2xl md:text-3xl font-bold tracking-tight">Resource Calendar</h1>
                <p className="text-muted-foreground">
                  View all bookings for {resource.name} in calendar format
                </p>
              </div>
            </div>

            {/* Resource Info Card */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Building className="h-5 w-5" />
                  {resource.name}
                </CardTitle>
                <CardDescription>
                  Resource details and booking overview
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                  <div className="space-y-2">
                    <div className="flex items-center gap-2">
                      <MapPin className="h-4 w-4 text-muted-foreground" />
                      <span className="font-medium">Location</span>
                    </div>
                    <div className="text-sm text-muted-foreground">
                      <div>{resource.buildings?.name} ({resource.buildings?.code})</div>
                      <div>Floor {resource.floors?.floor_number}</div>
                    </div>
                  </div>
                  
                  <div className="space-y-2">
                    <div className="flex items-center gap-2">
                      <Calendar className="h-4 w-4 text-muted-foreground" />
                      <span className="font-medium">Type</span>
                    </div>
                    <div>
                      {getTypeBadge(resource.type)}
                    </div>
                  </div>
                  
                  {resource.capacity && (
                    <div className="space-y-2">
                      <div className="flex items-center gap-2">
                        <Users className="h-4 w-4 text-muted-foreground" />
                        <span className="font-medium">Capacity</span>
                      </div>
                      <div className="text-sm text-muted-foreground">
                        {resource.capacity} seats
                      </div>
                    </div>
                  )}
                  
                  <div className="space-y-2">
                    <div className="flex items-center gap-2">
                      <Clock className="h-4 w-4 text-muted-foreground" />
                      <span className="font-medium">Total Bookings</span>
                    </div>
                    <div className="text-sm text-muted-foreground">
                      {stats.total} bookings
                    </div>
                  </div>
                </div>
                
                {resource.description && (
                  <div className="mt-4 pt-4 border-t">
                    <h4 className="font-medium mb-2">Description</h4>
                    <p className="text-sm text-muted-foreground">{resource.description}</p>
                  </div>
                )}
              </CardContent>
            </Card>

            {/* Booking Stats */}
            <div className="grid gap-4 grid-cols-1 sm:grid-cols-2 md:grid-cols-5">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Total</CardTitle>
                  <Calendar className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.total}</div>
                  <p className="text-xs text-muted-foreground">All bookings</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Pending</CardTitle>
                  <Clock className="h-4 w-4 text-amber-500" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold text-amber-600">{stats.pending}</div>
                  <p className="text-xs text-muted-foreground">Awaiting approval</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Approved</CardTitle>
                  <div className="h-4 w-4 rounded-full bg-green-500" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold text-green-600">{stats.approved}</div>
                  <p className="text-xs text-muted-foreground">Confirmed</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Rejected</CardTitle>
                  <div className="h-4 w-4 rounded-full bg-red-500" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold text-red-600">{stats.rejected}</div>
                  <p className="text-xs text-muted-foreground">Declined</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Cancelled</CardTitle>
                  <div className="h-4 w-4 rounded-full bg-gray-500" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold text-gray-600">{stats.cancelled}</div>
                  <p className="text-xs text-muted-foreground">Cancelled</p>
                </CardContent>
              </Card>
            </div>
          </div>

          {/* Calendar */}
            <Card className="flex-1 overflow-hidden">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Calendar className="h-5 w-5" />
                Booking Calendar
              </CardTitle>
              <CardDescription>
                Interactive calendar view showing all bookings for this resource. Click on any booking to view details.
              </CardDescription>
            </CardHeader>
            <CardContent className="overflow-auto">
              <div className="mb-4">
                <div className="flex flex-wrap items-center gap-3 text-sm">
                  <div className="flex items-center gap-2">
                    <div className="h-3 w-3 rounded bg-green-500"></div>
                    <span>Approved</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <div className="h-3 w-3 rounded bg-amber-500"></div>
                    <span>Pending</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <div className="h-3 w-3 rounded bg-red-500"></div>
                    <span>Rejected</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <div className="h-3 w-3 rounded bg-gray-500"></div>
                    <span>Cancelled</span>
                  </div>
                </div>
              </div>
              
              <div className="h-[380px] sm:h-[520px] md:h-[600px]">
                <ResourceCalendar
                  events={events}
                />
              </div>
            </CardContent>
          </Card>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}