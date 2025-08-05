'use client'

import { Button } from '@/components/ui/button'
import { Calendar } from '@/components/ui/calendar'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { TimePicker } from '@/components/ui/time-picker'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { createBooking } from '../actions'
import React from 'react'
import { useRouter } from 'next/navigation'

interface BookingFormProps {
  resourceId: string
}

export default function BookingForm({ resourceId }: BookingFormProps) {
  const router = useRouter()
  const [startDate, setStartDate] = React.useState<Date>()
  const [endDate, setEndDate] = React.useState<Date>()
  const [startTime, setStartTime] = React.useState('')
  const [endTime, setEndTime] = React.useState('')
  const [reason, setReason] = React.useState('')

  const [isSubmitting, setIsSubmitting] = React.useState(false)

  const handleBooking = async (e: React.FormEvent) => {
    e.preventDefault()
    
    if (!startDate || !endDate || !startTime || !endTime || !reason) {
      alert('Please fill in all fields')
      return
    }

    // Validate that end date is not before start date
    if (endDate < startDate) {
      alert('End date cannot be before start date')
      return
    }

    // Validate that end time is not before start time for same day bookings
    if (startDate.getTime() === endDate.getTime() && endTime <= startTime) {
      alert('End time must be after start time')
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
  

      const result = await createBooking(formData)

      if (result.error) {
        alert(`Booking failed: ${result.error}`)
      } else {
        alert('Booking created successfully!')
        // Redirect to bookings page or show success message
        router.push('/bookings')
      }
    } catch (error) {
      console.error('Booking error:', error)
      alert('An error occurred while creating the booking')
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
                disabled={(date) => date < new Date()}
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="endDate">End Date</Label>
              <Calendar
                mode="single"
                selected={endDate}
                onSelect={setEndDate}
                className="rounded-md border"
                disabled={(date) => date < new Date()}
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



          <Button 
            type="submit" 
            className="w-full" 
            disabled={!startDate || !endDate || !startTime || !endTime || !reason || isSubmitting}
          >
            {isSubmitting ? 'Creating Booking...' : 'Book Resource'}
          </Button>
        </form>
      </CardContent>
    </Card>
  )
} 