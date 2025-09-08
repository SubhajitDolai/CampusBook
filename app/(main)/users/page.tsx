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
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Users, GraduationCap, Settings, Building2, Loader2 } from 'lucide-react'
import React from 'react'
import { searchUsers, getDepartments, getBuildings, getUserStats, UserProfile } from './actions'
import { UserSearchFilters } from './components/UserSearchFilters'
import { UserCard } from './components/UserCard'

export default function UsersPage() {
  const [searchTerm, setSearchTerm] = React.useState('')
  const [selectedDepartment, setSelectedDepartment] = React.useState('All')
  const [selectedRole, setSelectedRole] = React.useState('All')
  const [selectedBuilding, setSelectedBuilding] = React.useState('All')
  const [users, setUsers] = React.useState<UserProfile[]>([])
  const [departments, setDepartments] = React.useState<string[]>(['All'])
  const [buildings, setBuildings] = React.useState<string[]>(['All'])
  const [stats, setStats] = React.useState({ total: 0, faculty: 0, admin: 0, superAdmin: 0 })
  const [loading, setLoading] = React.useState(true)
  const [searching, setSearching] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  // Debounced search
  const [debouncedSearchTerm, setDebouncedSearchTerm] = React.useState('')

  React.useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedSearchTerm(searchTerm)
    }, 300)

    return () => clearTimeout(timer)
  }, [searchTerm])

  // Fetch initial data
  React.useEffect(() => {
    async function fetchInitialData() {
      try {
        setError(null)
        const [usersData, departmentsData, buildingsData, statsData] = await Promise.all([
          searchUsers(),
          getDepartments(),
          getBuildings(),
          getUserStats()
        ])
        
        setUsers(usersData)
        setDepartments(departmentsData)
        setBuildings(buildingsData)
        setStats(statsData)
      } catch (error) {
        console.error('Error fetching initial data:', error)
        setError(error instanceof Error ? error.message : 'Failed to load data')
      } finally {
        setLoading(false)
      }
    }

    fetchInitialData()
  }, [])

  // Search users when filters change
  React.useEffect(() => {
    async function performSearch() {
      if (!loading) { // Don't search during initial load
        try {
          setSearching(true)
          setError(null)
          const usersData = await searchUsers(
            debouncedSearchTerm,
            selectedDepartment,
            selectedRole,
            selectedBuilding
          )
          setUsers(usersData)
        } catch (error) {
          console.error('Error searching users:', error)
          setError(error instanceof Error ? error.message : 'Failed to search users')
        } finally {
          setSearching(false)
        }
      }
    }

    performSearch()
  }, [debouncedSearchTerm, selectedDepartment, selectedRole, selectedBuilding, loading])

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
                    <BreadcrumbPage>Users</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex items-center justify-center h-[calc(100vh-4rem)]">
            <div className="flex items-center gap-2">
              <Loader2 className="h-8 w-8 animate-spin" />
              <span>Loading users...</span>
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
                  <BreadcrumbPage>Users</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <h1 className="text-3xl font-bold mb-2">University Directory</h1>
            <p className="text-muted-foreground">Search and connect with faculty and staff across campus</p>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-4 mb-6">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Users</CardTitle>
                <Users className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{stats.total}</div>
                <p className="text-xs text-muted-foreground">All registered users</p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Faculty</CardTitle>
                <GraduationCap className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{stats.faculty}</div>
                <p className="text-xs text-muted-foreground">Teaching staff</p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Admins</CardTitle>
                <Settings className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{stats.admin}</div>
                <p className="text-xs text-muted-foreground">System administrators</p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Super Admins</CardTitle>
                <Building2 className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{stats.superAdmin}</div>
                <p className="text-xs text-muted-foreground">System owners</p>
              </CardContent>
            </Card>
          </div>

          {/* Search Filters */}
          <UserSearchFilters
            searchTerm={searchTerm}
            setSearchTerm={setSearchTerm}
            selectedDepartment={selectedDepartment}
            setSelectedDepartment={setSelectedDepartment}
            selectedRole={selectedRole}
            setSelectedRole={setSelectedRole}
            selectedBuilding={selectedBuilding}
            setSelectedBuilding={setSelectedBuilding}
            departments={departments}
            buildings={buildings}
          />

          {/* Results Summary */}
          <div className="flex items-center justify-between mb-4">
            <p className="text-sm text-muted-foreground">
              {searching ? (
                <span className="flex items-center gap-2">
                  <Loader2 className="h-4 w-4 animate-spin" />
                  Searching...
                </span>
              ) : (
                `Showing ${users.length} user${users.length !== 1 ? 's' : ''}`
              )}
            </p>
          </div>

          {/* Error State */}
          {error && (
            <div className="text-center py-12">
              <p className="text-red-500 mb-4">Error: {error}</p>
              <button 
                onClick={() => window.location.reload()} 
                className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
              >
                Try Again
              </button>
            </div>
          )}

          {/* Users Grid */}
          {!error && (
            <>
              {users.length === 0 && !searching ? (
                <div className="text-center py-12">
                  <div className="flex h-16 w-16 items-center justify-center rounded-full bg-muted mb-4 mx-auto">
                    <Users className="h-8 w-8 text-muted-foreground" />
                  </div>
                  <h3 className="text-lg font-semibold mb-2">No users found</h3>
                  <p className="text-sm text-muted-foreground text-center mb-4 max-w-sm mx-auto">
                    {searchTerm || selectedDepartment !== 'All' || selectedRole !== 'All' || selectedBuilding !== 'All' ? 
                      'No users match your current search criteria. Try adjusting your filters.' :
                      'No users are currently registered in the system.'
                    }
                  </p>
                </div>
              ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {users.map((user) => (
                    <UserCard key={user.id} user={user} />
                  ))}
                </div>
              )}
            </>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
