'use client'

import { AppSidebar } from "../../components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Calendar } from '@/components/ui/calendar'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { TimePicker } from '@/components/ui/time-picker'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { MapPin, Users, Clock, Building2 } from 'lucide-react'
import React from 'react'

// Mock data - replace with actual data from your database
const resource = {
  id: '1',
  name: 'Computer Lab A',
  type: 'Lab',
  building: 'Engineering Building',
  floor: 'Ground Floor',
  capacity: 25,
  status: 'Available',
  description: 'General purpose computer lab with 25 workstations equipped with the latest software and hardware. Perfect for programming classes, research work, and group projects.',
  location: 'Room 101, Ground Floor, Engineering Building',
  equipment: ['25 Workstations', 'Projector', 'Whiteboard', 'High-speed Internet'],
  hours: '8:00 AM - 10:00 PM',
  maxBookingDuration: 4 // hours
}

export default function ResourceDetailsPage() {
  const [date, setDate] = React.useState<Date>()
  const [startTime, setStartTime] = React.useState('')
  const [duration, setDuration] = React.useState('')
  const [purpose, setPurpose] = React.useState('')

  const handleBooking = (e: React.FormEvent) => {
    e.preventDefault()
    // Handle booking logic here
    console.log('Booking submitted:', { date, startTime, duration, purpose })
  }

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2">
          <div className="flex items-center gap-2 px-4">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem>
                  <BreadcrumbLink href="/resources">Resources</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbPage>{resource.name}</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-3xl font-bold mb-2">{resource.name}</h1>
                <p className="text-muted-foreground mb-4">{resource.description}</p>
                <div className="flex items-center gap-4 text-sm text-muted-foreground">
                  <div className="flex items-center gap-1">
                    <Building2 className="h-4 w-4" />
                    <span>{resource.building}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <MapPin className="h-4 w-4" />
                    <span>{resource.location}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Users className="h-4 w-4" />
                    <span>Capacity: {resource.capacity}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Clock className="h-4 w-4" />
                    <span>{resource.hours}</span>
                  </div>
                </div>
              </div>
              <Badge variant={resource.status === 'Available' ? 'default' : 'secondary'}>
                {resource.status}
              </Badge>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Resource Details */}
            <div className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Resource Details</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <h4 className="font-medium mb-2">Equipment & Features</h4>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                      {resource.equipment.map((item, index) => (
                        <div key={index} className="flex items-center gap-2 text-sm">
                          <div className="w-2 h-2 bg-primary rounded-full"></div>
                          <span>{item}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                  
                  <div>
                    <h4 className="font-medium mb-2">Booking Information</h4>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span>Maximum booking duration:</span>
                        <span>{resource.maxBookingDuration} hours</span>
                      </div>
                      <div className="flex justify-between">
                        <span>Operating hours:</span>
                        <span>{resource.hours}</span>
                      </div>
                      <div className="flex justify-between">
                        <span>Location:</span>
                        <span>{resource.location}</span>
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Booking Form */}
            <div>
              <Card>
                <CardHeader>
                  <CardTitle>Book This Resource</CardTitle>
                  <CardDescription>Select your preferred date and time</CardDescription>
                </CardHeader>
                <CardContent>
                  <form onSubmit={handleBooking} className="space-y-6">
                    <div className="space-y-2">
                      <Label htmlFor="date">Date</Label>
                      <Calendar
                        mode="single"
                        selected={date}
                        onSelect={setDate}
                        className="rounded-md border"
                        disabled={(date) => date < new Date()}
                      />
                    </div>

                    <div className="space-y-2">
                      <TimePicker
                        value={startTime}
                        onChange={setStartTime}
                        label="Start Time"
                        placeholder="Select start time"
                        minTime="08:00"
                        maxTime="22:00"
                      />
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="duration">Duration</Label>
                      <Select value={duration} onValueChange={setDuration}>
                        <SelectTrigger>
                          <SelectValue placeholder="Select duration" />
                        </SelectTrigger>
                        <SelectContent>
                          {Array.from({ length: resource.maxBookingDuration }, (_, i) => {
                            const hours = i + 1
                            return (
                              <SelectItem key={hours} value={hours.toString()}>
                                {hours} hour{hours > 1 ? 's' : ''}
                              </SelectItem>
                            )
                          })}
                        </SelectContent>
                      </Select>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="purpose">Purpose</Label>
                      <Textarea
                        id="purpose"
                        placeholder="Briefly describe the purpose of your booking..."
                        value={purpose}
                        onChange={(e) => setPurpose(e.target.value)}
                        rows={3}
                      />
                    </div>

                    <Button type="submit" className="w-full" disabled={!date || !startTime || !duration}>
                      Book Resource
                    </Button>
                  </form>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 