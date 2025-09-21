'use client'

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
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { MapPin, Users, Clock } from 'lucide-react'


import { getBuildingDetails, getBuildingResources, getResourceTypes, getFloorsByBuilding } from './actions'
import { notFound } from 'next/navigation'
import ResourceFilters from './components/ResourceFilters'
import React from 'react'
import { LoadingBarButton } from '../../LoadingBarButton'

interface Building {
  id: string
  name: string
  code: string
  description: string | null
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
  floor: string
  status: string
}

export default function BuildingResourcesPage({ params }: { params: Promise<{ buildingId: string }> }) {
  const resolvedParams = React.use(params)
  
  const [building, setBuilding] = React.useState<Building | null>(null)
  const [resources, setResources] = React.useState<Resource[]>([])
  const [filteredResources, setFilteredResources] = React.useState<Resource[]>([])
  const [resourceTypes, setResourceTypes] = React.useState<string[]>(['All'])
  const [floors, setFloors] = React.useState<string[]>(['All'])
  const [loading, setLoading] = React.useState(true)
  
  // Filter states
  const [searchTerm, setSearchTerm] = React.useState('')
  const [selectedType, setSelectedType] = React.useState('All')
  const [selectedFloor, setSelectedFloor] = React.useState('All')

  // Fetch data on component mount
  React.useEffect(() => {
    async function fetchData() {
      try {
        const [buildingData, resourcesData, typesData, floorsData] = await Promise.all([
          getBuildingDetails(resolvedParams.buildingId),
          getBuildingResources(resolvedParams.buildingId),
          getResourceTypes(),
          getFloorsByBuilding(resolvedParams.buildingId)
        ])

        setBuilding(buildingData)
        setResources(resourcesData || [])
        setFilteredResources(resourcesData || [])
        setResourceTypes(typesData)
        setFloors(floorsData)

        // Handle case where building doesn't exist
        if (!buildingData) {
          notFound()
        }
      } catch (error) {
        console.error('Error fetching building resources data:', error)
        notFound()
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [resolvedParams.buildingId])

  // Filter resources when search/filter changes
  React.useEffect(() => {
    const filtered = resources.filter(resource => {
      const matchesSearch = resource.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                           (resource.description?.toLowerCase().includes(searchTerm.toLowerCase()) || false)
      const matchesType = selectedType === 'All' || resource.type === selectedType
      const matchesFloor = selectedFloor === 'All' || resource.floor === selectedFloor
      
      return matchesSearch && matchesType && matchesFloor
    })
    
    setFilteredResources(filtered)
  }, [resources, searchTerm, selectedType, selectedFloor])

  if (loading) {
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
                    <BreadcrumbPage>Building Resources</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
            <div className="flex items-center justify-center py-12">
              <div className="text-center">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
                <p className="text-muted-foreground">Loading building resources...</p>
              </div>
            </div>
          </div>
        </SidebarInset>
      </SidebarProvider>
    )
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
                  <BreadcrumbLink href={`/buildings/${resolvedParams.buildingId}`}>{building?.name || 'Building'}</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbPage>Resources</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-3xl font-bold mb-2">Resources in {building?.name || 'Building'}</h1>
                <p className="text-muted-foreground">Browse and book all available resources in this building</p>
              </div>
              <Badge variant="secondary">{filteredResources.length} resources</Badge>
            </div>
          </div>

          {/* Filters */}
          <ResourceFilters
            searchTerm={searchTerm}
            setSearchTerm={setSearchTerm}
            selectedType={selectedType}
            setSelectedType={setSelectedType}
            selectedFloor={selectedFloor}
            setSelectedFloor={setSelectedFloor}
            resourceTypes={resourceTypes}
            floors={floors}
          />

          {/* Resources Grid */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredResources.map((resource: Resource) => (
              <Card key={resource.id} className="hover:shadow-lg transition-shadow">
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <div>
                      <CardTitle className="text-lg">{resource.name}</CardTitle>
                      <CardDescription>{resource.description}</CardDescription>
                    </div>
                    <Badge 
                      variant={resource.status === 'Available' ? 'default' : 'destructive'}
                    >
                      {resource.status}
                    </Badge>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <MapPin className="h-4 w-4" />
                      <span>{resource.floor}</span>
                    </div>
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <Users className="h-4 w-4" />
                      <span>Capacity: {resource.capacity}</span>
                    </div>
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <Clock className="h-4 w-4" />
                      <span>{resource.type}</span>
                    </div>
                    <LoadingBarButton href={`/buildings/${resolvedParams.buildingId}/resources/${resource.id}`} className="w-full">
                      {resource.status === 'Available' ? 'Book Now' : 'View Details'}
                    </LoadingBarButton>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          {filteredResources.length === 0 && (
            <div className="text-center py-12">
              <p className="text-muted-foreground">No resources found matching your criteria.</p>
            </div>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 