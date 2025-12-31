'use client'

import { Button } from '@/components/ui/button'
import { Calendar } from '@/components/ui/calendar'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { TimePicker } from '@/components/ui/time-picker'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Checkbox } from '@/components/ui/checkbox'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { updateBooking } from '../../../actions'
import { getISTDateString } from '@/lib/ist'
import React from 'react'
import { useRouter } from 'next/navigation'
import { toast } from 'sonner'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { createClient } from '@/utils/supabase/client'
import { Search, X, Check } from 'lucide-react'
import { cn } from '@/lib/utils'
import type { BookingWithDetails } from '../../../actions'

interface FacultyOption {
  name: string
  email: string
}

interface EditBookingFormProps {
  booking: BookingWithDetails
}

export function EditBookingForm({ booking }: EditBookingFormProps) {
  const router = useRouter()
  const { start } = useGlobalLoadingBar()
  
  // Parse class_name back into components (e.g., "FY B.Tech CSE - A")
  const parseClassName = (className: string | null | undefined) => {
    if (!className) {
      return {
        year: '',
        course: '',
        specialization: '',
        batch: ''
      }
    }
    
    const parts = className.split(' - ')
    const batch = parts[1] || ''
    const mainPart = parts[0] || ''
    const components = mainPart.split(' ')
    
    return {
      year: components[0] || '',
      course: components[1] || '',
      specialization: components[2] || '',
      batch: batch
    }
  }

  const parsed = parseClassName(booking.class_name)
  
  // Initialize form with existing booking data
  const [startDate, setStartDate] = React.useState<Date>(new Date(booking.start_date))
  const [endDate, setEndDate] = React.useState<Date>(new Date(booking.end_date))
  const [startTime, setStartTime] = React.useState(booking.start_time || '')
  const [endTime, setEndTime] = React.useState(booking.end_time || '')
  const [reason, setReason] = React.useState(booking.reason || '')
  const [selectedWeekdays, setSelectedWeekdays] = React.useState<number[]>(booking.weekdays || [1, 2, 3, 4, 5, 6, 7])
  const [facultyName, setFacultyName] = React.useState(booking.faculty_name || '')
  const [facultyNameInput, setFacultyNameInput] = React.useState(booking.faculty_name || '')
  const [facultyOptions, setFacultyOptions] = React.useState<FacultyOption[]>([])
  const [isSearchingFaculty, setIsSearchingFaculty] = React.useState(false)
  const [showFacultyDropdown, setShowFacultyDropdown] = React.useState(false)
  const facultyInputRef = React.useRef<HTMLInputElement>(null)
  const dropdownRef = React.useRef<HTMLDivElement>(null)
  const [subject, setSubject] = React.useState(booking.subject || '')
  const [className, setClassName] = React.useState(booking.class_name || '')
  const [year, setYear] = React.useState(parsed.year)
  const [course, setCourse] = React.useState(parsed.course)
  const [specialization, setSpecialization] = React.useState(parsed.specialization)
  const [batch, setBatch] = React.useState(parsed.batch)

  const [isSubmitting, setIsSubmitting] = React.useState(false)
  const [isCheckingConflicts, setIsCheckingConflicts] = React.useState(false)

  // Weekday options
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
    if (checked) {
      setSelectedWeekdays([...selectedWeekdays, weekdayId])
    } else {
      setSelectedWeekdays(selectedWeekdays.filter(id => id !== weekdayId))
    }
  }

  const handleSelectAllWeekdays = () => {
    setSelectedWeekdays([1, 2, 3, 4, 5, 6, 7])
  }

  const handleSelectWeekdaysOnly = () => {
    setSelectedWeekdays([2, 3, 4, 5, 6])
  }

  const handleClearAllWeekdays = () => {
    setSelectedWeekdays([])
  }

  // Search for faculty names
  const searchFaculty = React.useCallback(async (query: string) => {
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

  // Debounced search
  React.useEffect(() => {
    const timer = setTimeout(() => {
      if (facultyNameInput && !facultyName) {
        searchFaculty(facultyNameInput)
      }
    }, 300)
    return () => clearTimeout(timer)
  }, [facultyNameInput, facultyName, searchFaculty])

  // Close dropdown when clicking outside
  React.useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target as Node) &&
        facultyInputRef.current &&
        !facultyInputRef.current.contains(event.target as Node)
      ) {
        setShowFacultyDropdown(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  const handleSelectFaculty = (option: FacultyOption) => {
    setFacultyName(option.name)
    setFacultyNameInput(option.name)
    setShowFacultyDropdown(false)
    setFacultyOptions([])
  }

  const handleClearFaculty = () => {
    setFacultyName('')
    setFacultyNameInput('')
    setFacultyOptions([])
    facultyInputRef.current?.focus()
  }

  // Update class field and combine into className
  const updateClassField = (field: 'year' | 'course' | 'specialization' | 'batch', value: string) => {
    if (field === 'year') setYear(value)
    if (field === 'course') setCourse(value)
    if (field === 'specialization') setSpecialization(value)
    if (field === 'batch') setBatch(value)
    
    const yearVal = field === 'year' ? value : year
    const courseVal = field === 'course' ? value : course
    const specializationVal = field === 'specialization' ? value : specialization
    const batchVal = field === 'batch' ? value : batch
    
    const parts = [yearVal, courseVal, specializationVal].filter(Boolean)
    setClassName(parts.length > 0 ? `${parts.join(' ')}${batchVal ? ' - ' + batchVal : ''}` : '')
  }

  const handleUpdate = async (e: React.FormEvent) => {
    e.preventDefault()
    
    if (!startDate || !endDate || !startTime || !endTime || !reason || !facultyName || !subject || !className) {
      toast.error('Please fill in all required fields')
      return
    }

    if (selectedWeekdays.length === 0) {
      toast.error('Please select at least one day of the week')
      return
    }

    if (endDate < startDate) {
      toast.error('End date cannot be before start date')
      return
    }

    const startTimeMinutes = parseInt(startTime.split(':')[0]) * 60 + parseInt(startTime.split(':')[1])
    const endTimeMinutes = parseInt(endTime.split(':')[0]) * 60 + parseInt(endTime.split(':')[1])
    
    if (endTimeMinutes <= startTimeMinutes) {
      toast.error('End time must be after start time')
      return
    }

    setIsSubmitting(true)

    try {
      const result = await updateBooking(booking.id, {
        startDate: getISTDateString(startDate),
        endDate: getISTDateString(endDate),
        startTime,
        endTime,
        reason,
        weekdays: selectedWeekdays,
        facultyName,
        subject,
        className
      })

      if (result.error) {
        toast.error(`Update failed: ${result.error}`)
      } else {
        toast.success('Booking updated successfully!')
        start()
        router.push('/bookings')
      }
    } catch (error) {
      console.error('Update error:', error)
      toast.error('An error occurred while updating the booking')
    } finally {
      setIsSubmitting(false)
    }
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Edit Booking</CardTitle>
        <CardDescription>
          Updating booking for {booking.resources.name} - {booking.resources.buildings.name}
        </CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleUpdate} className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="startDate">Start Date</Label>
              <Calendar
                mode="single"
                selected={startDate}
                onSelect={(date) => date && setStartDate(date)}
                className="rounded-md border"
                disabled={(date) => {
                  const today = new Date()
                  today.setHours(0, 0, 0, 0)
                  return date < today
                }}
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="endDate">End Date</Label>
              <Calendar
                mode="single"
                selected={endDate}
                onSelect={(date) => date && setEndDate(date)}
                className="rounded-md border"
                disabled={(date) => {
                  const today = new Date()
                  today.setHours(0, 0, 0, 0)
                  return date < today
                }}
              />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <TimePicker
              value={startTime}
              onChange={setStartTime}
              label="Start Time"
              placeholder="Select start time"
              minTime="05:00"
              maxTime="22:00"
            />

            <TimePicker
              value={endTime}
              onChange={setEndTime}
              label="End Time"
              placeholder="Select end time"
              minTime="05:00"
              maxTime="22:00"
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="reason">Reason</Label>
            <Textarea
              id="reason"
              placeholder="Briefly describe the purpose of your booking..."
              value={reason}
              onChange={(e) => setReason(e.target.value)}
              rows={3}
            />
          </div>

          {/* Academic Information */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="space-y-2">
              <Label htmlFor="facultyName">Faculty Name *</Label>
              <div className="relative">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <input
                    ref={facultyInputRef}
                    id="facultyName"
                    type="text"
                    placeholder="Search faculty name..."
                    value={facultyNameInput}
                    onChange={(e) => {
                      setFacultyNameInput(e.target.value)
                      setFacultyName('')
                      setShowFacultyDropdown(true)
                    }}
                    onFocus={() => {
                      if (facultyNameInput.length >= 2 && !facultyName) {
                        setShowFacultyDropdown(true)
                      }
                    }}
                    className={cn(
                      "flex h-10 w-full rounded-md border border-input bg-background pl-9 pr-9 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
                      facultyName && "border-green-500 bg-green-50 dark:bg-green-950/20"
                    )}
                    required
                  />
                  {facultyName ? (
                    <button
                      type="button"
                      onClick={handleClearFaculty}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                    >
                      <X className="h-4 w-4" />
                    </button>
                  ) : isSearchingFaculty ? (
                    <div className="absolute right-3 top-1/2 -translate-y-1/2">
                      <div className="h-4 w-4 animate-spin rounded-full border-2 border-primary border-t-transparent" />
                    </div>
                  ) : null}
                </div>
                
                {showFacultyDropdown && facultyOptions.length > 0 && !facultyName && (
                  <div
                    ref={dropdownRef}
                    className="absolute z-50 mt-1 w-full rounded-md border bg-popover shadow-lg"
                  >
                    <ul className="max-h-60 overflow-auto py-1">
                      {facultyOptions.map((option) => (
                        <li
                          key={option.name}
                          onClick={() => handleSelectFaculty(option)}
                          className="flex items-center gap-2 px-3 py-2 text-sm cursor-pointer hover:bg-accent hover:text-accent-foreground"
                        >
                          <Check className={cn("h-4 w-4", facultyName === option.name ? "opacity-100" : "opacity-0")} />
                          <div className="flex flex-col">
                            <span className="font-medium">{option.name}</span>
                            {option.email && <span className="text-xs text-muted-foreground">{option.email}</span>}
                          </div>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
                
                {showFacultyDropdown && facultyNameInput.length >= 2 && facultyOptions.length === 0 && !isSearchingFaculty && !facultyName && (
                  <div
                    ref={dropdownRef}
                    className="absolute z-50 mt-1 w-full rounded-md border bg-popover shadow-lg"
                  >
                    <div className="px-3 py-2 text-sm text-muted-foreground">No faculty found</div>
                  </div>
                )}
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="subject">Subject *</Label>
              <input
                id="subject"
                type="text"
                placeholder="e.g., Data Structures, Machine Learning"
                value={subject}
                onChange={(e) => setSubject(e.target.value)}
                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                required
              />
            </div>
          </div>

          {/* Class Details */}
          <div className="space-y-3">
            <Label className="text-base font-semibold">Class Details *</Label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="course">Course *</Label>
                <input
                  id="course"
                  type="text"
                  placeholder="e.g., B.Tech, M.Tech, MCA"
                  value={course}
                  onChange={(e) => updateClassField('course', e.target.value)}
                  className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="specialization">Specialization</Label>
                <input
                  id="specialization"
                  type="text"
                  placeholder="e.g., CSE, AIML, DSBDA"
                  value={specialization}
                  onChange={(e) => updateClassField('specialization', e.target.value)}
                  className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="year">Year *</Label>
                <Select value={year} onValueChange={(value) => updateClassField('year', value)} required>
                  <SelectTrigger id="year">
                    <SelectValue placeholder="Select year" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="FY">FY - First Year</SelectItem>
                    <SelectItem value="SY">SY - Second Year</SelectItem>
                    <SelectItem value="TY">TY - Third Year</SelectItem>
                    <SelectItem value="Final">Final Year</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-2">
                <Label htmlFor="batch">Batch</Label>
                <Select value={batch} onValueChange={(value) => updateClassField('batch', value)}>
                  <SelectTrigger id="batch">
                    <SelectValue placeholder="Select batch" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="A">Batch A</SelectItem>
                    <SelectItem value="B">Batch B</SelectItem>
                    <SelectItem value="C">Batch C</SelectItem>
                    <SelectItem value="D">Batch D</SelectItem>
                    <SelectItem value="E">Batch E</SelectItem>
                    <SelectItem value="F">Batch F</SelectItem>
                    <SelectItem value="G">Batch G</SelectItem>
                    <SelectItem value="H">Batch H</SelectItem>
                    <SelectItem value="I">Batch I</SelectItem>
                    <SelectItem value="J">Batch J</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
            {className && (
              <p className="text-sm text-muted-foreground">
                Combined: <span className="font-medium">{className}</span>
              </p>
            )}
          </div>

          {/* Weekday Selection */}
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <Label>Select Days of the Week</Label>
              <div className="flex gap-2">
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={handleSelectAllWeekdays}
                >
                  All
                </Button>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={handleSelectWeekdaysOnly}
                >
                  Weekdays
                </Button>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={handleClearAllWeekdays}
                >
                  Clear
                </Button>
              </div>
            </div>
            
            <div className="grid grid-cols-7 gap-2">
              {weekdays.map((weekday) => (
                <div key={weekday.id} className="flex flex-col items-center space-y-2">
                  <Checkbox
                    id={`weekday-${weekday.id}`}
                    checked={selectedWeekdays.includes(weekday.id)}
                    onCheckedChange={(checked) => 
                      handleWeekdayToggle(weekday.id, checked as boolean)
                    }
                  />
                  <Label 
                    htmlFor={`weekday-${weekday.id}`} 
                    className="text-xs text-center cursor-pointer"
                    title={weekday.name}
                  >
                    {weekday.label}
                  </Label>
                </div>
              ))}
            </div>
            
            {selectedWeekdays.length === 0 && (
              <p className="text-sm text-red-500">Please select at least one day</p>
            )}
            
            {selectedWeekdays.length > 0 && (
              <p className="text-sm text-gray-600">
                Selected: {selectedWeekdays.map(id => 
                  weekdays.find(w => w.id === id)?.label
                ).join(', ')}
              </p>
            )}
          </div>

          <div className="flex gap-4">
            <Button 
              type="submit" 
              className="flex-1" 
              disabled={!startDate || !endDate || !startTime || !endTime || !reason || !facultyName || !subject || !className || selectedWeekdays.length === 0 || isSubmitting || isCheckingConflicts}
            >
              {isCheckingConflicts ? 'Checking Conflicts...' : isSubmitting ? 'Updating Booking...' : 'Update Booking'}
            </Button>
            <Button 
              type="button"
              variant="outline"
              onClick={() => {
                start()
                router.push('/bookings')
              }}
            >
              Cancel
            </Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}
