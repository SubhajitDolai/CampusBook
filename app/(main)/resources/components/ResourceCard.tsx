'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { MapPin, Users, Clock, Building2, Calendar } from 'lucide-react'
import { ResourceWithDetails } from '../actions'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { useRouter } from 'next/navigation'
import { getStatusBadgeVariant, getButtonText } from '@/lib/status-utils'

interface ResourceCardProps {
  resource: ResourceWithDetails
}

export function ResourceCard({ resource }: ResourceCardProps) {
  const { start } = useGlobalLoadingBar()
  const router = useRouter()

  const handleNavigation = (href: string) => {
    start()
    router.push(href)
  }

  return (
    <Card className="hover:shadow-lg transition-shadow">
      <CardHeader>
        <div className="flex items-start justify-between">
          <div>
            <CardTitle className="text-lg">{resource.name}</CardTitle>
            <CardDescription>{resource.description}</CardDescription>
          </div>
          <Badge 
            variant={getStatusBadgeVariant(resource.status)}
          >
            {resource.status}
          </Badge>
        </div>
      </CardHeader>
      <CardContent>
        <div className="space-y-3">
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <Building2 className="h-4 w-4" />
            <span>{resource.building.name}</span>
          </div>
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <MapPin className="h-4 w-4" />
            <span>{resource.floor.name || `Floor ${resource.floor.floor_number}`}</span>
          </div>
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <Users className="h-4 w-4" />
            <span>Capacity: {resource.capacity || 'N/A'}</span>
          </div>
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <Clock className="h-4 w-4" />
            <span>{resource.type}</span>
          </div>
          <div className="flex gap-2">
            <Button 
              className="flex-1"
              onClick={() => handleNavigation(`/buildings/${resource.building.id}/resources/${resource.id}`)}
            >
              {getButtonText(resource.status)}
            </Button>
            <Button 
              variant="outline"
              size="default"
              onClick={() => handleNavigation(`/buildings/${resource.building.id}/resources/${resource.id}/calendar`)}
            >
              <Calendar className="h-4 w-4" />
            </Button>
          </div>
        </div>
      </CardContent>
    </Card>
  )
} 