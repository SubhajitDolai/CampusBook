import { AppSidebar } from "../../../../components/app-sidebar"
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
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { MapPin, Users, Clock, Building2, Layers } from 'lucide-react'
import { getBuildingDetails, getFloorDetails, getResourceWithDetails, getResourceBookings } from './actions'
import { notFound } from 'next/navigation'
import BookingForm from './components/BookingForm'
import ExistingBookings from './components/ExistingBookings'

interface Building {
  id: string
  name: string
  code: string
  description: string | null
  is_active: boolean
}

interface Floor {
  id: string
  building_id: string
  floor_number: number
  name: string | null
  is_active: boolean
}

interface Resource {
  id: string
  building_id: string
  floor_id: string
  name: string
  type: string
  capacity: number | null
  description: string | null
  equipment: string | null
  is_active: boolean
  created_at: string
  location: string
  status: string
  equipmentList: string[]
  floor?: string
}

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
    seating_location?: string | null
    building_name?: string | null
    floor_number?: number | null
    room_number?: number | null
    cabin?: string | null
    cubicle?: string | null
    workstation?: string | null
  } | null
}

export default async function BuildingResourceDetailsPage({ params }: { params: Promise<{ buildingId: string; resourceId: string }> }) {
  const { buildingId, resourceId } = await params
  console.log('Building resource page params:', { buildingId, resourceId })
  
  let building: Building | null = null
  let floor: Floor | null = null
  let resource: Resource | null = null
  let bookings: Booking[] = []
  
  try {
    // First get the resource to find the floor_id
    const resourceData = await getResourceWithDetails(resourceId)
    if (!resourceData) {
      notFound()
    }
    
    // Fetch real data from database
    const [buildingData, floorData, bookingsData] = await Promise.all([
      getBuildingDetails(buildingId),
      getFloorDetails(resourceData.floor_id),
      getResourceBookings(resourceId)
    ])

    building = buildingData
    floor = floorData
    resource = resourceData
    bookings = bookingsData

    console.log('Building:', building)
    console.log('Floor:', floor)
    console.log('Resource:', resource)
    console.log('Bookings:', bookings)

    // Handle case where any data doesn't exist
    if (!building || !floor || !resource) {
      console.log('Building, floor, or resource not found')
      notFound()
    }
  } catch (error) {
    console.error('Error fetching building resource data:', error)
    notFound()
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
                  <BreadcrumbLink href="/buildings">Buildings</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink href={`/buildings/${buildingId}`}>{building.name}</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink href={`/buildings/${buildingId}/floors/${floor.id}`}>{floor.name}</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbPage>{resource.name}</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <div className="flex items-start justify-between">
              <div>
                <div className="flex items-center gap-2 mb-2">
                  <Building2 className="h-5 w-5 text-muted-foreground" />
                  <span className="text-muted-foreground">{building.name}</span>
                  <span className="text-muted-foreground">•</span>
                  <Layers className="h-5 w-5 text-muted-foreground" />
                  <span className="text-muted-foreground">{floor.name || `Floor ${floor.floor_number}`}</span>
                </div>
                <h1 className="text-3xl font-bold mb-2">{resource.name}</h1>
                <p className="text-muted-foreground mb-4">{resource.description}</p>
                <div className="flex items-center gap-4 text-sm text-muted-foreground">
                  <div className="flex items-center gap-1">
                    <MapPin className="h-4 w-4" />
                    <span>{resource.location}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Users className="h-4 w-4" />
                    <span>Capacity: {resource.capacity}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Clock className="h-4 w-4" />
                    <span>{resource.type}</span>
                  </div>
                </div>
              </div>
              <Badge variant={resource.status === 'Available' ? 'default' : 'destructive'}>
                {resource.status}
              </Badge>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Resource Details */}
            <div className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Resource Details</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <h4 className="font-medium mb-2">Equipment & Features</h4>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                      {resource.equipmentList?.map((item: string, index: number) => (
                        <div key={index} className="flex items-center gap-2 text-sm">
                          <div className="w-2 h-2 bg-primary rounded-full"></div>
                          <span>{item}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                  
                  <div>
                    <h4 className="font-medium mb-2">Booking Information</h4>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span>Resource Type:</span>
                        <span>{resource.type}</span>
                      </div>
                      <div className="flex justify-between">
                        <span>Capacity:</span>
                        <span>{resource.capacity} people</span>
                      </div>
                      <div className="flex justify-between">
                        <span>Active Bookings:</span>
                        <span>{bookings.length}</span>
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Existing Bookings */}
              <ExistingBookings bookings={bookings} />
            </div>

            {/* Booking Form */}
            <BookingForm 
              resourceId={resource.id} 
            />
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 