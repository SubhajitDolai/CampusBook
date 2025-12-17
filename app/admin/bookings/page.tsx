'use client'

import { AppSidebar } from "../components/app-sidebar"
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
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow
} from "@/components/ui/table"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog"
import { 
  Calendar, 
  Search,
  CheckCircle,
  XCircle,
  Clock,
  User,
  Settings,
  Trash2,
  Loader2,
  Ban,
  Check,
  X,
  Edit
} from "lucide-react"
import { Skeleton } from "@/components/ui/skeleton"
import { Textarea } from "@/components/ui/textarea"
import { Label } from "@/components/ui/label"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import { Checkbox } from "@/components/ui/checkbox"
import { useState, useEffect } from "react"
import { toast } from "sonner"
import { getBookingsWithUserRole, approveBooking, rejectBooking, deleteBooking, getBookingStats, updateBooking } from "./actions"

type Booking = {
  id: string
  resource_id: string
  user_id: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  reason: string
  status: 'pending' | 'approved' | 'rejected' | 'cancelled'
  approved_by: string | null
  approved_at: string | null
  created_at: string
  faculty_name?: string
  subject?: string
  class_name?: string
  weekdays?: number[]
  resources?: {
    id: string
    name: string
    type: string
    capacity: number | null
    buildings?: {
      name: string
      code: string
    }
    floors?: {
      floor_number: number
      name: string | null
    }
  }
  profiles?: {
    id: string
    name: string
    email: string
    university_id: string
    department: string
    role: string
    seating_location?: string | null
    building_name?: string | null
    floor_number?: number | null
    room_number?: number | null
    cabin?: string | null
    cubicle?: string | null
    workstation?: string | null
  }
  approved_by_profile?: {
    id: string
    name: string
    email: string
  }
}

type BookingStats = {
  total: number
  pending: number
  approved: number
  rejected: number
  cancelled: number
}

