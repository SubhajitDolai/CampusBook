'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { MapPin, Users, Clock, Building2 } from 'lucide-react'
import Link from 'next/link'
import { ResourceWithDetails } from '../actions'

interface ResourceCardProps {
  resource: ResourceWithDetails
}

export function ResourceCard({ resource }: ResourceCardProps) {
  return (
    <Card className="hover:shadow-lg transition-shadow">
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
          <Link href={`/buildings/${resource.building.id}/resources/${resource.id}`}>
            <Button className="w-full">
              {resource.status === 'Available' ? 'Book Now' : 'View Details'}
            </Button>
          </Link>
        </div>
      </CardContent>
    </Card>
  )
} 