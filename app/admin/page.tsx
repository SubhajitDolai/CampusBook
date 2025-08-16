import { AppSidebar } from "./components/app-sidebar"
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
import { Building2, Users, Calendar, Settings, Users2, Layers } from "lucide-react"
import { getDashboardStats, getRecentBookings, getSystemOverview } from "./actions"

// Type for booking data
type Booking = {
  id: string
  start_date: string
  end_date: string
  start_time: string
  end_time: string
  reason: string
  status: string
  created_at: string
  resources?: {
    id: string
    name: string
    type: string
    capacity: number
  }[] | null
  profiles?: {
    id: string
    name: string
    university_id: string
    department: string
    seating_location?: string | null
    building_name?: string | null
    floor_number?: number | null
    room_number?: number | null
    cabin?: string | null
    cubicle?: string | null
    workstation?: string | null
  }[] | null
}

export default async function Page() {
  // Fetch real data from database
  const [dashboardStats, recentBookings, systemOverview] = await Promise.all([
    getDashboardStats(),
    getRecentBookings(),
    getSystemOverview(),
  ])

  const stats = [
    {
      title: "Total Buildings",
      value: dashboardStats.buildings.toString(),
      icon: Building2,
      description: "Active buildings",
    },
    {
      title: "Total Floors",
      value: dashboardStats.floors.toString(),
      icon: Layers,
      description: "Active floors",
    },
    {
      title: "Total Resources",
      value: dashboardStats.resources.toString(),
      icon: Settings,
      description: "Available resources",
    },
    {
      title: "Pending Bookings",
      value: dashboardStats.pendingBookings.toString(),
      icon: Calendar,
      description: "Awaiting approval",
    },
    {
      title: "Total Users",
      value: dashboardStats.users.toString(),
      icon: Users,
      description: "Registered users",
    },
  ]

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'pending':
        return <Badge variant="secondary">Pending</Badge>
      case 'approved':
        return <Badge variant="default">Approved</Badge>
      case 'rejected':
        return <Badge variant="destructive">Rejected</Badge>
      case 'cancelled':
        return <Badge variant="outline">Cancelled</Badge>
      default:
        return <Badge variant="outline">{status}</Badge>
    }
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
    })
  }

  const formatTime = (timeString: string) => {
    return new Date(`2000-01-01T${timeString}`).toLocaleTimeString('en-US', {
      hour: 'numeric',
      minute: '2-digit',
      hour12: true,
    })
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
                  <BreadcrumbPage>Dashboard</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          {/* Header */}
          <div className="flex flex-col gap-2">
            <h1 className="text-3xl font-bold tracking-tight">Dashboard</h1>
            <p className="text-muted-foreground">
              Welcome to the CampusBook admin dashboard. Manage your university infrastructure.
            </p>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-5">
            {stats.map((stat) => {
              const Icon = stat.icon
              return (
                <Card key={stat.title}>
                  <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                    <CardTitle className="text-sm font-medium">
                      {stat.title}
                    </CardTitle>
                    <Icon className="h-4 w-4 text-muted-foreground" />
                  </CardHeader>
                  <CardContent>
                    <div className="text-2xl font-bold">{stat.value}</div>
                    <p className="text-xs text-muted-foreground">
                      {stat.description}
                    </p>
                  </CardContent>
                </Card>
              )
            })}
          </div>

          {/* Recent Activity Section */}
          <div className="grid gap-4 md:grid-cols-2">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Calendar className="h-5 w-5" />
                  Recent Bookings
                </CardTitle>
                <CardDescription>
                  Latest booking requests and approvals
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {recentBookings.length > 0 ? (
                    recentBookings.map((booking: Booking) => (
                      <div key={booking.id} className="flex items-center justify-between">
                        <div className="space-y-1">
                          <p className="text-sm font-medium">
                            {booking.resources?.[0]?.name || 'Unknown Resource'}
                          </p>
                          <p className="text-xs text-muted-foreground">
                            {booking.profiles?.[0]?.name || 'Unknown User'} • {booking.profiles?.[0]?.department || 'Unknown Dept'} • {formatDate(booking.start_date)} • {formatTime(booking.start_time)} - {formatTime(booking.end_time)}
                          </p>
                        </div>
                        {getStatusBadge(booking.status)}
                      </div>
                    ))
                  ) : (
                    <div className="flex items-center justify-between">
                      <div className="space-y-1">
                        <p className="text-sm font-medium">No recent bookings</p>
                        <p className="text-xs text-muted-foreground">All caught up!</p>
                      </div>
                    </div>
                  )}
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Users2 className="h-5 w-5" />
                  System Overview
                </CardTitle>
                <CardDescription>
                  Quick system status and metrics
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  <div className="flex items-center justify-between">
                    <span className="text-sm text-muted-foreground">Active Buildings</span>
                    <span className="text-sm font-medium">{systemOverview.activeBuildings}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-sm text-muted-foreground">Active Floors</span>
                    <span className="text-sm font-medium">{systemOverview.activeFloors}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-sm text-muted-foreground">Available Resources</span>
                    <span className="text-sm font-medium">{systemOverview.availableResources}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-sm text-muted-foreground">Pending Approvals</span>
                    <span className="text-sm font-medium">{systemOverview.pendingApprovals}</span>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
