import { AppSidebar } from "../components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbList,
  BreadcrumbPage,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { 
  Calendar,
  Clock,
  BookOpen,
  CheckCircle,
  AlertCircle
} from "lucide-react"
import { redirect } from "next/navigation"
import { getUserProfile, getMyScheduleBookings } from "./actions"
import { generateScheduleEvents } from "./utils"
import ScheduleCalendar from "./components/ScheduleCalendar"

export default async function MySchedulePage() {
  // Fetch user profile
  const profileResult = await getUserProfile()

  if (!profileResult.success || !profileResult.data) {
    redirect('/login')
  }

  const profile = profileResult.data

  // Fetch bookings where faculty_name matches the user's name
  const bookingsResult = await getMyScheduleBookings(profile.name)

  if (!bookingsResult.success) {
    console.error('Failed to fetch bookings:', bookingsResult.error)
  }

  const bookings = bookingsResult.data || []
  const events = generateScheduleEvents(bookings)

  const getBookingStats = () => {
    const total = bookings.length
    const approved = bookings.filter(b => b.status === 'approved').length
    const pending = bookings.filter(b => b.status === 'pending').length

    return { total, approved, pending }
  }

  const stats = getBookingStats()

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12">
          <div className="flex items-center gap-2 px-4 min-w-0">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem>
                  <BreadcrumbPage>My Schedule</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>

        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          {/* Page Header */}
          <div className="flex flex-col gap-2">
            <h1 className="text-2xl font-bold tracking-tight">My Schedule</h1>
            <p className="text-muted-foreground">
              View your teaching schedule and upcoming classes
            </p>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-3">
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
          </div>

          {/* Calendar */}
          <Card className="flex-1">
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Calendar className="h-5 w-5" />
                  <CardTitle>Schedule Calendar</CardTitle>
                </div>
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
              </div>
              <CardDescription>
                Classes where you are assigned as the faculty
              </CardDescription>
            </CardHeader>
            <CardContent>
              {bookings.length === 0 ? (
                <div className="flex flex-col items-center justify-center py-12 text-center">
                  <Calendar className="h-12 w-12 text-muted-foreground mb-4" />
                  <h3 className="text-lg font-medium">No classes scheduled</h3>
                  <p className="text-muted-foreground mt-1">
                    You don&apos;t have any classes assigned to you yet.
                  </p>
                </div>
              ) : (
                <div className="h-[600px]">
                  <ScheduleCalendar events={events} />
                </div>
              )}
            </CardContent>
          </Card>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
