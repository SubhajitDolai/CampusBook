'use client'

import { AppSidebar } from "../../components/app-sidebar"
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
import { Card, CardContent, CardDescription, CardTitle } from "@/components/ui/card"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Skeleton } from "@/components/ui/skeleton"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"
import { useEffect, useState } from "react"
import { useRouter } from "next/navigation"
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"
import { Mail, Phone, IdCard, Building2, Briefcase, ArrowLeft, Venus, MapPin } from "lucide-react"
import { getUserById, UserProfile } from '../actions'

interface UserProfilePageProps {
  params: Promise<{
    userId: string
  }>
}

export default function UserProfilePage({ params }: UserProfilePageProps) {
  const [profile, setProfile] = useState<UserProfile | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [userId, setUserId] = useState<string>('')
  const router = useRouter()
  const { start } = useGlobalLoadingBar()

  useEffect(() => {
    async function getParams() {
      const resolvedParams = await params
      setUserId(resolvedParams.userId)
    }
    getParams()
  }, [params])

  useEffect(() => {
    if (!userId) return
    
    async function fetchProfile() {
      setLoading(true)
      setError(null)
      try {
        const userData = await getUserById(userId)
        if (!userData) {
          setError("User not found.")
        } else {
          setProfile(userData)
        }
      } catch (e) {
        console.error('Error fetching user profile:', e)
        setError("Failed to load user profile.")
      } finally {
        setLoading(false)
      }
    }
    fetchProfile()
  }, [userId])

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

  // Skeleton matches the actual profile UI
  if (loading) {
    return (
      <SidebarProvider>
        <AppSidebar />
        <SidebarInset>
          <header className="flex h-16 shrink-0 items-center gap-2">
            <div className="flex items-center gap-2 px-4">
              <SidebarTrigger className="-ml-1" />
              <Separator orientation="vertical" className="mr-2 data-[orientation=vertical]:h-4" />
              <Breadcrumb>
                <BreadcrumbList>
                  <BreadcrumbItem className="hidden md:block">
                    <BreadcrumbLink href="/users">Users</BreadcrumbLink>
                  </BreadcrumbItem>
                  <BreadcrumbSeparator className="hidden md:block" />
                  <BreadcrumbItem>
                    <BreadcrumbPage>User Profile</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
            {/* Banner + Avatar Skeleton */}
            <div className="w-full max-w-3xl relative">
              <Skeleton className="h-36 w-full rounded-b-2xl" />
              <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
                <Skeleton className="size-24 rounded-full border-4 border-background shadow-lg" />
              </div>
            </div>
            {/* Main Card Skeleton */}
            <div className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80 rounded-xl">
              <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-16">
                <div className="flex flex-col items-center md:items-start gap-2 w-full">
                  <div className="flex items-center gap-2">
                    <Skeleton className="h-8 w-40 rounded" />
                    <Skeleton className="h-6 w-20 rounded" />
                  </div>
                  <Skeleton className="h-5 w-56 rounded" />
                </div>
                <Skeleton className="h-8 w-28 rounded self-center md:self-start" />
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
                <div className="space-y-4">
                  <Skeleton className="h-5 w-48 rounded" />
                  <Skeleton className="h-5 w-40 rounded" />
                  <Skeleton className="h-5 w-44 rounded" />
                </div>
                <div className="space-y-4">
                  <Skeleton className="h-5 w-32 rounded" />
                  <Skeleton className="h-5 w-40 rounded" />
                  <Skeleton className="h-5 w-40 rounded" />
                </div>
              </div>
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
            <Separator orientation="vertical" className="mr-2 data-[orientation=vertical]:h-4" />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem className="hidden md:block">
                  <BreadcrumbLink href="/users">Users</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbPage>{profile?.name || 'User Profile'}</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
          {error ? (
            <div className="max-w-xl mt-8 space-y-4">
              <Alert variant="destructive">
                <AlertTitle>Error</AlertTitle>
                <AlertDescription>{error}</AlertDescription>
              </Alert>
              <Button onClick={handleBack} variant="outline" className="w-full">
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Users
              </Button>
            </div>
          ) : profile && (
            <>
              {/* Banner + Avatar */}
              <div className="w-full max-w-3xl relative">
                <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
                <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
                  <Avatar className="size-24 border-4 border-background shadow-lg">
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
            </>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
