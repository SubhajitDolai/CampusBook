'use client'

import React, { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Textarea } from '@/components/ui/textarea'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { Card } from '@/components/ui/card'
import { Copy, Trash2, AlertCircle } from 'lucide-react'
import { BulkBookingRow, getBuildingsForBulk, getFloorsForBulk, getResourcesForBulk } from '../actions'

interface BookingRowProps {
  row: BulkBookingRow
  index: number
  conflicts: Array<{
    type: 'overlap_approved' | 'overlap_pending' | 'resource_inactive'
    message: string
    conflictingBookingId?: string
  }>
  onUpdate: (updates: Partial<BulkBookingRow>) => void
  onRemove: () => void
  onCopy: () => void
}

interface Building {
  id: string
  name: string
}

interface Floor {
  id: string
  floor_number: number
  name: string
}

interface Resource {
  id: string
  name: string
  type: string
  capacity: number
}

export function BookingRow({ row, index, conflicts, onUpdate, onRemove, onCopy }: BookingRowProps) {
  const [buildings, setBuildings] = useState<Building[]>([])
  const [floors, setFloors] = useState<Floor[]>([])
  const [resources, setResources] = useState<Resource[]>([])
  const [loadingFloors, setLoadingFloors] = useState(false)
  const [loadingResources, setLoadingResources] = useState(false)

  // Load buildings on mount
  useEffect(() => {
    const loadBuildings = async () => {
      const result = await getBuildingsForBulk()
      if (result.buildings) {
        setBuildings(result.buildings)
      }
    }
    loadBuildings()
  }, [])

  // Load floors when building changes
  useEffect(() => {
    if (row.building_id) {
      setLoadingFloors(true)
      const loadFloors = async () => {
        const result = await getFloorsForBulk(row.building_id)
        if (result.floors) {
          setFloors(result.floors)
        }
        setLoadingFloors(false)
      }
      loadFloors()
      
      // Reset floor and resource when building changes
      if (row.floor_id) {
        onUpdate({ floor_id: '', resource_id: '' })
      }
    } else {
      setFloors([])
      setResources([])
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [row.building_id])

  // Load resources when floor changes
  useEffect(() => {
    if (row.floor_id) {
      setLoadingResources(true)
      const loadResources = async () => {
        const result = await getResourcesForBulk(row.floor_id)
        if (result.resources) {
          setResources(result.resources)
        }
        setLoadingResources(false)
      }
      loadResources()
      
      // Reset resource when floor changes
      if (row.resource_id) {
        onUpdate({ resource_id: '' })
      }
    } else {
      setResources([])
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [row.floor_id])

  const weekdays = [
    { id: 1, label: 'Sun', name: 'Sunday' },
    { id: 2, label: 'Mon', name: 'Monday' },
    { id: 3, label: 'Tue', name: 'Tuesday' },
    { id: 4, label: 'Wed', name: 'Wednesday' },
    { id: 5, label: 'Thu', name: 'Thursday' },
    { id: 6, label: 'Fri', name: 'Friday' },
    { id: 7, label: 'Sat', name: 'Saturday' }
  ]

  const handleWeekdayToggle = (weekdayId: number, checked: boolean) => {
    const newWeekdays = checked
      ? [...row.weekdays, weekdayId].sort()
      : row.weekdays.filter(id => id !== weekdayId)
    onUpdate({ weekdays: newWeekdays })
  }

  const hasConflicts = conflicts.length > 0
  const hasBlockingConflicts = conflicts.some(c => c.type !== 'overlap_pending')

  return (
    <Card className={`p-4 ${hasBlockingConflicts ? 'border-red-200 bg-red-50' : hasConflicts ? 'border-yellow-200 bg-yellow-50' : ''}`}>
      <div className="grid grid-cols-12 gap-4 items-start">
        {/* Row Number */}
        <div className="col-span-1 flex items-center justify-center">
          <span className="text-sm font-medium">{index + 1}</span>
          {hasConflicts && (
            <AlertCircle className="h-4 w-4 ml-2 text-red-500" />
          )}
        </div>

        {/* Building → Floor → Resource */}
        <div className="col-span-2 space-y-2">
          <Select value={row.building_id} onValueChange={(value) => onUpdate({ building_id: value })}>
            <SelectTrigger className="h-8">
              <SelectValue placeholder="Select building" />
            </SelectTrigger>
            <SelectContent>
              {buildings.map(building => (
                <SelectItem key={building.id} value={building.id}>
                  {building.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <Select 
            value={row.floor_id} 
            onValueChange={(value) => onUpdate({ floor_id: value })}
            disabled={!row.building_id || loadingFloors}
          >
            <SelectTrigger className="h-8">
              <SelectValue placeholder="Select floor" />
            </SelectTrigger>
            <SelectContent>
              {floors.map(floor => (
                <SelectItem key={floor.id} value={floor.id}>
                  {floor.name || `Floor ${floor.floor_number}`}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <Select 
            value={row.resource_id} 
            onValueChange={(value) => onUpdate({ resource_id: value })}
            disabled={!row.floor_id || loadingResources}
          >
            <SelectTrigger className="h-8">
              <SelectValue placeholder="Select resource" />
            </SelectTrigger>
            <SelectContent>
              {resources.map(resource => (
                <SelectItem key={resource.id} value={resource.id}>
                  {resource.name} ({resource.type}, {resource.capacity} seats)
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        {/* Dates */}
        <div className="col-span-2 space-y-2">
          <Input
            type="date"
            value={row.start_date}
            onChange={(e) => onUpdate({ start_date: e.target.value })}
            className="h-8"
            placeholder="Start date"
          />
          <Input
            type="date"
            value={row.end_date}
            onChange={(e) => onUpdate({ end_date: e.target.value })}
            className="h-8"
            placeholder="End date"
          />
        </div>

        {/* Times */}
        <div className="col-span-2 space-y-2">
          <Input
            type="time"
            value={row.start_time}
            onChange={(e) => onUpdate({ start_time: e.target.value })}
            className="h-8"
            placeholder="Start time"
          />
          <Input
            type="time"
            value={row.end_time}
            onChange={(e) => onUpdate({ end_time: e.target.value })}
            className="h-8"
            placeholder="End time"
          />
        </div>

        {/* Course Info */}
        <div className="col-span-2 space-y-2">
          <Input
            value={row.subject}
            onChange={(e) => onUpdate({ subject: e.target.value })}
            placeholder="Subject *"
            className="h-8"
          />
          <Input
            value={row.class_name}
            onChange={(e) => onUpdate({ class_name: e.target.value })}
            placeholder="Class *"
            className="h-8"
          />
        </div>

        {/* Details */}
        <div className="col-span-2 space-y-2">
          <Input
            value={row.faculty_name}
            onChange={(e) => onUpdate({ faculty_name: e.target.value })}
            placeholder="Faculty name"
            className="h-8"
          />
          <Textarea
            value={row.reason}
            onChange={(e) => onUpdate({ reason: e.target.value })}
            placeholder="Reason *"
            className="h-16 resize-none"
            rows={2}
          />
        </div>

        {/* Actions */}
        <div className="col-span-1 flex flex-col gap-2">
          <Button onClick={onCopy} variant="outline" size="sm">
            <Copy className="h-3 w-3" />
          </Button>
          <Button onClick={onRemove} variant="outline" size="sm">
            <Trash2 className="h-3 w-3" />
          </Button>
        </div>
      </div>

      {/* Weekdays */}
      <div className="mt-4 pt-4 border-t">
        <Label className="text-sm font-medium mb-2 block">Days of the week</Label>
        <div className="flex gap-2">
          {weekdays.map((weekday) => (
            <div key={weekday.id} className="flex items-center space-x-1">
              <Checkbox
                id={`${row.tempId}-weekday-${weekday.id}`}
                checked={row.weekdays.includes(weekday.id)}
                onCheckedChange={(checked) => 
                  handleWeekdayToggle(weekday.id, checked as boolean)
                }
              />
              <Label 
                htmlFor={`${row.tempId}-weekday-${weekday.id}`} 
                className="text-xs cursor-pointer"
              >
                {weekday.label}
              </Label>
            </div>
          ))}
        </div>
      </div>

      {/* Conflicts */}
      {conflicts.length > 0 && (
        <div className="mt-4 pt-4 border-t">
          <div className="space-y-1">
            {conflicts.map((conflict, idx) => (
              <div key={idx} className={`text-sm ${conflict.type === 'overlap_approved' ? 'text-red-600' : 'text-yellow-600'}`}>
                ⚠ {conflict.message}
              </div>
            ))}
          </div>
        </div>
      )}
    </Card>
  )
}