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
  X
} from "lucide-react"
import { useState, useEffect } from "react"
import { getBookings, approveBooking, rejectBooking, deleteBooking, getBookingStats } from "./actions"

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
  const [isDeleteDialogOpen, setIsDeleteDialogOpen] = useState(false)
  const [deletingBooking, setDeletingBooking] = useState<Booking | null>(null)
  const [approvingId, setApprovingId] = useState<string | null>(null)
  const [rejectingId, setRejectingId] = useState<string | null>(null)

  useEffect(() => {
    fetchBookings()
    fetchStats()
  }, [])

  const fetchBookings = async () => {
    try {
      const bookingsData = await getBookings()
      setBookings(bookingsData)
      setFilteredBookings(bookingsData)
    } catch (error) {
      console.error('Error fetching bookings:', error)
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
        await fetchBookings()
        await fetchStats()
      } else {
        alert(result.error || 'Failed to approve booking')
      }
    } catch (error) {
      console.error('Error approving booking:', error)
      alert('Failed to approve booking')
    } finally {
      setApprovingId(null)
    }
  }

  const handleRejectBooking = async (bookingId: string) => {
    setRejectingId(bookingId)
    try {
      const result = await rejectBooking(bookingId)
      if (result.success) {
        await fetchBookings()
        await fetchStats()
      } else {
        alert(result.error || 'Failed to reject booking')
      }
    } catch (error) {
      console.error('Error rejecting booking:', error)
      alert('Failed to reject booking')
    } finally {
      setRejectingId(null)
    }
  }

  const handleDeleteBooking = async () => {
    if (!deletingBooking) return
    
    try {
      const result = await deleteBooking(deletingBooking.id)
      if (result.success) {
        await fetchBookings()
        await fetchStats()
        setIsDeleteDialogOpen(false)
        setDeletingBooking(null)
      } else {
        alert(result.error || 'Failed to delete booking')
      }
    } catch (error) {
      console.error('Error deleting booking:', error)
      alert('Failed to delete booking')
    }
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
    return new Date(dateString).toLocaleDateString()
  }



  const formatDateTime = (dateString: string, timeString: string) => {
    const date = new Date(dateString)
    const time = new Date(`2000-01-01T${timeString}`)
    return `${date.toLocaleDateString()} at ${time.toLocaleTimeString([], { 
      hour: '2-digit', 
      minute: '2-digit' 
    })}`
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
                <div className="text-2xl font-bold">{stats.total}</div>
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
                <div className="text-2xl font-bold">{stats.pending}</div>
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
                <div className="text-2xl font-bold">{stats.approved}</div>
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
                <div className="text-2xl font-bold">{stats.rejected}</div>
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
                <div className="text-2xl font-bold">{stats.cancelled}</div>
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
                {filteredBookings.length === 0 ? (
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
                                {booking.profiles?.university_id}
                              </div>
                              <div className="text-xs text-muted-foreground">
                                {booking.profiles?.department}
                              </div>
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="space-y-1">
                              <div className="text-sm">
                                <span className="font-medium">From:</span> {formatDateTime(booking.start_date, booking.start_time)}
                              </div>
                              <div className="text-sm">
                                <span className="font-medium">To:</span> {formatDateTime(booking.end_date, booking.end_time)}
                              </div>
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
                                onClick={() => {
                                  setDeletingBooking(booking)
                                  setIsDeleteDialogOpen(true)
                                }}
                              >
                                <Trash2 className="h-4 w-4 text-red-500" />
                              </Button>
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