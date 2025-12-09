'use client'

import { useState, useEffect, useCallback } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { 
  Calendar,
  BookOpen,
  CheckCircle,
  AlertCircle,
  Users,
  Search,
  X
} from "lucide-react"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { getClassScheduleBookings, getAllClassNames, ClassScheduleBooking } from '../actions'
import { generateClassScheduleEvents } from '../utils'
import ClassScheduleCalendar from './ClassScheduleCalendar'

export default function ClassScheduleClient() {
  const [classNames, setClassNames] = useState<string[]>([])
  const [selectedClass, setSelectedClass] = useState<string>('')
  const [searchQuery, setSearchQuery] = useState('')
  const [showDropdown, setShowDropdown] = useState(false)
  const [bookings, setBookings] = useState<ClassScheduleBooking[]>([])
  const [loading, setLoading] = useState(false)
  const [initialLoading, setInitialLoading] = useState(true)

  // Fetch all class names on mount
  useEffect(() => {
    async function fetchClassNames() {
      const result = await getAllClassNames()
      if (result.success && result.data) {
        setClassNames(result.data)
      }
      setInitialLoading(false)
    }
    fetchClassNames()
  }, [])

  // Fetch bookings when a class is selected
  const fetchBookings = useCallback(async (className: string) => {
    if (!className) {
      setBookings([])
      return
    }
    
    setLoading(true)
    const result = await getClassScheduleBookings(className)
    if (result.success && result.data) {
      setBookings(result.data)
    } else {
      setBookings([])
    }
    setLoading(false)
  }, [])

  useEffect(() => {
    if (selectedClass) {
      fetchBookings(selectedClass)
    }
  }, [selectedClass, fetchBookings])

  const filteredClassNames = classNames.filter(name =>
    name.toLowerCase().includes(searchQuery.toLowerCase())
  )

  const handleSelectClass = (className: string) => {
    setSelectedClass(className)
    setSearchQuery(className)
    setShowDropdown(false)
  }

  const handleClearSelection = () => {
    setSelectedClass('')
    setSearchQuery('')
    setBookings([])
  }

  const events = generateClassScheduleEvents(bookings)

  const getBookingStats = () => {
    const total = bookings.length
    const approved = bookings.filter(b => b.status === 'approved').length
    const pending = bookings.filter(b => b.status === 'pending').length
    const uniqueSubjects = [...new Set(bookings.map(b => b.subject))].length

    return { total, approved, pending, uniqueSubjects }
  }

  const stats = getBookingStats()

  return (
    <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
      {/* Page Header */}
      <div className="flex flex-col gap-2">
        <h1 className="text-2xl font-bold tracking-tight">Class Schedule</h1>
        <p className="text-muted-foreground">
          View the complete schedule for any class
        </p>
      </div>

      {/* Class Selector */}
      <Card>
        <CardHeader className="pb-3">
          <CardTitle className="text-base flex items-center gap-2">
            <Users className="h-4 w-4" />
            Select Class
          </CardTitle>
          <CardDescription>
            Search and select a class to view its schedule
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="relative">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <Input
                placeholder="Search for a class..."
                value={searchQuery}
                onChange={(e) => {
                  setSearchQuery(e.target.value)
                  setShowDropdown(true)
                }}
                onFocus={() => setShowDropdown(true)}
                className="pl-9 pr-9"
              />
              {(searchQuery || selectedClass) && (
                <Button
                  variant="ghost"
                  size="sm"
                  className="absolute right-1 top-1/2 -translate-y-1/2 h-7 w-7 p-0"
                  onClick={handleClearSelection}
                >
                  <X className="h-4 w-4" />
                </Button>
              )}
            </div>
            
            {showDropdown && searchQuery && !selectedClass && (
              <div className="absolute z-50 w-full mt-1 bg-background border rounded-md shadow-lg max-h-60 overflow-auto">
                {initialLoading ? (
                  <div className="p-3 text-sm text-muted-foreground text-center">
                    Loading classes...
                  </div>
                ) : filteredClassNames.length > 0 ? (
                  filteredClassNames.map((className) => (
                    <button
                      key={className}
                      className="w-full px-3 py-2 text-left text-sm hover:bg-accent hover:text-accent-foreground transition-colors"
                      onClick={() => handleSelectClass(className)}
                    >
                      {className}
                    </button>
                  ))
                ) : (
                  <div className="p-3 text-sm text-muted-foreground text-center">
                    No classes found
                  </div>
                )}
              </div>
            )}
          </div>

          {selectedClass && (
            <div className="mt-3 flex items-center gap-2">
              <span className="text-sm text-muted-foreground">Selected:</span>
              <Badge variant="secondary" className="text-sm">
                {selectedClass}
              </Badge>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Stats Cards - Only show when a class is selected */}
      {selectedClass && (
        <div className="grid gap-4 md:grid-cols-4">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Classes</CardTitle>
              <BookOpen className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.total}</div>
              <p className="text-xs text-muted-foreground">
                Scheduled bookings
              </p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Approved</CardTitle>
              <CheckCircle className="h-4 w-4 text-green-500" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">{stats.approved}</div>
              <p className="text-xs text-muted-foreground">
                Confirmed classes
              </p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Pending</CardTitle>
              <AlertCircle className="h-4 w-4 text-amber-500" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-amber-600">{stats.pending}</div>
              <p className="text-xs text-muted-foreground">
                Awaiting approval
              </p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Subjects</CardTitle>
              <BookOpen className="h-4 w-4 text-blue-500" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-blue-600">{stats.uniqueSubjects}</div>
              <p className="text-xs text-muted-foreground">
                Unique subjects
              </p>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Calendar */}
      <Card className="flex-1">
        <CardHeader>
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Calendar className="h-5 w-5" />
              <CardTitle>Class Calendar</CardTitle>
            </div>
            {selectedClass && (
              <div className="flex items-center gap-4 text-sm">
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded bg-green-500"></div>
                  <span>Approved</span>
                </div>
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded bg-amber-500"></div>
                  <span>Pending</span>
                </div>
              </div>
            )}
          </div>
          <CardDescription>
            {selectedClass 
              ? `Schedule for ${selectedClass}` 
              : 'Select a class above to view its schedule'}
          </CardDescription>
        </CardHeader>
        <CardContent>
          {!selectedClass ? (
            <div className="flex flex-col items-center justify-center py-12 text-center">
              <Users className="h-12 w-12 text-muted-foreground mb-4" />
              <h3 className="text-lg font-medium">No class selected</h3>
              <p className="text-muted-foreground mt-1">
                Search and select a class to view its schedule
              </p>
            </div>
          ) : loading ? (
            <div className="flex flex-col items-center justify-center py-12 text-center">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary mb-4"></div>
              <p className="text-muted-foreground">Loading schedule...</p>
            </div>
          ) : bookings.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-12 text-center">
              <Calendar className="h-12 w-12 text-muted-foreground mb-4" />
              <h3 className="text-lg font-medium">No classes scheduled</h3>
              <p className="text-muted-foreground mt-1">
                There are no bookings for {selectedClass} yet.
              </p>
            </div>
          ) : (
            <div className="h-[600px]">
              <ClassScheduleCalendar events={events} />
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
