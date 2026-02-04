import { Card, CardTitle, CardDescription, CardContent } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Mail, Phone, IdCard, Building2, Briefcase, MapPin, Navigation } from "lucide-react"
import { getPublicProfile } from '../../actions'
import Link from 'next/link'
import { DownloadCardButton } from './DownloadCardButton'
import { AvatarDialog } from './AvatarDialog'

interface PublicProfilePageProps {
  params: Promise<{
    nameSlug: string
    id: string
  }>
}

export async function generateMetadata({ params }: PublicProfilePageProps) {
  const { id } = await params
  const profile = await getPublicProfile(id)

  return {
    title: profile ? `${profile.name} - Profile` : 'Profile Not Found',
    description: profile
      ? `${profile.name} - ${profile.designation} at ${profile.department}`
      : 'Profile not found',
  }
}

export default async function PublicProfilePage({ params }: PublicProfilePageProps) {
  const { nameSlug, id } = await params
  const profile = await getPublicProfile(id)

  if (!profile) {
    return (
      <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center justify-center min-h-screen bg-background">
        <Card className="w-full max-w-md p-8 text-center">
          <CardTitle className="text-2xl font-bold mb-4">Profile Not Found</CardTitle>
          <CardDescription className="text-base mb-6">
            The profile does not exist or is not publicly available.
          </CardDescription>
          <Link
            href="/"
            className="inline-block px-6 py-2 bg-primary text-primary-foreground rounded-lg hover:bg-primary/90 transition-colors"
          >
            Back to Home
          </Link>
        </Card>
      </div>
    )
  }

  // Generate the share link for QR code
  const shareLink = `${process.env.NEXT_PUBLIC_SITE_URL || 'https://campusbook.mitwpu.edu.in'}/public-profile/${nameSlug}/${id}`

  return (
    <div className="flex flex-1 flex-col gap-4 items-center min-h-screen bg-gradient-to-br from-background via-background to-muted/10">
      {/* Banner + Avatar */}
      <div className="w-full max-w-3xl relative">
        <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
        <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
          <AvatarDialog avatarUrl={profile.avatar_url} name={profile.name} />
        </div>
      </div>

      {/* Main Card */}
      <Card className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80">
        <div className="flex flex-col items-center gap-4 px-8 pt-8 pb-6">
          <div className="flex flex-col items-center gap-2">
            <CardTitle className="text-2xl font-bold text-center">{profile.name}</CardTitle>
            <CardDescription className="text-base text-muted-foreground text-center">
              {profile.designation}
            </CardDescription>
          </div>
          
          {/* Action Buttons */}
          <div className="grid grid-cols-3 gap-3 w-full mt-4">
            <a href={`tel:${profile.phone}`} className="w-full">
              <Button variant="outline" className="w-full flex flex-col gap-2 h-auto py-4">
                <Phone className="size-5" />
                <span className="text-xs">CALL</span>
              </Button>
            </a>
            <a href={`mailto:${profile.email}`} className="w-full">
              <Button variant="outline" className="w-full flex flex-col gap-2 h-auto py-4">
                <Mail className="size-5" />
                <span className="text-xs">EMAIL</span>
              </Button>
            </a>
            <a href="https://maps.app.goo.gl/Cx8CMjoW1ty5WKbE8" target="_blank" rel="noopener noreferrer" className="w-full">
              <Button variant="outline" className="w-full flex flex-col gap-2 h-auto py-4">
                <Navigation className="size-5" />
                <span className="text-xs">DIRECTIONS</span>
              </Button>
            </a>
          </div>
        </div>

        {/* Info Grid */}
        <CardContent className="grid grid-cols-1 gap-6 px-8 pb-8">
          {/* Phone and Email - Side by Side */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="flex items-start gap-3 p-4 rounded-lg bg-muted/50">
              <Phone className="text-muted-foreground size-5 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <p className="text-sm text-muted-foreground">Mobile</p>
                <p className="font-medium">{profile.phone || 'N/A'}</p>
              </div>
            </div>
            
            <div className="flex items-start gap-3 p-4 rounded-lg bg-muted/50">
              <Mail className="text-muted-foreground size-5 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <p className="text-sm text-muted-foreground">Email</p>
                <p className="font-medium break-all">{profile.email}</p>
              </div>
            </div>
          </div>

          {/* Department and Designation - Side by Side */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="flex items-start gap-3 p-4 rounded-lg bg-muted/50">
              <Building2 className="text-muted-foreground size-5 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <p className="text-sm text-muted-foreground">Department</p>
                <p className="font-medium">{profile.department}</p>
              </div>
            </div>

            <div className="flex items-start gap-3 p-4 rounded-lg bg-muted/50">
              <Briefcase className="text-muted-foreground size-5 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <p className="text-sm text-muted-foreground">Designation</p>
                <p className="font-medium">{profile.designation}</p>
              </div>
            </div>
          </div>

          {/* Campus Location - Full Width */}
          <div className="flex items-start gap-3 p-4 rounded-lg bg-muted/50">
            <MapPin className="text-muted-foreground size-5 mt-0.5 flex-shrink-0" />
            <div className="flex-1">
              <p className="text-sm text-muted-foreground">Campus Location</p>
              <a 
                href="https://maps.app.goo.gl/Cx8CMjoW1ty5WKbE8" 
                target="_blank" 
                rel="noopener noreferrer"
                className="font-medium text-primary hover:underline"
              >
                MIT-WPU, Pune
              </a>
            </div>
          </div>

          {/* Office Location Information */}
          {(() => {
            const hasSeatingInfo = !!(
              (profile.building_name && profile.building_name.trim()) ||
              (profile.floor_number && profile.floor_number > 0) ||
              (profile.room_number && profile.room_number > 0) ||
              (profile.cabin && profile.cabin.trim()) ||
              (profile.cubicle && profile.cubicle.trim()) ||
              (profile.workstation && profile.workstation.trim())
            );
            
            if (!hasSeatingInfo) return null;
            
            // Build building/floor line
            const buildingFloorParts = [];
            if (profile.building_name && profile.building_name.trim()) {
              buildingFloorParts.push(profile.building_name);
            }
            if (profile.floor_number && profile.floor_number > 0) {
              buildingFloorParts.push(`Floor ${profile.floor_number}`);
            }
            const buildingFloor = buildingFloorParts.join(', ');
            
            // Build room/cabin line - show all that exist
            const roomLocationParts = [];
            if (profile.room_number && profile.room_number > 0) {
              roomLocationParts.push(`Room ${profile.room_number}`);
            }
            if (profile.cabin && profile.cabin.trim()) {
              roomLocationParts.push(profile.cabin);
            }
            if (profile.cubicle && profile.cubicle.trim()) {
              roomLocationParts.push(profile.cubicle);
            }
            if (profile.workstation && profile.workstation.trim()) {
              roomLocationParts.push(profile.workstation);
            }
            const roomLocation = roomLocationParts.join(', ');
            
            if (!buildingFloor && !roomLocation) return null;
            
            return (
              <div className="flex items-start gap-3 p-4 rounded-lg bg-muted/50">
                <Building2 className="text-muted-foreground size-5 mt-0.5 flex-shrink-0" />
                <div className="flex-1">
                  <p className="text-sm text-muted-foreground mb-1">Office Location</p>
                  {buildingFloor && (
                    <p className="font-medium">{buildingFloor}</p>
                  )}
                  {roomLocation && (
                    <p className="font-medium text-muted-foreground">{roomLocation}</p>
                  )}
                </div>
              </div>
            );
          })()}
        </CardContent>
      </Card>

      {/* Footer with Download Button */}
      <div className="w-full max-w-3xl mt-8 pb-8">
        <div className="flex flex-col items-center gap-4">
          <DownloadCardButton profileName={profile.name} shareLink={shareLink} />
          <p className="text-center text-sm text-muted-foreground">
            This is a digital visiting card shared by {profile.name}
          </p>
        </div>
      </div>
    </div>
  )
}
