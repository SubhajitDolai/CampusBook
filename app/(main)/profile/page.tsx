"use client"

import { AppSidebar } from "../components/app-sidebar"
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
import { Card, CardTitle, CardDescription, CardContent } from "@/components/ui/card"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Skeleton } from "@/components/ui/skeleton"
import { Tooltip, TooltipTrigger, TooltipContent } from "@/components/ui/tooltip"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"
import { useEffect, useState } from "react"
import { useRouter } from "next/navigation"
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"
import { createClient } from "@/utils/supabase/client"
import { Mail, Phone, IdCard, Venus, Building2, Briefcase, Loader } from "lucide-react"
function EditProfileButton() {
  const [loading, setLoading] = useState(false)
  const router = useRouter()
  const { start } = useGlobalLoadingBar()

  const handleClick = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault()
    setLoading(true)
    start()
    router.push("/profile/edit")
  }

  return (
    <Button
      size="sm"
      className="self-center md:self-start"
      variant="default"
      onClick={handleClick}
      disabled={loading}
      asChild={false}
    >
      {loading ? (
        <>
          <Loader className="h-4 w-4 animate-spin" />
          Loading...
        </>
      ) : (
        "Edit Profile"
      )}
    </Button>
  )
}

type Profile = {
  name: string
  email: string
  university_id: string
  phone: string
  gender: string
  designation: string
  department: string
  role: string
}

export default function ProfilePage() {
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchProfile() {
      setLoading(true)
      setError(null)
      try {
        const supabase = createClient()
        const { data: { user } } = await supabase.auth.getUser()
        if (!user) {
          setError("Not authenticated.")
          setLoading(false)
          return
        }
        const { data, error } = await supabase
          .from("profiles")
          .select("name, email, university_id, phone, gender, designation, department, role")
          .eq("id", user.id)
          .single()
        if (error || !data) {
          setError("Profile not found.")
        } else {
          setProfile(data)
        }
      } catch (e) {
        console.log(e)
        setError("Failed to load profile.")
      } finally {
        setLoading(false)
      }
    }
    fetchProfile()
  }, [])

  // Skeleton matches the actual profile UI 100%
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
                    <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
                  </BreadcrumbItem>
                  <BreadcrumbSeparator className="hidden md:block" />
                  <BreadcrumbItem>
                    <BreadcrumbPage>Profile</BreadcrumbPage>
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
            {/* Main Card Skeleton (matches Card outline, border, shadow, bg) */}
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
                  <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbPage>Profile</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
          {error ? (
            <Alert variant="destructive" className="max-w-xl mt-8">
              <AlertTitle>Error</AlertTitle>
              <AlertDescription>{error}</AlertDescription>
            </Alert>
          ) : profile && (
            <>
              {/* Banner + Avatar */}
              <div className="w-full max-w-3xl relative">
                <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
                <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
                  <Avatar className="size-24 border-4 border-background shadow-lg">
                    <AvatarFallback className="text-2xl">{profile.name?.split(" ").map(n => n[0]).join("")}</AvatarFallback>
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
                          <Badge variant="secondary" className="capitalize cursor-pointer">{profile.role.replace("_", " ")}</Badge>
                        </TooltipTrigger>
                        <TooltipContent>Role</TooltipContent>
                      </Tooltip>
                    </div>
                    <CardDescription className="text-base text-muted-foreground">{profile.designation} &mdash; {profile.department}</CardDescription>
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
                      <span className="font-medium">{profile.phone || <span className="text-muted-foreground">N/A</span>}</span>
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
              </Card>
            </>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
} 