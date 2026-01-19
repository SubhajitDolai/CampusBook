import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Card, CardTitle, CardDescription, CardContent } from "@/components/ui/card"
import { Tooltip, TooltipTrigger, TooltipContent } from "@/components/ui/tooltip"
import { Mail, Phone, IdCard, Venus, Building2, Briefcase } from "lucide-react"
import { EditProfileButton } from './EditProfileButton'
import { getProfile } from '../actions'

export async function ProfileContent() {
  const profile = await getProfile()

  return (
    <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
      {/* Banner + Avatar */}
      <div className="w-full max-w-3xl relative">
        <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
        <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
          <Avatar className="size-24 border-4 border-background shadow-lg">
            {profile.avatar_url && <AvatarImage src={profile.avatar_url} alt={profile.name} />}
            <AvatarFallback className="text-2xl">
              {profile.name?.split(" ").map(n => n[0]).join("")}
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
              <Tooltip>
                <TooltipTrigger asChild>
                  <Badge variant="secondary" className="capitalize cursor-pointer">
                    {profile.role.replace("_", " ")}
                  </Badge>
                </TooltipTrigger>
                <TooltipContent>Role</TooltipContent>
              </Tooltip>
            </div>
            <CardDescription className="text-base text-muted-foreground">
              {profile.designation} &mdash; {profile.department}
            </CardDescription>
          </div>
          <EditProfileButton />
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
                {profile.phone || <span className="text-muted-foreground">N/A</span>}
              </span>
            </div>
            <div className="flex items-center gap-3">
              <IdCard className="text-muted-foreground size-5" />
              <Tooltip>
                <TooltipTrigger asChild>
                  <span className="font-medium cursor-pointer">{profile.university_id}</span>
                </TooltipTrigger>
                <TooltipContent>University ID</TooltipContent>
              </Tooltip>
            </div>
          </div>
          <div className="space-y-4">
            <div className="flex items-center gap-3">
              <Venus className="text-muted-foreground size-5" />
              <Badge variant="outline" className="capitalize">{profile.gender}</Badge>
            </div>
            <div className="flex items-center gap-3">
              <Building2 className="text-muted-foreground size-5" />
              <span className="font-medium">{profile.department}</span>
            </div>
            <div className="flex items-center gap-3">
              <Briefcase className="text-muted-foreground size-5" />
              <span className="font-medium">{profile.designation}</span>
            </div>
          </div>
        </CardContent>
        
        {/* Seating Location Information */}
        {(() => {
          const hasSeatingInfo = !!(
            (profile.building_name && profile.building_name.trim()) ||
            (profile.floor_number && profile.floor_number > 0) ||
            (profile.room_number && profile.room_number > 0) ||
            (profile.seating_location && profile.seating_location.trim()) ||
            (profile.cabin && profile.cabin.trim()) ||
            (profile.cubicle && profile.cubicle.trim()) ||
            (profile.workstation && profile.workstation.trim())
          );
          
          if (!hasSeatingInfo) return null;
          
          return (
            <CardContent className="px-8 pb-8">
              <div className="border-t pt-8">
                <h3 className="text-lg font-semibold mb-6 flex items-center gap-2">
                  <Building2 className="h-5 w-5" />
                  Seating Location
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                  <div className="space-y-4">
                    {profile.building_name && profile.building_name.trim() && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
                        <div>
                          <span className="text-sm text-muted-foreground">Building</span>
                          <div className="font-medium">{profile.building_name}</div>
                        </div>
                      </div>
                    )}
                    {profile.floor_number && profile.floor_number > 0 && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
                        <div>
                          <span className="text-sm text-muted-foreground">Floor</span>
                          <div className="font-medium">Floor {profile.floor_number}</div>
                        </div>
                      </div>
                    )}
                    {profile.room_number && profile.room_number > 0 && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
                        <div>
                          <span className="text-sm text-muted-foreground">Room</span>
                          <div className="font-medium">Room {profile.room_number}</div>
                        </div>
                      </div>
                    )}
                  </div>
                  <div className="space-y-4">
                    {profile.seating_location && profile.seating_location.trim() && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
                        <div>
                          <span className="text-sm text-muted-foreground">Location Type</span>
                          <div className="font-medium capitalize">{profile.seating_location}</div>
                        </div>
                      </div>
                    )}
                    {profile.cabin && profile.cabin.trim() && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
                        <div>
                          <span className="text-sm text-muted-foreground">Cabin</span>
                          <div className="font-medium">{profile.cabin}</div>
                        </div>
                      </div>
                    )}
                    {profile.cubicle && profile.cubicle.trim() && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
                        <div>
                          <span className="text-sm text-muted-foreground">Cubicle</span>
                          <div className="font-medium">{profile.cubicle}</div>
                        </div>
                      </div>
                    )}
                    {profile.workstation && profile.workstation.trim() && (
                      <div className="flex items-center gap-3">
                        <Building2 className="text-muted-foreground size-5" />
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
          );
        })()}
      </Card>
    </div>
  )
}
