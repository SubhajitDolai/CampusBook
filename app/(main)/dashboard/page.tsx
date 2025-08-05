'use client'

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
import { Calendar, Clock, Building2, Users, TrendingUp, Loader2 } from 'lucide-react'
import React from 'react'
import { getDashboardStats, getRecentBookings, getQuickStats, DashboardStats, RecentBooking, QuickStats } from './actions'
import { StatsCard } from './components/StatsCard'
import { RecentBookingsCard } from './components/RecentBookingsCard'
import { QuickActionsCard } from './components/QuickActionsCard'

export default function DashboardPage() {
  const [stats, setStats] = React.useState<DashboardStats | null>(null)
  const [recentBookings, setRecentBookings] = React.useState<RecentBooking[]>([])
  const [quickStats, setQuickStats] = React.useState<QuickStats | null>(null)
  const [loading, setLoading] = React.useState(true)
  const [error, setError] = React.useState<string | null>(null)

  // Fetch dashboard data on component mount
  React.useEffect(() => {
    async function fetchDashboardData() {
      try {
        setError(null)
        const [statsData, bookingsData, quickStatsData] = await Promise.all([
          getDashboardStats(),
          getRecentBookings(5),
          getQuickStats()
        ])
        
        setStats(statsData)
        setRecentBookings(bookingsData)
        setQuickStats(quickStatsData)
      } catch (error) {
        console.error('Error fetching dashboard data:', error)
        setError(error instanceof Error ? error.message : 'Failed to load dashboard data')
      } finally {
        setLoading(false)
      }
    }

    fetchDashboardData()
  }, [])

  if (loading) {
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
                    <BreadcrumbPage>Dashboard</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex items-center justify-center h-[calc(100vh-4rem)]">
            <div className="flex items-center gap-2">
              <Loader2 className="h-8 w-8 animate-spin" />
              <span>Loading dashboard...</span>
            </div>
          </div>
        </SidebarInset>
      </SidebarProvider>
    )
  }

  if (error) {
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
                    <BreadcrumbPage>Dashboard</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex items-center justify-center h-[calc(100vh-4rem)]">
            <div className="text-center">
              <p className="text-red-500 mb-4">Error: {error}</p>
              <button 
                onClick={() => window.location.reload()} 
                className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
              >
                Try Again
              </button>
            </div>
          </div>
        </SidebarInset>
      </SidebarProvider>
    )
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
                  <BreadcrumbPage>Dashboard</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-6 p-6 pt-0">
          {/* Welcome Section */}
          <div className="mb-6">
            <h1 className="text-3xl font-bold mb-2">Welcome back!</h1>
            <p className="text-muted-foreground">Here&apos;s what&apos;s happening with your bookings today.</p>
          </div>

          {/* Stats Grid */}
          <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
            <StatsCard
              title="Total Bookings"
              value={stats?.totalBookings || 0}
              icon={Calendar}
              description="All time bookings"
            />
            <StatsCard
              title="Upcoming"
              value={stats?.upcomingBookings || 0}
              icon={Clock}
              description="Future bookings"
            />
            <StatsCard
              title="Available Resources"
              value={stats?.totalResources || 0}
              icon={Building2}
              description="Total resources"
            />
            <StatsCard
              title="Avg Duration"
              value={`${quickStats?.averageBookingDuration || 0}h`}
              icon={TrendingUp}
              description="Average booking length"
            />
          </div>

          {/* Quick Stats */}
          <div className="grid gap-4 md:grid-cols-3">
            <StatsCard
              title="Today"
              value={quickStats?.todayBookings || 0}
              icon={Calendar}
              description="Bookings today"
            />
            <StatsCard
              title="This Week"
              value={quickStats?.thisWeekBookings || 0}
              icon={Clock}
              description="Bookings this week"
            />
            <StatsCard
              title="This Month"
              value={quickStats?.thisMonthBookings || 0}
              icon={Users}
              description="Bookings this month"
            />
          </div>

          {/* Main Content Grid */}
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            {/* Recent Bookings */}
            <div className="lg:col-span-2">
              <RecentBookingsCard bookings={recentBookings} />
            </div>

            {/* Quick Actions */}
            <div>
              <QuickActionsCard />
            </div>
          </div>

          {/* Favorite Buildings */}
          {stats?.favoriteBuildings && stats.favoriteBuildings.length > 0 && (
            <div className="mt-6">
              <h2 className="text-xl font-semibold mb-4">Your Favorite Buildings</h2>
              <div className="grid gap-4 md:grid-cols-3">
                {stats.favoriteBuildings.map((building, index) => (
                  <div key={building} className="p-4 border rounded-lg">
                    <div className="flex items-center gap-2">
                      <Building2 className="h-5 w-5 text-blue-500" />
                      <h3 className="font-medium">{building}</h3>
                    </div>
                    <p className="text-sm text-muted-foreground mt-1">
                      Most booked building #{index + 1}
                    </p>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
