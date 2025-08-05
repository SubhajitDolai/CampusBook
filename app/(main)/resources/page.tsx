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

import React from 'react'
import { getAllResources, getResourceTypes, getBuildings, ResourceWithDetails } from './actions'
import { ResourceFilters } from './components/ResourceFilters'
import { ResourceCard } from './components/ResourceCard'
import { LoadingSpinner } from './components/LoadingSpinner'

export default function ResourcesPage() {
  const [searchTerm, setSearchTerm] = React.useState('')
  const [selectedType, setSelectedType] = React.useState('All')
  const [selectedBuilding, setSelectedBuilding] = React.useState('All')
  const [resources, setResources] = React.useState<ResourceWithDetails[]>([])
  const [resourceTypes, setResourceTypes] = React.useState<string[]>([])
  const [buildings, setBuildings] = React.useState<string[]>([])
  const [loading, setLoading] = React.useState(true)
  const [error, setError] = React.useState<string | null>(null)

  // Fetch data on component mount
  React.useEffect(() => {
    async function fetchData() {
      try {
        setError(null)
        const [resourcesData, typesData, buildingsData] = await Promise.all([
          getAllResources(),
          getResourceTypes(),
          getBuildings()
        ])
        
        setResources(resourcesData)
        setResourceTypes(typesData)
        setBuildings(buildingsData)
      } catch (error) {
        console.error('Error fetching data:', error)
        setError(error instanceof Error ? error.message : 'Failed to load resources')
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [])

  const filteredResources = resources.filter(resource => {
    const matchesSearch = resource.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         (resource.description?.toLowerCase().includes(searchTerm.toLowerCase()) || false) ||
                         resource.building.name.toLowerCase().includes(searchTerm.toLowerCase())
    const matchesType = selectedType === 'All' || resource.type === selectedType
    const matchesBuilding = selectedBuilding === 'All' || resource.building.name === selectedBuilding
    
    return matchesSearch && matchesType && matchesBuilding
  })

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
                  <BreadcrumbPage>Resources</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <h1 className="text-3xl font-bold mb-2">All Resources</h1>
            <p className="text-muted-foreground">Search and book resources across all campus buildings</p>
          </div>

          {/* Filters */}
          <ResourceFilters
            searchTerm={searchTerm}
            setSearchTerm={setSearchTerm}
            selectedType={selectedType}
            setSelectedType={setSelectedType}
            selectedBuilding={selectedBuilding}
            setSelectedBuilding={setSelectedBuilding}
            resourceTypes={resourceTypes}
            buildings={buildings}
          />

          {/* Results Summary */}
          <div className="mb-6">
            <p className="text-sm text-muted-foreground">
              Showing {filteredResources.length} of {resources.length} resources
            </p>
          </div>

          {/* Loading State */}
          {loading && <LoadingSpinner />}

          {/* Error State */}
          {error && (
            <div className="text-center py-12">
              <p className="text-red-500 mb-4">Error: {error}</p>
              <button 
                onClick={() => window.location.reload()} 
                className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
              >
                Try Again
              </button>
            </div>
          )}

          {/* Resources Grid */}
          {!loading && !error && (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {filteredResources.map((resource) => (
                <ResourceCard key={resource.id} resource={resource} />
              ))}
            </div>
          )}

          {!loading && !error && filteredResources.length === 0 && (
            <div className="text-center py-12">
              <p className="text-muted-foreground">No resources found matching your criteria.</p>
            </div>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 