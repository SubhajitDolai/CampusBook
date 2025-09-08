'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Avatar, AvatarFallback } from '@/components/ui/avatar'
import { Mail, Phone, IdCard, Building2, MapPin, User, GraduationCap, Settings } from 'lucide-react'
import { UserProfile } from '../actions'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { useRouter } from 'next/navigation'

interface UserCardProps {
  user: UserProfile
}

export function UserCard({ user }: UserCardProps) {
  const { start } = useGlobalLoadingBar()
  const router = useRouter()

  const handleViewProfile = () => {
    start()
    router.push(`/users/${user.id}`)
  }

  const getRoleBadge = (role: string) => {
    switch (role) {
      case 'super_admin':
        return <Badge variant="destructive">Super Admin</Badge>
      case 'admin':
        return <Badge variant="default">Admin</Badge>
      case 'faculty':
        return <Badge variant="secondary">Faculty</Badge>
      default:
        return <Badge variant="outline">{role}</Badge>
    }
  }

  const getDepartmentIcon = (department: string) => {
    switch (department.toLowerCase()) {
      case 'computer science':
      case 'cs':
        return <Settings className="h-4 w-4" />
      case 'mechanical':
      case 'me':
        return <Building2 className="h-4 w-4" />
      case 'electrical':
      case 'ee':
        return <Settings className="h-4 w-4" />
      default:
        return <GraduationCap className="h-4 w-4" />
    }
  }

  const getLocationInfo = () => {
    const parts = []
    if (user.building_name) parts.push(`Building: ${user.building_name}`)
    if (user.floor_number && user.room_number) parts.push(`F${user.floor_number}-${user.room_number}`)
    if (user.cabin) parts.push(`Cabin: ${user.cabin}`)
    if (user.cubicle) parts.push(`Cubicle: ${user.cubicle}`)
    if (user.workstation) parts.push(`Workstation: ${user.workstation}`)
    return parts.join(' • ') || 'Location not specified'
  }

  return (
    <Card className="hover:shadow-lg transition-shadow">
      <CardHeader>
        <div className="flex items-start gap-4">
          <Avatar className="h-12 w-12">
            <AvatarFallback className="text-lg">
              {user.name?.split(' ').map(n => n[0]).join('') || 'U'}
            </AvatarFallback>
          </Avatar>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <CardTitle className="text-lg truncate">{user.name}</CardTitle>
              {getRoleBadge(user.role)}
            </div>
            <CardDescription className="flex items-center gap-1">
              {getDepartmentIcon(user.department)}
              <span className="truncate">{user.designation || 'Staff'} • {user.department}</span>
            </CardDescription>
          </div>
        </div>
      </CardHeader>
      <CardContent className="space-y-3">
        <div className="space-y-2">
          <div className="flex items-center gap-2 text-sm">
            <Mail className="h-4 w-4 text-muted-foreground" />
            <span className="truncate">{user.email}</span>
          </div>
          <div className="flex items-center gap-2 text-sm">
            <IdCard className="h-4 w-4 text-muted-foreground" />
            <span>{user.university_id}</span>
          </div>
          {user.phone && (
            <div className="flex items-center gap-2 text-sm">
              <Phone className="h-4 w-4 text-muted-foreground" />
              <span>{user.phone}</span>
            </div>
          )}
        </div>
        
        <div className="pt-2 border-t">
          <div className="flex items-start gap-2 text-sm text-muted-foreground">
            <MapPin className="h-4 w-4 mt-0.5 flex-shrink-0" />
            <span className="text-xs leading-relaxed">{getLocationInfo()}</span>
          </div>
        </div>

        <Button 
          className="w-full mt-4"
          variant="outline"
          onClick={handleViewProfile}
        >
          <User className="h-4 w-4 mr-2" />
          View Profile
        </Button>
      </CardContent>
    </Card>
  )
}