export default function BookingsPage() {
  const [bookings, setBookings] = useState<Booking[]>([])
  const [filteredBookings, setFilteredBookings] = useState<Booking[]>([])
  const [stats, setStats] = useState<BookingStats>({ total: 0, pending: 0, approved: 0, rejected: 0, cancelled: 0 })
  const [searchTerm, setSearchTerm] = useState("")
  const [statusFilter, setStatusFilter] = useState<string>("all")
  const [isLoading, setIsLoading] = useState(true)
  const [isDeleteDialogOpen, setIsDeleteDialogOpen] = useState(false)
  const [deletingBooking, setDeletingBooking] = useState<Booking | null>(null)
  const [approvingId, setApprovingId] = useState<string | null>(null)
  const [rejectingId, setRejectingId] = useState<string | null>(null)
  const [isEditDialogOpen, setIsEditDialogOpen] = useState(false)
  const [editingBooking, setEditingBooking] = useState<Booking | null>(null)
  const [isSuperAdmin, setIsSuperAdmin] = useState(false)
  const [editForm, setEditForm] = useState({
    start_date: '',
    end_date: '',
    start_time: '',
    end_time: '',
    reason: '',
    faculty_name: '',
    subject: '',
    class_name: '',
    weekdays: [] as number[]
  })

  useEffect(() => {
    fetchBookingsAndRole()
    fetchStats()
  }, [])

  const fetchBookingsAndRole = async () => {
    try {
      setIsLoading(true)
      const { bookings: bookingsData, userRole } = await getBookingsWithUserRole()
      setBookings(bookingsData)
      setFilteredBookings(bookingsData)
      setIsSuperAdmin(userRole === 'super_admin')
    } catch (error) {
      console.error('Error fetching bookings:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const fetchStats = async () => {
    try {
      const statsData = await getBookingStats()
      setStats(statsData)
    } catch (error) {
      console.error('Error fetching booking stats:', error)
    }
  }

  useEffect(() => {
    const filtered = bookings.filter(booking => {
      const matchesSearch = 
        booking.reason?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        booking.profiles?.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        booking.profiles?.email?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        booking.profiles?.university_id?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        booking.resources?.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        booking.resources?.buildings?.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        booking.resources?.buildings?.code?.toLowerCase().includes(searchTerm.toLowerCase())

      const matchesStatus = statusFilter === "all" || booking.status === statusFilter

      return matchesSearch && matchesStatus
    })
    
    // Sort by created date (newest first)
    const sorted = filtered.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    
    setFilteredBookings(sorted)
  }, [searchTerm, statusFilter, bookings])

  const handleApproveBooking = async (bookingId: string) => {
    setApprovingId(bookingId)
    try {
      const result = await approveBooking(bookingId)
      if (result.success) {
        await fetchBookingsAndRole()
        await fetchStats()
        toast.success('Booking approved successfully')
      } else {
        toast.error(result.error || 'Failed to approve booking')
      }
    } catch (error) {
      console.error('Error approving booking:', error)
      toast.error('Failed to approve booking')
    } finally {
      setApprovingId(null)
    }
  }

  const handleRejectBooking = async (bookingId: string) => {
    setRejectingId(bookingId)
    try {
      const result = await rejectBooking(bookingId)
      if (result.success) {
        await fetchBookingsAndRole()
        await fetchStats()
        toast.success('Booking rejected successfully')
      } else {
        toast.error(result.error || 'Failed to reject booking')
      }
    } catch (error) {
      console.error('Error rejecting booking:', error)
      toast.error('Failed to reject booking')
    } finally {
      setRejectingId(null)
    }
  }

  const handleDeleteBooking = async () => {
    if (!deletingBooking) return
    
    try {
      const result = await deleteBooking(deletingBooking.id)
      if (result.success) {
        await fetchBookingsAndRole()
        await fetchStats()
        setIsDeleteDialogOpen(false)
        setDeletingBooking(null)
        toast.success('Booking deleted successfully')
      } else {
        toast.error(result.error || 'Failed to delete booking')
      }
    } catch (error) {
      console.error('Error deleting booking:', error)
      toast.error('Failed to delete booking')
    }
  }

  const handleEditBooking = (booking: Booking) => {
    setEditingBooking(booking)
    setEditForm({
      start_date: booking.start_date,
      end_date: booking.end_date,
      start_time: booking.start_time,
      end_time: booking.end_time,
      reason: booking.reason,
      faculty_name: booking.faculty_name || '',
      subject: booking.subject || '',
      class_name: booking.class_name || '',
      weekdays: booking.weekdays || [1, 2, 3, 4, 5, 6, 7]
    })
    setIsEditDialogOpen(true)
  }

  const handleUpdateBooking = async () => {
    if (!editingBooking) return
    
    try {
      const result = await updateBooking(editingBooking.id, editForm)
      if (result.success) {
        await fetchBookingsAndRole()
        await fetchStats()
        setIsEditDialogOpen(false)
        setEditingBooking(null)
        toast.success('Booking updated successfully')
      } else {
        toast.error(result.error || 'Failed to update booking')
      }
    } catch (error) {
      console.error('Error updating booking:', error)
      toast.error('Failed to update booking')
    }
  }

  const handleWeekdayToggle = (weekdayId: number, checked: boolean) => {
    setEditForm(prev => ({
      ...prev,
      weekdays: checked
        ? [...prev.weekdays, weekdayId].sort()
        : prev.weekdays.filter(id => id !== weekdayId)
    }))
  }

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'pending':
        return <Badge variant="secondary" className="flex items-center gap-1"><Clock className="h-3 w-3" />Pending</Badge>
      case 'approved':
        return <Badge variant="default" className="flex items-center gap-1"><CheckCircle className="h-3 w-3" />Approved</Badge>
      case 'rejected':
        return <Badge variant="destructive" className="flex items-center gap-1"><XCircle className="h-3 w-3" />Rejected</Badge>
      case 'cancelled':
        return <Badge variant="outline" className="flex items-center gap-1"><Ban className="h-3 w-3" />Cancelled</Badge>
      default:
        return <Badge variant="outline">{status}</Badge>
    }
  }

  const getTypeBadge = (type: string) => {
    const typeColors = {
      classroom: 'bg-blue-100 text-blue-800',
      lab: 'bg-green-100 text-green-800',
      hall: 'bg-purple-100 text-purple-800',
      auditorium: 'bg-orange-100 text-orange-800',
      others: 'bg-gray-100 text-gray-800'
    }
    
    return (
      <Badge className={typeColors[type as keyof typeof typeColors] || 'bg-gray-100 text-gray-800'}>
        {type.charAt(0).toUpperCase() + type.slice(1)}
      </Badge>
    )
  }

  const formatDate = (dateString: string) => {
    // Use simple string manipulation to avoid hydration issues
    const date = new Date(dateString)
    const year = date.getFullYear()
    const month = (date.getMonth() + 1).toString().padStart(2, '0')
    const day = date.getDate().toString().padStart(2, '0')
    return `${month}/${day}/${year}`
  }

  const formatTime = (timeString: string) => {
    // Convert 24-hour format to 12-hour AM/PM format to avoid hydration issues
    const [hours, minutes] = timeString.slice(0, 5).split(':')
    const hour24 = parseInt(hours)
    const hour12 = hour24 === 0 ? 12 : hour24 > 12 ? hour24 - 12 : hour24
    const ampm = hour24 >= 12 ? 'PM' : 'AM'
    return `${hour12}:${minutes} ${ampm}`
  }

  const formatWeekdays = (weekdays: number[]) => {
    const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    return weekdays.sort().map(day => dayNames[day - 1]).join(', ')
  }

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12">
          <div className="flex items-center gap-2 px-4">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem className="hidden md:block">
                  <BreadcrumbLink href="/admin">
                    Admin
                  </BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbPage>Bookings</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          {/* Header */}
          <div className="flex flex-col gap-2">
            <div>
              <h1 className="text-3xl font-bold tracking-tight">Bookings</h1>
              <p className="text-muted-foreground">
                Manage and approve resource booking requests.
              </p>
            </div>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-5">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Bookings</CardTitle>
                <Calendar className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{stats.total}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  All bookings
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Pending</CardTitle>
                <Clock className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{stats.pending}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  Awaiting approval
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Approved</CardTitle>
                <CheckCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{stats.approved}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  Confirmed bookings
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Rejected</CardTitle>
                <XCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{stats.rejected}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  Declined requests
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Cancelled</CardTitle>
                <Ban className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{stats.cancelled}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  Cancelled bookings
                </p>
              </CardContent>
            </Card>
          </div>

          {/* Search and Filters */}
          <Card>
            <CardHeader>
              <CardTitle>Booking Management</CardTitle>
              <CardDescription>
                Search and manage resource booking requests.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="mb-6 space-y-4">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    type="text"
                    placeholder="Search bookings by reason, user, or resource..."
                    className="pl-10"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </div>
                <div className="flex gap-2">
                  <Button
                    variant={statusFilter === "all" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setStatusFilter("all")}
                  >
                    All
                  </Button>
                  <Button
                    variant={statusFilter === "pending" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setStatusFilter("pending")}
                  >
                    Pending
                  </Button>
                  <Button
                    variant={statusFilter === "approved" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setStatusFilter("approved")}
                  >
                    Approved
                  </Button>
                  <Button
                    variant={statusFilter === "rejected" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setStatusFilter("rejected")}
                  >
                    Rejected
                  </Button>
                  <Button
                    variant={statusFilter === "cancelled" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setStatusFilter("cancelled")}
                  >
                    Cancelled
                  </Button>
                </div>
              </div>

              {/* Bookings Table */}
              <div className="rounded-md border">
                {isLoading ? (
                  <div className="p-4 space-y-4">
                    {[...Array(5)].map((_, i) => (
                      <div key={i} className="flex items-center gap-4">
                        <Skeleton className="h-10 w-10 rounded-full" />
                        <div className="flex-1 space-y-2">
                          <Skeleton className="h-4 w-[250px]" />
                          <Skeleton className="h-3 w-[150px]" />
                        </div>
                        <Skeleton className="h-6 w-24" />
                        <Skeleton className="h-6 w-32" />
                        <Skeleton className="h-6 w-28" />
                        <Skeleton className="h-6 w-20" />
                        <div className="flex gap-2">
                          <Skeleton className="h-8 w-8" />
                          <Skeleton className="h-8 w-8" />
                          <Skeleton className="h-8 w-8" />
                        </div>
                      </div>
                    ))}
                  </div>
                ) : filteredBookings.length === 0 ? (
                  <div className="flex flex-col items-center justify-center py-12">
                    <div className="flex h-16 w-16 items-center justify-center rounded-full bg-muted mb-4">
                      <Calendar className="h-8 w-8 text-muted-foreground" />
                    </div>
                    <h3 className="text-lg font-semibold mb-2">No bookings found</h3>
                    <p className="text-sm text-muted-foreground text-center mb-4 max-w-sm">
                      {searchTerm || statusFilter !== "all" ? 
                        `No bookings match your current filters.` :
                        'No booking requests have been made yet.'
                      }
                    </p>
                  </div>
                ) : (
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Booking Details</TableHead>
                        <TableHead>Academic Info</TableHead>
                        <TableHead>Resource</TableHead>
                        <TableHead>User</TableHead>
                        <TableHead>Schedule</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {filteredBookings.map((booking) => (
                        <TableRow key={booking.id}>
                          <TableCell>
                            <div className="flex items-center gap-3">
                              <div className="flex h-10 w-10 items-center justify-center rounded-full bg-muted">
                                <Calendar className="h-5 w-5" />
                              </div>
                              <div>
                                <p className="font-medium line-clamp-2">{booking.reason}</p>
                                <p className="text-xs text-muted-foreground">
                                  Created {formatDate(booking.created_at)}
                                </p>
                              </div>
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="space-y-1">
                              {booking.subject && (
                                <div className="flex items-center gap-1">
                                  <span className="text-xs font-medium text-muted-foreground">Subject:</span>
                                  <span className="bg-blue-50 text-blue-700 px-2 py-1 rounded text-xs font-medium">
                                    {booking.subject}
                                  </span>
                                </div>
                              )}
                              {booking.class_name && (
                                <div className="flex items-center gap-1">
                                  <span className="text-xs font-medium text-muted-foreground">Class:</span>
                                  <span className="bg-green-50 text-green-700 px-2 py-1 rounded text-xs font-medium">
                                    {booking.class_name}
                                  </span>
                                </div>
                              )}
                              {booking.faculty_name && (
                                <div className="flex items-center gap-1">
                                  <span className="text-xs font-medium text-muted-foreground">Faculty:</span>
                                  <span className="text-xs font-medium">{booking.faculty_name}</span>
                                </div>
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="space-y-1">
                              <div className="flex items-center gap-2">
                                <Settings className="h-3 w-3" />
                                <span className="font-medium">{booking.resources?.name}</span>
                              </div>
                              {getTypeBadge(booking.resources?.type || '')}
                              <div className="text-xs text-muted-foreground">
                                {booking.resources?.buildings?.name} ({booking.resources?.buildings?.code})
                              </div>
                              <div className="text-xs text-muted-foreground">
                                Floor {booking.resources?.floors?.floor_number}
                              </div>
                              {booking.resources?.capacity && (
                                <div className="text-xs text-muted-foreground">
                                  Capacity: {booking.resources.capacity} seats
                                </div>
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="space-y-1">
                              <div className="flex items-center gap-2">
                                <User className="h-3 w-3" />
                                <span className="font-medium">{booking.profiles?.name}</span>
                              </div>
                              <div className="text-xs text-muted-foreground">
                                {booking.profiles?.email}
                              </div>
                              <div className="text-xs text-muted-foreground">
                                ID: {booking.profiles?.university_id}
                              </div>
                              <div className="text-xs text-muted-foreground">
                                {booking.profiles?.department}
                              </div>
                              <div className="text-xs text-muted-foreground">
                                Role: {booking.profiles?.role}
                              </div>
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="space-y-1">
                              <div className="text-sm">
                                <span className="font-medium">Date:</span> {formatDate(booking.start_date)} <span className="font-medium">to</span> {formatDate(booking.end_date)}
                              </div>
                              <div className="text-sm">
                                <span className="font-medium">Time:</span> {formatTime(booking.start_time)} <span className="font-medium">to</span> {formatTime(booking.end_time)}
                              </div>
                              {booking.weekdays && booking.weekdays.length > 0 && (
                                <div className="text-xs text-muted-foreground">
                                  <span className="font-medium">Days:</span> {formatWeekdays(booking.weekdays)}
                                </div>
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="space-y-2">
                              {getStatusBadge(booking.status)}
                              {booking.approved_by_profile && (
                                <div className="text-xs text-muted-foreground">
                                  by {booking.approved_by_profile.name}
                                </div>
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              {isSuperAdmin && (
                                <>
                                  {booking.status === 'pending' && (
                                    <>
                                      <Button
                                        size="sm"
                                        variant="outline"
                                        onClick={() => handleApproveBooking(booking.id)}
                                        disabled={approvingId === booking.id}
                                      >
                                        {approvingId === booking.id ? (
                                          <Loader2 className="h-4 w-4 animate-spin" />
                                        ) : (
                                          <Check className="h-4 w-4" />
                                        )}
                                      </Button>
                                      <Button
                                        size="sm"
                                        variant="outline"
                                        onClick={() => handleRejectBooking(booking.id)}
                                        disabled={rejectingId === booking.id}
                                      >
                                        {rejectingId === booking.id ? (
                                          <Loader2 className="h-4 w-4 animate-spin" />
                                        ) : (
                                          <X className="h-4 w-4" />
                                        )}
                                      </Button>
                                    </>
                                  )}
                                  <Button
                                    size="sm"
                                    variant="outline"
                                    onClick={() => handleEditBooking(booking)}
                                  >
                                    <Edit className="h-4 w-4" />
                                  </Button>
                                  <Button
                                    size="sm"
                                    variant="outline"
                                    onClick={() => {
                                      setDeletingBooking(booking)
                                      setIsDeleteDialogOpen(true)
                                    }}
                                  >
                                    <Trash2 className="h-4 w-4 text-red-500" />
                                  </Button>
                                </>
                              )}
                              {!isSuperAdmin && (
                                <span className="text-xs text-muted-foreground">View only</span>
                              )}
                            </div>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                )}
              </div>
            </CardContent>
          </Card>
        </div>
      </SidebarInset>

      {/* Edit Booking Dialog */}
      <Dialog open={isEditDialogOpen} onOpenChange={setIsEditDialogOpen}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>Edit Booking</DialogTitle>
            <DialogDescription>
              Update the booking details below. All changes will be saved immediately.
            </DialogDescription>
          </DialogHeader>
          <div className="grid gap-4 py-4">
            {/* Date and Time Section */}
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="edit-start-date">Start Date *</Label>
                <Input
                  id="edit-start-date"
                  type="date"
                  value={editForm.start_date}
                  onChange={(e) => setEditForm(prev => ({ ...prev, start_date: e.target.value }))}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="edit-end-date">End Date *</Label>
                <Input
                  id="edit-end-date"
                  type="date"
                  value={editForm.end_date}
                  onChange={(e) => setEditForm(prev => ({ ...prev, end_date: e.target.value }))}
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="edit-start-time">Start Time *</Label>
                <Input
                  id="edit-start-time"
                  type="time"
                  value={editForm.start_time}
                  onChange={(e) => setEditForm(prev => ({ ...prev, start_time: e.target.value }))}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="edit-end-time">End Time *</Label>
                <Input
                  id="edit-end-time"
                  type="time"
                  value={editForm.end_time}
                  onChange={(e) => setEditForm(prev => ({ ...prev, end_time: e.target.value }))}
                />
              </div>
            </div>

            {/* Weekdays Section */}
            <div className="space-y-2">
              <Label>Weekdays *</Label>
              <div className="flex flex-wrap gap-2">
                {[
                  { id: 1, name: 'Sunday' },
                  { id: 2, name: 'Monday' },
                  { id: 3, name: 'Tuesday' },
                  { id: 4, name: 'Wednesday' },
                  { id: 5, name: 'Thursday' },
                  { id: 6, name: 'Friday' },
                  { id: 7, name: 'Saturday' }
                ].map(day => (
                  <div key={day.id} className="flex items-center space-x-2">
                    <Checkbox
                      id={`edit-weekday-${day.id}`}
                      checked={editForm.weekdays.includes(day.id)}
                      onCheckedChange={(checked) => handleWeekdayToggle(day.id, checked as boolean)}
                    />
                    <Label htmlFor={`edit-weekday-${day.id}`} className="text-sm font-normal cursor-pointer">
                      {day.name}
                    </Label>
                  </div>
                ))}
              </div>
            </div>

            {/* Subject and Class Section */}
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="edit-subject">Subject</Label>
                <Input
                  id="edit-subject"
                  placeholder="e.g., Data Structures"
                  value={editForm.subject}
                  onChange={(e) => setEditForm(prev => ({ ...prev, subject: e.target.value }))}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="edit-class-name">Class Name</Label>
                <Input
                  id="edit-class-name"
                  placeholder="e.g., FY B.Tech CSE - A"
                  value={editForm.class_name}
                  onChange={(e) => setEditForm(prev => ({ ...prev, class_name: e.target.value }))}
                />
              </div>
            </div>

            {/* Faculty Name */}
            <div className="space-y-2">
              <Label htmlFor="edit-faculty-name">Faculty Name</Label>
              <Input
                id="edit-faculty-name"
                placeholder="Faculty name"
                value={editForm.faculty_name}
                onChange={(e) => setEditForm(prev => ({ ...prev, faculty_name: e.target.value }))}
              />
            </div>

            {/* Reason */}
            <div className="space-y-2">
              <Label htmlFor="edit-reason">Reason *</Label>
              <Textarea
                id="edit-reason"
                placeholder="Purpose of booking"
                value={editForm.reason}
                onChange={(e) => setEditForm(prev => ({ ...prev, reason: e.target.value }))}
                className="min-h-[100px]"
              />
            </div>
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setIsEditDialogOpen(false)}>
              Cancel
            </Button>
            <Button onClick={handleUpdateBooking}>
              Save Changes
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      {/* Delete Confirmation Dialog */}
      <Dialog open={isDeleteDialogOpen} onOpenChange={setIsDeleteDialogOpen}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Delete Booking</DialogTitle>
            <DialogDescription>
              Are you sure you want to delete this booking? This action cannot be undone.
            </DialogDescription>
          </DialogHeader>
          <DialogFooter>
            <Button variant="outline" onClick={() => setIsDeleteDialogOpen(false)}>
              Cancel
            </Button>
            <Button variant="destructive" onClick={handleDeleteBooking}>
              Delete Booking
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </SidebarProvider>
  )
} 