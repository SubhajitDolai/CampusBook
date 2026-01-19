'use client'

import { useRouter } from "next/navigation"
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"
import { Card, CardContent, CardDescription, CardTitle } from "@/components/ui/card"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Mail, Phone, IdCard, Building2, Briefcase, ArrowLeft, Venus, MapPin } from "lucide-react"
import { UserProfile } from '../../actions'

interface UserProfileContentProps {
  profile: UserProfile
}

export default function UserProfileContent({ profile }: UserProfileContentProps) {
  const router = useRouter()
  const { start } = useGlobalLoadingBar()

  const handleBack = () => {
    start()
    router.push('/users')
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

  return (
    <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
      {/* Banner + Avatar */}
      <div className="w-full max-w-3xl relative">
        <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
        <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
          <Avatar className="size-24 border-4 border-background shadow-lg">
            {profile.avatar_url && <AvatarImage src={profile.avatar_url} alt={profile.name} />}
            <AvatarFallback className="text-2xl">
              {profile.name?.split(" ").map(n => n[0]).join("") || "U"}
            </AvatarFallback>
          </Avatar>
        </div>
      </div>

      {/* Main Card */}
      <Card className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
          <div className="flex flex-col items-center md:items-start gap-2">
            <div className="flex items-center gap-2">
              <CardTitle className="text-2xl font-bold">{profile.name}</CardTitle>
              {getRoleBadge(profile.role)}
            </div>
            <CardDescription className="text-base text-muted-foreground">
              {profile.designation || 'Staff'} — {profile.department}
            </CardDescription>
          </div>
          <Button onClick={handleBack} variant="outline">
            <ArrowLeft className="h-4 w-4 mr-2" />
            Back to Users
          </Button>
        </div>

        {/* Info Grid */}
        <CardContent className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
          <div className="space-y-4">
            <div className="flex items-center gap-3">
              <Mail className="text-muted-foreground size-5" />
              <span className="font-medium">{profile.email}</span>
            </div>
            <div className="flex items-center gap-3">
              <Phone className="text-muted-foreground size-5" />
              <span className="font-medium">
                {profile.phone || <span className="text-muted-foreground">Not provided</span>}
              </span>
            </div>
            <div className="flex items-center gap-3">
              <IdCard className="text-muted-foreground size-5" />
              <span className="font-medium">{profile.university_id}</span>
            </div>
          </div>
          <div className="space-y-4">
            <div className="flex items-center gap-3">
              <Venus className="text-muted-foreground size-5" />
              <Badge variant="outline" className="capitalize">
                {profile.gender || 'Not specified'}
              </Badge>
            </div>
            <div className="flex items-center gap-3">
              <Building2 className="text-muted-foreground size-5" />
              <span className="font-medium">{profile.department}</span>
            </div>
            <div className="flex items-center gap-3">
              <Briefcase className="text-muted-foreground size-5" />
              <span className="font-medium">{profile.designation || 'Staff'}</span>
            </div>
          </div>
        </CardContent>
        
        {/* Seating Location Information */}
        {(profile.building_name || profile.floor_number || profile.room_number || profile.seating_location || profile.cabin || profile.cubicle || profile.workstation) && (
          <CardContent className="px-8 pb-8">
            <div className="border-t pt-8">
              <h3 className="text-lg font-semibold mb-6 flex items-center gap-2">
                <MapPin className="h-5 w-5" />
                Seating Location
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div className="space-y-4">
                  {profile.building_name && (
                    <div className="flex items-center gap-3">
                      <Building2 className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Building</span>
                        <div className="font-medium">{profile.building_name}</div>
                      </div>
                    </div>
                  )}
                  {profile.floor_number && (
                    <div className="flex items-center gap-3">
                      <Building2 className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Floor</span>
                        <div className="font-medium">{profile.floor_number}</div>
                      </div>
                    </div>
                  )}
                  {profile.room_number && (
                    <div className="flex items-center gap-3">
                      <Building2 className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Room</span>
                        <div className="font-medium">{profile.room_number}</div>
                      </div>
                    </div>
                  )}
                </div>
                <div className="space-y-4">
                  {profile.seating_location && (
                    <div className="flex items-center gap-3">
                      <MapPin className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Location Type</span>
                        <div className="font-medium capitalize">{profile.seating_location}</div>
                      </div>
                    </div>
                  )}
                  {profile.cabin && (
                    <div className="flex items-center gap-3">
                      <MapPin className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Cabin</span>
                        <div className="font-medium">{profile.cabin}</div>
                      </div>
                    </div>
                  )}
                  {profile.cubicle && (
                    <div className="flex items-center gap-3">
                      <MapPin className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Cubicle</span>
                        <div className="font-medium">{profile.cubicle}</div>
                      </div>
                    </div>
                  )}
                  {profile.workstation && (
                    <div className="flex items-center gap-3">
                      <MapPin className="text-muted-foreground size-5" />
                      <div>
                        <span className="text-sm text-muted-foreground">Workstation</span>
                        <div className="font-medium">{profile.workstation}</div>
                      </div>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </CardContent>
        )}
      </Card>
    </div>
  )
}
