'use client'

import { Input } from '@/components/ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { Search, Filter, Building2 } from 'lucide-react'
import React from 'react'

interface ResourceFiltersProps {
  searchTerm: string
  setSearchTerm: (term: string) => void
  selectedType: string
  setSelectedType: (type: string) => void
  selectedBuilding: string
  setSelectedBuilding: (building: string) => void
  resourceTypes: string[]
  buildings: string[]
}

export function ResourceFilters({
  searchTerm,
  setSearchTerm,
  selectedType,
  setSelectedType,
  selectedBuilding,
  setSelectedBuilding,
  resourceTypes,
  buildings
}: ResourceFiltersProps) {
  return (
    <div className="mb-6 space-y-4">
      <div className="flex flex-col sm:flex-row gap-4">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input
            placeholder="Search resources, buildings, or descriptions..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="pl-10"
          />
        </div>
        <Select value={selectedType} onValueChange={setSelectedType}>
          <SelectTrigger className="w-full sm:w-48">
            <Filter className="h-4 w-4 mr-2" />
            <SelectValue placeholder="Filter by type" />
          </SelectTrigger>
          <SelectContent>
            {resourceTypes.map((type) => (
              <SelectItem key={type} value={type}>{type}</SelectItem>
            ))}
          </SelectContent>
        </Select>
        <Select value={selectedBuilding} onValueChange={setSelectedBuilding}>
          <SelectTrigger className="w-full sm:w-48">
            <Building2 className="h-4 w-4 mr-2" />
            <SelectValue placeholder="Filter by building" />
          </SelectTrigger>
          <SelectContent>
            {buildings.map((building) => (
              <SelectItem key={building} value={building}>{building}</SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
    </div>
  )
} 