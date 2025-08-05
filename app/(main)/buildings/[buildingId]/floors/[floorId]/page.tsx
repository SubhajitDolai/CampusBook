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
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Layers, MapPin, Users, Building2 } from 'lucide-react'
import Link from 'next/link'
import React from 'react'
import { getBuildingDetails, getFloorWithStats, getResourcesWithStatus } from './actions'
import { notFound } from 'next/navigation'

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
  created_at: string
  resources: number
  description: string
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
  status: string
}

export default async function FloorDetailsPage({ params }: { params: Promise<{ buildingId: string; floorId: string }> }) {
  const { buildingId, floorId } = await params
  console.log('Floor page params:', { buildingId, floorId })
  
  let building: Building | null = null
  let floor: Floor | null = null
  let resources: Resource[] = []
  
  try {
    // Fetch real data from database
    const [buildingData, floorData, resourcesData] = await Promise.all([
      getBuildingDetails(buildingId),
      getFloorWithStats(floorId),
      getResourcesWithStatus(floorId)
    ])

    building = buildingData
    floor = floorData
    resources = resourcesData || []

    console.log('Building:', building)
    console.log('Floor:', floor)
    console.log('Resources:', resources)

    // Handle case where building or floor doesn't exist
    if (!building || !floor) {
      console.log('Building or floor not found')
      notFound()
    }
  } catch (error) {
    console.error('Error fetching floor data:', error)
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
                  <BreadcrumbPage>{floor.name}</BreadcrumbPage>
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
                </div>
                <h1 className="text-3xl font-bold mb-2">{floor.name}</h1>
                <p className="text-muted-foreground mb-4">{floor.description}</p>
                <div className="flex items-center gap-4 text-sm text-muted-foreground">
                  <div className="flex items-center gap-1">
                    <Layers className="h-4 w-4" />
                    <span>Floor {floor.floor_number}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Users className="h-4 w-4" />
                    <span>{floor.resources} resources</span>
                  </div>
                </div>
              </div>
              <Badge variant="secondary">Active</Badge>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {resources.map((resource) => (
              <Card key={resource.id} className="hover:shadow-lg transition-shadow">
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <div>
                      <CardTitle className="text-lg">{resource.name}</CardTitle>
                      <CardDescription>{resource.description}</CardDescription>
                    </div>
                    <Badge 
                      variant={resource.status === 'Available' ? 'default' : 'secondary'}
                    >
                      {resource.status}
                    </Badge>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <MapPin className="h-4 w-4" />
                      <span>{resource.type}</span>
                    </div>
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <Users className="h-4 w-4" />
                      <span>Capacity: {resource.capacity}</span>
                    </div>
                    <Link href={`/buildings/${buildingId}/floors/${floorId}/resources/${resource.id}`}>
                      <Button className="w-full">
                        {resource.status === 'Available' ? 'Book Now' : 'View Details'}
                      </Button>
                    </Link>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 