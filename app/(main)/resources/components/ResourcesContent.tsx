'use client'

import { useState, useTransition, useEffect, useRef, useCallback } from 'react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Loader2, ChevronDown } from 'lucide-react'
import { ResourceFilters } from './ResourceFilters'
import { ResourceCard } from './ResourceCard'
import { getPaginatedResources, type ResourcesPageData, type ResourceWithDetails } from '../actions'
import { useDebounce } from '../../../../hooks/use-debounce'

interface ResourcesContentProps {
  initialData: ResourcesPageData
}

export default function ResourcesContent({ initialData }: ResourcesContentProps) {
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedType, setSelectedType] = useState('All')
  const [selectedBuilding, setSelectedBuilding] = useState('All')
  const [resources, setResources] = useState<ResourceWithDetails[]>(initialData.resources)
  const [currentPage, setCurrentPage] = useState(1)
  const [hasMore, setHasMore] = useState(initialData.hasMore)
  const [totalCount, setTotalCount] = useState(initialData.totalCount)
  const [isPending, startTransition] = useTransition()
  const [isLoadingMore, setIsLoadingMore] = useState(false)
  
  const observerRef = useRef<HTMLDivElement>(null)
  const debouncedSearchTerm = useDebounce(searchTerm, 300)

  // Reset pagination and fetch new results when filters change
  useEffect(() => {
    startTransition(async () => {
      try {
        const results = await getPaginatedResources(
          1, // Reset to page 1
          12, // Page size
          debouncedSearchTerm,
          selectedType,
          selectedBuilding
        )
        
        // Always replace resources when filters change (don't append)
        setResources(results.resources)
        setCurrentPage(1)
        setHasMore(results.hasMore)
        setTotalCount(results.totalCount)
        
      } catch (error) {
        console.error('Error searching resources:', error)
        setResources([])
        setHasMore(false)
        setTotalCount(0)
      }
    })
  }, [debouncedSearchTerm, selectedType, selectedBuilding])

  // Load more function
  const loadMore = useCallback(async () => {
    if (isLoadingMore || !hasMore) return
    
    setIsLoadingMore(true)
    try {
      const nextPage = currentPage + 1
      const results = await getPaginatedResources(
        nextPage,
        12,
        debouncedSearchTerm,
        selectedType,
        selectedBuilding
      )
      
      // Filter out duplicates by checking existing resource IDs
      const existingIds = new Set(resources.map(r => r.id))
      const newResources = results.resources.filter(r => !existingIds.has(r.id))
      
      if (newResources.length > 0) {
        setResources(prev => [...prev, ...newResources])
      }
      
      setCurrentPage(nextPage)
      setHasMore(results.hasMore)
    } catch (error) {
      console.error('Error loading more resources:', error)
    } finally {
      setIsLoadingMore(false)
    }
  }, [currentPage, hasMore, isLoadingMore, debouncedSearchTerm, selectedType, selectedBuilding, resources])

  // Intersection Observer for infinite scroll
  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && hasMore && !isLoadingMore && !isPending) {
          loadMore()
        }
      },
      { threshold: 0.1 }
    )

    if (observerRef.current) {
      observer.observe(observerRef.current)
    }

    return () => observer.disconnect()
  }, [loadMore, hasMore, isLoadingMore, isPending])

  const hasActiveFilters = searchTerm || selectedType !== 'All' || selectedBuilding !== 'All'

  return (
    <div className="space-y-6">
      {/* Filters */}
      <ResourceFilters
        searchTerm={searchTerm}
        setSearchTerm={setSearchTerm}
        selectedType={selectedType}
        setSelectedType={setSelectedType}
        selectedBuilding={selectedBuilding}
        setSelectedBuilding={setSelectedBuilding}
        resourceTypes={initialData.resourceTypes}
        buildings={initialData.buildings}
      />

      {/* Results Summary */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <h2 className="text-xl font-semibold">
            {hasActiveFilters ? 'Search Results' : 'All Resources'}
          </h2>
          <Badge variant="secondary">
            {isPending ? (
              <div className="flex items-center gap-1">
                <Loader2 className="h-3 w-3 animate-spin" />
                Searching...
              </div>
            ) : (
              `${resources.length} of ${totalCount} ${totalCount === 1 ? 'resource' : 'resources'}`
            )}
          </Badge>
        </div>
      </div>

      {/* Resources Grid */}
      {isPending ? (
        <div className="flex items-center justify-center min-h-[200px]">
          <div className="flex items-center gap-2 text-muted-foreground">
            <Loader2 className="h-4 w-4 animate-spin" />
            Searching resources...
          </div>
        </div>
      ) : resources.length > 0 ? (
        <>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {resources.map((resource) => (
              <ResourceCard key={resource.id} resource={resource} />
            ))}
          </div>
          
          {/* Load More Area */}
          {hasMore && (
            <div className="flex flex-col items-center gap-4 py-8">
              {/* Intersection Observer Target */}
              <div ref={observerRef} className="h-4 w-full" />
              
              {isLoadingMore ? (
                <div className="flex items-center gap-2 text-muted-foreground">
                  <Loader2 className="h-4 w-4 animate-spin" />
                  Loading more resources...
                </div>
              ) : (
                <Button 
                  variant="outline" 
                  onClick={loadMore}
                  disabled={isLoadingMore}
                  className="min-w-[200px]"
                >
                  <ChevronDown className="h-4 w-4 mr-2" />
                  Load More Resources
                </Button>
              )}
            </div>
          )}
        </>
      ) : (
        <div className="text-center py-12">
          <p className="text-muted-foreground text-lg mb-2">No resources found</p>
          <p className="text-sm text-muted-foreground">
            {hasActiveFilters 
              ? 'Try adjusting your search criteria or filters'
              : 'No resources are currently available in the system'
            }
          </p>
        </div>
      )}
    </div>
  )
}