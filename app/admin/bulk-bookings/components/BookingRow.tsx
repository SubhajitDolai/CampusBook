'use client'

import React, { useState, useEffect, useRef, useCallback } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Textarea } from '@/components/ui/textarea'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { Card } from '@/components/ui/card'
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from '@/components/ui/alert-dialog'
import { Copy, Trash2, AlertCircle, Search, X } from 'lucide-react'
import { toast } from 'sonner'
import { BulkBookingRow, getBuildingsForBulk, getFloorsForBulk, getResourcesForBulk } from '../actions'
import { createClient } from '@/utils/supabase/client'

interface FacultyOption {
  name: string
  email: string
}

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
  const [localErrors, setLocalErrors] = useState<string[]>([])
  
  // Faculty search state
  const [facultyNameInput, setFacultyNameInput] = useState(row.faculty_name || '')
  const [facultyOptions, setFacultyOptions] = useState<FacultyOption[]>([])
  const [isSearchingFaculty, setIsSearchingFaculty] = useState(false)
  const [showFacultyDropdown, setShowFacultyDropdown] = useState(false)
  const facultyInputRef = useRef<HTMLInputElement>(null)
  const facultyInputRefDesktop = useRef<HTMLInputElement>(null)
  const dropdownRef = useRef<HTMLDivElement>(null)
  const dropdownRefDesktop = useRef<HTMLDivElement>(null)

  // Search for faculty names
  const searchFaculty = useCallback(async (query: string) => {
    if (query.length < 2) {
      setFacultyOptions([])
      return
    }
    
    setIsSearchingFaculty(true)
    try {
      const supabase = createClient()
      const { data, error } = await supabase
        .from('profiles')
        .select('name, email')
        .ilike('name', `%${query}%`)
        .limit(10)
      
      if (error) {
        console.error('Error searching faculty:', error)
        setFacultyOptions([])
      } else {
        setFacultyOptions(data || [])
      }
    } catch (err) {
      console.error('Error searching faculty:', err)
      setFacultyOptions([])
    } finally {
      setIsSearchingFaculty(false)
    }
  }, [])

  // Debounced faculty search
  useEffect(() => {
    const timer = setTimeout(() => {
      if (facultyNameInput && !row.faculty_name) {
        searchFaculty(facultyNameInput)
      }
    }, 300)
    return () => clearTimeout(timer)
  }, [facultyNameInput, row.faculty_name, searchFaculty])

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      const target = event.target as Node
      if (
        (dropdownRef.current && !dropdownRef.current.contains(target) &&
         facultyInputRef.current && !facultyInputRef.current.contains(target)) &&
        (dropdownRefDesktop.current && !dropdownRefDesktop.current.contains(target) &&
         facultyInputRefDesktop.current && !facultyInputRefDesktop.current.contains(target))
      ) {
        setShowFacultyDropdown(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  // Sync facultyNameInput when row.faculty_name changes externally (e.g., copy)
  useEffect(() => {
    setFacultyNameInput(row.faculty_name || '')
  }, [row.faculty_name])

  const handleSelectFaculty = (option: FacultyOption) => {
    onUpdate({ faculty_name: option.name })
    setFacultyNameInput(option.name)
    setShowFacultyDropdown(false)
    setFacultyOptions([])
  }

  const handleClearFaculty = () => {
    onUpdate({ faculty_name: '' })
    setFacultyNameInput('')
    setFacultyOptions([])
    facultyInputRef.current?.focus()
  }
  
  // Validation helper
  const validateTemporalRange = (startDate: string, endDate: string, startTime: string, endTime: string) => {
    const errors: string[] = []
    
    if (startDate && endDate && new Date(endDate) < new Date(startDate)) {
      errors.push('End date cannot be before start date')
    }
    
    if (startTime && endTime) {
      const startMinutes = parseInt(startTime.split(':')[0]) * 60 + parseInt(startTime.split(':')[1])
      const endMinutes = parseInt(endTime.split(':')[0]) * 60 + parseInt(endTime.split(':')[1])
      
      if (endMinutes <= startMinutes) {
        errors.push('End time must be after start time')
      }
    }
    
    return errors
  }
  
  // Validate on row changes
  useEffect(() => {
    const errors = validateTemporalRange(row.start_date, row.end_date, row.start_time, row.end_time)
    setLocalErrors(errors)
  }, [row.start_date, row.end_date, row.start_time, row.end_time])

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

  const handleCopy = () => {
    onCopy()
    toast.success('Row copied successfully!')
  }

  const handleDelete = () => {
    onRemove()
    toast.success('Row deleted successfully!')
  }

  const hasConflicts = conflicts.length > 0
  const hasBlockingConflicts = conflicts.some(c => c.type !== 'overlap_pending')
  const hasValidationErrors = localErrors.length > 0

  return (
    <Card className={`p-4 ${hasValidationErrors || hasBlockingConflicts ? 'border-red-200 bg-red-50' : hasConflicts ? 'border-yellow-200 bg-yellow-50' : ''}`}>
      {/* Mobile Layout */}
      <div className="block md:hidden space-y-4">
        {/* Row Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-sm font-medium">Row {index + 1}</span>
            {hasConflicts && (
              <AlertCircle className="h-4 w-4 text-red-500" />
            )}
          </div>
          <div className="flex gap-2">
            <Button onClick={handleCopy} variant="outline" size="sm">
              <Copy className="h-3 w-3" />
            </Button>
            <AlertDialog>
              <AlertDialogTrigger asChild>
                <Button variant="outline" size="sm">
                  <Trash2 className="h-3 w-3 text-red-500" />
                </Button>
              </AlertDialogTrigger>
              <AlertDialogContent>
                <AlertDialogHeader>
                  <AlertDialogTitle>Delete Booking Row</AlertDialogTitle>
                  <AlertDialogDescription>
                    Are you sure you want to delete this booking row? This action cannot be undone.
                  </AlertDialogDescription>
                </AlertDialogHeader>
                <AlertDialogFooter>
                  <AlertDialogCancel>Cancel</AlertDialogCancel>
                  <AlertDialogAction onClick={handleDelete}>Delete</AlertDialogAction>
                </AlertDialogFooter>
              </AlertDialogContent>
            </AlertDialog>
          </div>
        </div>

        {/* Location Section */}
        <div className="space-y-3">
          <h4 className="text-sm font-medium text-muted-foreground">Location</h4>
          <div className="space-y-2">
            <Select value={row.building_id} onValueChange={(value) => onUpdate({ building_id: value })}>
              <SelectTrigger className="h-10">
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
              <SelectTrigger className="h-10">
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
              <SelectTrigger className="h-10">
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
        </div>

        {/* Date & Time Section */}
        <div className="space-y-3">
          <h4 className="text-sm font-medium text-muted-foreground">Schedule</h4>
          <div className="grid grid-cols-2 gap-2">
            <Input
              type="date"
              value={row.start_date}
              onChange={(e) => onUpdate({ start_date: e.target.value })}
              className={`h-10 ${localErrors.some(e => e.includes('date')) ? 'border-red-500' : ''}`}
              placeholder="Start date"
            />
            <Input
              type="date"
              value={row.end_date}
              onChange={(e) => onUpdate({ end_date: e.target.value })}
              className={`h-10 ${localErrors.some(e => e.includes('date')) ? 'border-red-500' : ''}`}
              placeholder="End date"
              min={row.start_date || undefined}
            />
            <Input
              type="time"
              value={row.start_time}
              onChange={(e) => onUpdate({ start_time: e.target.value })}
              className={`h-10 ${localErrors.some(e => e.includes('time')) ? 'border-red-500' : ''}`}
              placeholder="Start time"
            />
            <Input
              type="time"
              value={row.end_time}
              onChange={(e) => onUpdate({ end_time: e.target.value })}
              className={`h-10 ${localErrors.some(e => e.includes('time')) ? 'border-red-500' : ''}`}
              placeholder="End time"
            />
          </div>
        </div>

        {/* Course & Details Section */}
        <div className="space-y-3">
          <h4 className="text-sm font-medium text-muted-foreground">Course Details</h4>
          <div className="space-y-2">
            <Input
              value={row.subject}
              onChange={(e) => onUpdate({ subject: e.target.value })}
              placeholder="Subject *"
              className="h-10"
            />
            <Input
              value={row.class_name}
              onChange={(e) => onUpdate({ class_name: e.target.value })}
              placeholder="Class *"
              className="h-10"
            />
            {/* Faculty Name with Autocomplete */}
            <div className="relative">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  ref={facultyInputRef}
                  value={facultyNameInput}
                  onChange={(e) => {
                    setFacultyNameInput(e.target.value)
                    if (row.faculty_name) {
                      onUpdate({ faculty_name: '' })
                    }
                    setShowFacultyDropdown(true)
                  }}
                  onFocus={() => {
                    if (facultyNameInput.length >= 2 && !row.faculty_name) {
                      setShowFacultyDropdown(true)
                    }
                  }}
                  placeholder="Search faculty name"
                  className="h-10 pl-9 pr-8"
                />
                {row.faculty_name && (
                  <button
                    type="button"
                    onClick={handleClearFaculty}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                  >
                    <X className="h-4 w-4" />
                  </button>
                )}
              </div>
              {showFacultyDropdown && facultyOptions.length > 0 && (
                <div
                  ref={dropdownRef}
                  className="absolute z-50 top-full left-0 right-0 mt-1 bg-popover border rounded-md shadow-md max-h-48 overflow-auto"
                >
                  {facultyOptions.map((option, idx) => (
                    <button
                      key={idx}
                      type="button"
                      onClick={() => handleSelectFaculty(option)}
                      className="w-full px-3 py-2 text-left hover:bg-accent flex flex-col"
                    >
                      <span className="font-medium">{option.name}</span>
                      <span className="text-xs text-muted-foreground">{option.email}</span>
                    </button>
                  ))}
                </div>
              )}
              {showFacultyDropdown && isSearchingFaculty && (
                <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-popover border rounded-md shadow-md p-3 text-sm text-muted-foreground">
                  Searching...
                </div>
              )}
              {showFacultyDropdown && !isSearchingFaculty && facultyNameInput.length >= 2 && facultyOptions.length === 0 && !row.faculty_name && (
                <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-popover border rounded-md shadow-md p-3 text-sm text-muted-foreground">
                  No faculty found
                </div>
              )}
            </div>
            <Textarea
              value={row.reason}
              onChange={(e) => onUpdate({ reason: e.target.value })}
              placeholder="Reason *"
              className="resize-none"
              rows={3}
            />
          </div>
        </div>
      </div>

      {/* Desktop Layout */}
      <div className="hidden md:grid grid-cols-12 gap-4 items-start">
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
            className={`h-8 ${localErrors.some(e => e.includes('date')) ? 'border-red-500' : ''}`}
            placeholder="Start date"
          />
          <Input
            type="date"
            value={row.end_date}
            onChange={(e) => onUpdate({ end_date: e.target.value })}
            className={`h-8 ${localErrors.some(e => e.includes('date')) ? 'border-red-500' : ''}`}
            placeholder="End date"
            min={row.start_date || undefined}
          />
        </div>

        {/* Times */}
        <div className="col-span-2 space-y-2">
          <Input
            type="time"
            value={row.start_time}
            onChange={(e) => onUpdate({ start_time: e.target.value })}
            className={`h-8 ${localErrors.some(e => e.includes('time')) ? 'border-red-500' : ''}`}
            placeholder="Start time"
          />
          <Input
            type="time"
            value={row.end_time}
            onChange={(e) => onUpdate({ end_time: e.target.value })}
            className={`h-8 ${localErrors.some(e => e.includes('time')) ? 'border-red-500' : ''}`}
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
          {/* Faculty Name with Autocomplete - Desktop */}
          <div className="relative">
            <div className="relative">
              <Search className="absolute left-2 top-1/2 -translate-y-1/2 h-3 w-3 text-muted-foreground" />
              <Input
                ref={facultyInputRefDesktop}
                value={facultyNameInput}
                onChange={(e) => {
                  setFacultyNameInput(e.target.value)
                  if (row.faculty_name) {
                    onUpdate({ faculty_name: '' })
                  }
                  setShowFacultyDropdown(true)
                }}
                onFocus={() => {
                  if (facultyNameInput.length >= 2 && !row.faculty_name) {
                    setShowFacultyDropdown(true)
                  }
                }}
                placeholder="Search faculty"
                className="h-8 pl-7 pr-6 text-sm"
              />
              {row.faculty_name && (
                <button
                  type="button"
                  onClick={handleClearFaculty}
                  className="absolute right-2 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                >
                  <X className="h-3 w-3" />
                </button>
              )}
            </div>
            {showFacultyDropdown && facultyOptions.length > 0 && (
              <div
                ref={dropdownRefDesktop}
                className="absolute z-50 top-full left-0 right-0 mt-1 bg-popover border rounded-md shadow-md max-h-40 overflow-auto"
              >
                {facultyOptions.map((option, idx) => (
                  <button
                    key={idx}
                    type="button"
                    onClick={() => handleSelectFaculty(option)}
                    className="w-full px-2 py-1.5 text-left hover:bg-accent flex flex-col"
                  >
                    <span className="font-medium text-sm">{option.name}</span>
                    <span className="text-xs text-muted-foreground">{option.email}</span>
                  </button>
                ))}
              </div>
            )}
            {showFacultyDropdown && isSearchingFaculty && (
              <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-popover border rounded-md shadow-md p-2 text-xs text-muted-foreground">
                Searching...
              </div>
            )}
            {showFacultyDropdown && !isSearchingFaculty && facultyNameInput.length >= 2 && facultyOptions.length === 0 && !row.faculty_name && (
              <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-popover border rounded-md shadow-md p-2 text-xs text-muted-foreground">
                No faculty found
              </div>
            )}
          </div>
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
          <Button onClick={handleCopy} variant="outline" size="sm">
            <Copy className="h-3 w-3" />
          </Button>
          <AlertDialog>
            <AlertDialogTrigger asChild>
              <Button variant="outline" size="sm">
                <Trash2 className="h-3 w-3 text-red-500" />
              </Button>
            </AlertDialogTrigger>
            <AlertDialogContent>
              <AlertDialogHeader>
                <AlertDialogTitle>Delete Booking Row</AlertDialogTitle>
                <AlertDialogDescription>
                  Are you sure you want to delete this booking row? This action cannot be undone.
                </AlertDialogDescription>
              </AlertDialogHeader>
              <AlertDialogFooter>
                <AlertDialogCancel>Cancel</AlertDialogCancel>
                <AlertDialogAction onClick={handleDelete}>Delete</AlertDialogAction>
              </AlertDialogFooter>
            </AlertDialogContent>
          </AlertDialog>
        </div>
      </div>

      {/* Weekdays */}
      <div className="mt-4 pt-4 border-t">
        <Label className="text-sm font-medium mb-2 block">Days of the week</Label>
        <div className="flex flex-wrap gap-2 md:gap-2">
          {weekdays.map((weekday) => (
            <div key={weekday.id} className="flex items-center space-x-1 min-w-0">
              <Checkbox
                id={`${row.tempId}-weekday-${weekday.id}`}
                checked={row.weekdays.includes(weekday.id)}
                onCheckedChange={(checked) => 
                  handleWeekdayToggle(weekday.id, checked as boolean)
                }
              />
              <Label 
                htmlFor={`${row.tempId}-weekday-${weekday.id}`} 
                className="text-xs cursor-pointer whitespace-nowrap"
              >
                {weekday.label}
              </Label>
            </div>
          ))}
        </div>
      </div>

      {/* Local Validation Errors */}
      {localErrors.length > 0 && (
        <div className="mt-4 pt-4 border-t border-red-200">
          <div className="space-y-1">
            {localErrors.map((error, idx) => (
              <div key={idx} className="text-sm text-red-600">
                ⚠ {error}
              </div>
            ))}
          </div>
        </div>
      )}
      
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