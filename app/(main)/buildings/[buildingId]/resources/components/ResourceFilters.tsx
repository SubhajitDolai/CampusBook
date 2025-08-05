'use client'

import { Input } from '@/components/ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { Search, Filter, MapPin } from 'lucide-react'
import React from 'react'

interface ResourceFiltersProps {
  searchTerm: string
  setSearchTerm: (term: string) => void
  selectedType: string
  setSelectedType: (type: string) => void
  selectedFloor: string
  setSelectedFloor: (floor: string) => void
  resourceTypes: string[]
  floors: string[]
}

export default function ResourceFilters({
  searchTerm,
  setSearchTerm,
  selectedType,
  setSelectedType,
  selectedFloor,
  setSelectedFloor,
  resourceTypes,
  floors
}: ResourceFiltersProps) {
  return (
    <div className="mb-6 space-y-4">
      <div className="flex flex-col sm:flex-row gap-4">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input
            placeholder="Search resources..."
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
        <Select value={selectedFloor} onValueChange={setSelectedFloor}>
          <SelectTrigger className="w-full sm:w-48">
            <MapPin className="h-4 w-4 mr-2" />
            <SelectValue placeholder="Filter by floor" />
          </SelectTrigger>
          <SelectContent>
            {floors.map((floor) => (
              <SelectItem key={floor} value={floor}>{floor}</SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
    </div>
  )
} 