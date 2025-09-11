import { Calendar, Clock, Building2, Users, TrendingUp } from 'lucide-react'
import { getAllDashboardData } from '../actions'
import { StatsCard } from './StatsCard'
import { RecentBookingsCard } from './RecentBookingsCard'
import { QuickActionsCard } from './QuickActionsCard'

export async function DashboardContent() {
  // Single optimized call instead of 3 separate API calls
  const { stats, recentBookings, quickStats } = await getAllDashboardData()

  return (
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
          value={stats.totalBookings}
          icon={Calendar}
          description="All time bookings"
        />
        <StatsCard
          title="Upcoming"
          value={stats.upcomingBookings}
          icon={Clock}
          description="Future bookings"
        />
        <StatsCard
          title="Available Resources"
          value={stats.totalResources}
          icon={Building2}
          description="Total resources"
        />
        <StatsCard
          title="Avg Duration"
          value={`${quickStats.averageBookingDuration}h`}
          icon={TrendingUp}
          description="Average booking length"
        />
      </div>

      {/* Quick Stats */}
      <div className="grid gap-4 md:grid-cols-3">
        <StatsCard
          title="Today"
          value={quickStats.todayBookings}
          icon={Calendar}
          description="Bookings today"
        />
        <StatsCard
          title="This Week"
          value={quickStats.thisWeekBookings}
          icon={Clock}
          description="Bookings this week"
        />
        <StatsCard
          title="This Month"
          value={quickStats.thisMonthBookings}
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
      {stats.favoriteBuildings && stats.favoriteBuildings.length > 0 && (
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
  )
}
