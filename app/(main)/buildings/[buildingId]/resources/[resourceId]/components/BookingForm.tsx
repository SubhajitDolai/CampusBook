'use client'

import { Button } from '@/components/ui/button'
import { Calendar } from '@/components/ui/calendar'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { TimePicker } from '@/components/ui/time-picker'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Checkbox } from '@/components/ui/checkbox'
import { createBooking } from '../actions'
import React from 'react'
import { useRouter } from 'next/navigation'
import { toast } from 'sonner'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'

interface BookingFormProps {
  resourceId: string
}

export default function BookingForm({ resourceId }: BookingFormProps) {
  const router = useRouter()
  const { start } = useGlobalLoadingBar()
  const [startDate, setStartDate] = React.useState<Date>()
  const [endDate, setEndDate] = React.useState<Date>()
  const [startTime, setStartTime] = React.useState('')
  const [endTime, setEndTime] = React.useState('')
  const [reason, setReason] = React.useState('')
  const [selectedWeekdays, setSelectedWeekdays] = React.useState<number[]>([1, 2, 3, 4, 5, 6, 7]) // All days by default
  const [facultyName, setFacultyName] = React.useState('')
  const [subject, setSubject] = React.useState('')
  const [className, setClassName] = React.useState('')

  const [isSubmitting, setIsSubmitting] = React.useState(false)

  // Weekday options with proper mapping
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
      setSelectedWeekdays(prev => [...prev, weekdayId].sort())
    } else {
      setSelectedWeekdays(prev => prev.filter(id => id !== weekdayId))
    }
  }

  const handleSelectAllWeekdays = () => {
    setSelectedWeekdays([1, 2, 3, 4, 5, 6, 7])
  }

  const handleSelectWeekdaysOnly = () => {
    setSelectedWeekdays([2, 3, 4, 5, 6]) // Mon-Fri
  }

  const handleClearAllWeekdays = () => {
    setSelectedWeekdays([])
  }

  const handleBooking = async (e: React.FormEvent) => {
    e.preventDefault()
    
    if (!startDate || !endDate || !startTime || !endTime || !reason || !subject || !className) {
      toast.error('Please fill in all required fields')
      return
    }

    if (selectedWeekdays.length === 0) {
      toast.error('Please select at least one day of the week')
      return
    }

    // Validate that end date is not before start date
    if (endDate < startDate) {
      toast.error('End date cannot be before start date')
      return
    }

    // Validate that end time is not before start time for same day bookings
    if (startDate.getTime() === endDate.getTime() && endTime <= startTime) {
      toast.error('End time must be after start time')
      return
    }

    setIsSubmitting(true)

    try {
      // Create FormData for the server action
      const formData = new FormData()
      formData.append('resourceId', resourceId)
      formData.append('startDate', startDate.toISOString().split('T')[0])
      formData.append('endDate', endDate.toISOString().split('T')[0])
      formData.append('startTime', startTime)
      formData.append('endTime', endTime)
      formData.append('reason', reason)
      formData.append('weekdays', JSON.stringify(selectedWeekdays))
      formData.append('facultyName', facultyName)
      formData.append('subject', subject)
      formData.append('className', className)

      const result = await createBooking(formData)

      if (result.error) {
        toast.error(`Booking failed: ${result.error}`)
      } else {
        toast.success('Booking created successfully!')
        // Start loading bar and redirect to bookings page
        start()
        router.push('/bookings')
      }
    } catch (error) {
      console.error('Booking error:', error)
      toast.error('An error occurred while creating the booking')
    } finally {
      setIsSubmitting(false)
    }
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Book This Resource</CardTitle>
        <CardDescription>Select your preferred date and time</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleBooking} className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="startDate">Start Date</Label>
              <Calendar
                mode="single"
                selected={startDate}
                onSelect={setStartDate}
                className="rounded-md border"
                disabled={(date) => {
                  const today = new Date()
                  today.setHours(0, 0, 0, 0) // Set to start of today
                  return date < today
                }}
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="endDate">End Date</Label>
              <Calendar
                mode="single"
                selected={endDate}
                onSelect={setEndDate}
                className="rounded-md border"
                disabled={(date) => {
                  const today = new Date()
                  today.setHours(0, 0, 0, 0) // Set to start of today
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
              <Label htmlFor="facultyName">Faculty Name (Optional)</Label>
              <input
                id="facultyName"
                type="text"
                placeholder="Faculty conducting the class"
                value={facultyName}
                onChange={(e) => setFacultyName(e.target.value)}
                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
              />
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

            <div className="space-y-2">
              <Label htmlFor="className">Class *</Label>
              <input
                id="className"
                type="text"
                placeholder="e.g., SY DSBDA, FY BTech, TE Computer"
                value={className}
                onChange={(e) => setClassName(e.target.value)}
                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                required
              />
            </div>
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

          <Button 
            type="submit" 
            className="w-full" 
            disabled={!startDate || !endDate || !startTime || !endTime || !reason || !subject || !className || selectedWeekdays.length === 0 || isSubmitting}
          >
            {isSubmitting ? 'Creating Booking...' : 'Book Resource'}
          </Button>
        </form>
      </CardContent>
    </Card>
  )
} 