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
import { MapPin, Users, Layers } from 'lucide-react'
import Link from 'next/link'
import React from 'react'
import { getBuildingWithStats, getFloorsWithStats } from '../actions'
import { notFound } from 'next/navigation'

interface Building {
  id: string
  name: string
  code: string
  description: string | null
  is_active: boolean
  created_at: string
  floors: number
  totalResources: number
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

export default async function BuildingDetailsPage({ params }: { params: Promise<{ buildingId: string }> }) {
  const { buildingId } = await params
  console.log('Building ID:', buildingId)
  
  let building: Building | null = null
  let floors: Floor[] = []
  
  try {
    // Fetch real data from database
    const [buildingData, floorsData] = await Promise.all([
      getBuildingWithStats(buildingId),
      getFloorsWithStats(buildingId)
    ])

    building = buildingData
    floors = floorsData || []

    console.log('Building data:', building)
    console.log('Floors data:', floors)

    // Handle case where building doesn't exist
    if (!building) {
      console.log('Building not found:', buildingId)
      notFound()
    }
  } catch (error) {
    console.error('Error fetching building data:', error)
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
                  <BreadcrumbPage>{building.name}</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-3xl font-bold mb-2">{building.name}</h1>
                <p className="text-muted-foreground mb-4">{building.description}</p>
                <div className="flex items-center gap-4 text-sm text-muted-foreground">
                  <div className="flex items-center gap-1">
                    <MapPin className="h-4 w-4" />
                    <span>Building Code: {building.code}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Layers className="h-4 w-4" />
                    <span>{building.floors} floors</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Users className="h-4 w-4" />
                    <span>{building.totalResources} resources</span>
                  </div>
                </div>
              </div>
              <Badge variant="secondary">Active</Badge>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {floors.map((floor) => (
              <Card key={floor.id} className="hover:shadow-lg transition-shadow">
                <CardHeader>
                  <div className="flex items-center justify-between">
                    <div>
                      <CardTitle className="text-lg">{floor.name}</CardTitle>
                      <CardDescription>{floor.description}</CardDescription>
                    </div>
                    <Badge variant="outline">{floor.resources} resources</Badge>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <Layers className="h-4 w-4" />
                      <span>Floor {floor.floor_number}</span>
                    </div>
                    <div className="flex gap-2">
                      <Link href={`/buildings/${buildingId}/floors/${floor.id}`} className="flex-1">
                        <Button className="w-full">
                          View Floor
                        </Button>
                      </Link>
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          <div className="mt-8">
            <Link href={`/buildings/${buildingId}/resources`}>
              <Button variant="outline" className="w-full md:w-auto">
                View All Resources in Building
              </Button>
            </Link>
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 