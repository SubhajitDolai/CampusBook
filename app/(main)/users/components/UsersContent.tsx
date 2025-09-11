'use client'

import { useState, useMemo, useTransition } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Users, GraduationCap, Shield, Crown, Loader2 } from 'lucide-react'
import { UserCard } from './UserCard'
import { UserSearchFilters } from './UserSearchFilters'
import { searchUsers, type UsersPageData, type UserProfile } from '../actions'
import { useDebounce } from '../../../../hooks/use-debounce'
import { useEffect } from 'react'

interface UsersContentProps {
  initialData: UsersPageData
}

export default function UsersContent({ initialData }: UsersContentProps) {
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedDepartment, setSelectedDepartment] = useState('All')
  const [selectedRole, setSelectedRole] = useState('All')
  const [selectedBuilding, setSelectedBuilding] = useState('All')
  const [filteredUsers, setFilteredUsers] = useState<UserProfile[]>(initialData.users)
  const [isPending, startTransition] = useTransition()

  const debouncedSearchTerm = useDebounce(searchTerm, 300)

  // Update filtered users when filters change
  useEffect(() => {
    startTransition(async () => {
      try {
        const results = await searchUsers(
          debouncedSearchTerm,
          selectedDepartment,
          selectedRole,
          selectedBuilding
        )
        setFilteredUsers(results)
      } catch (error) {
        console.error('Error searching users:', error)
        setFilteredUsers([])
      }
    })
  }, [debouncedSearchTerm, selectedDepartment, selectedRole, selectedBuilding])

  const statsCards = useMemo(() => [
    {
      title: 'Total Users',
      value: initialData.stats.total,
      icon: Users,
      color: 'text-blue-600',
      bgColor: 'bg-blue-100 dark:bg-blue-900/20'
    },
    {
      title: 'Faculty',
      value: initialData.stats.faculty,
      icon: GraduationCap,
      color: 'text-green-600',
      bgColor: 'bg-green-100 dark:bg-green-900/20'
    },
    {
      title: 'Admin',
      value: initialData.stats.admin,
      icon: Shield,
      color: 'text-orange-600',
      bgColor: 'bg-orange-100 dark:bg-orange-900/20'
    },
    {
      title: 'Super Admin',
      value: initialData.stats.superAdmin,
      icon: Crown,
      color: 'text-red-600',
      bgColor: 'bg-red-100 dark:bg-red-900/20'
    }
  ], [initialData.stats])

  const resultCount = filteredUsers.length
  const hasActiveFilters = searchTerm || selectedDepartment !== 'All' || 
                          selectedRole !== 'All' || selectedBuilding !== 'All'

  return (
    <div className="space-y-6">
      {/* Stats Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {statsCards.map((stat) => {
          const Icon = stat.icon
          return (
            <Card key={stat.title}>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium text-muted-foreground">
                  {stat.title}
                </CardTitle>
                <div className={`h-8 w-8 rounded-lg ${stat.bgColor} flex items-center justify-center`}>
                  <Icon className={`h-4 w-4 ${stat.color}`} />
                </div>
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{stat.value}</div>
              </CardContent>
            </Card>
          )
        })}
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
        departments={initialData.departments}
        buildings={initialData.buildings}
      />

      {/* Results Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <h2 className="text-xl font-semibold">
            {hasActiveFilters ? 'Search Results' : 'All Users'}
          </h2>
          <Badge variant="secondary">
            {isPending ? (
              <div className="flex items-center gap-1">
                <Loader2 className="h-3 w-3 animate-spin" />
                Searching...
              </div>
            ) : (
              `${resultCount} ${resultCount === 1 ? 'user' : 'users'}`
            )}
          </Badge>
        </div>
      </div>

      {/* Users Grid */}
      {isPending ? (
        <div className="flex items-center justify-center min-h-[200px]">
          <div className="flex items-center gap-2 text-muted-foreground">
            <Loader2 className="h-4 w-4 animate-spin" />
            Searching users...
          </div>
        </div>
      ) : filteredUsers.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
          {filteredUsers.map((user) => (
            <UserCard key={user.id} user={user} />
          ))}
        </div>
      ) : (
        <Card className="p-8">
          <CardContent className="text-center">
            <Users className="h-12 w-12 mx-auto text-muted-foreground mb-4" />
            <CardTitle className="mb-2">No users found</CardTitle>
            <CardDescription>
              {hasActiveFilters 
                ? 'Try adjusting your search criteria or filters'
                : 'No users are currently registered in the system'
              }
            </CardDescription>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
