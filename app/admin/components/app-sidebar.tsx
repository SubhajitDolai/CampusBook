'use client'

import Link from "next/link"
import { usePathname } from "next/navigation"
import { Button } from "@/components/ui/button"
import { 
  Building2, 
  Users, 
  Calendar, 
  Settings, 
  Home,
  LogOut,
  User,
} from "lucide-react"
import { logout } from "@/app/(auth)/login/actions"
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "@/components/ui/sidebar"
import { useEffect, useState } from "react"
import { createClient } from "@/utils/supabase/client"
import Image from "next/image"

type UserProfile = {
  id: string
  name: string
  email: string
  university_id: string
  department: string
  role: string
}

export function AppSidebar() {
  const pathname = usePathname()
  const [userProfile, setUserProfile] = useState<UserProfile | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchUserProfile() {
      try {
        const supabase = createClient()
        
        // Get current user
        const { data: { user } } = await supabase.auth.getUser()
        
        if (user) {
          // Get user profile
          const { data: profile } = await supabase
            .from('profiles')
            .select('id, name, email, university_id, department, role')
            .eq('id', user.id)
            .single()
          
          setUserProfile(profile)
        }
      } catch (error) {
        console.error('Error fetching user profile:', error)
      } finally {
        setLoading(false)
      }
    }

    fetchUserProfile()
  }, [])

  const menuItems = [
    {
      title: "Dashboard",
      href: "/admin",
      icon: Home,
    },
    {
      title: "Buildings",
      href: "/admin/buildings",
      icon: Building2,
    },
    {
      title: "Resources",
      href: "/admin/resources",
      icon: Settings,
    },
    {
      title: "Bookings",
      href: "/admin/bookings",
      icon: Calendar,
    },
    {
      title: "Users",
      href: "/admin/users",
      icon: Users,
    },
  ]

  const handleLogout = async () => {
    await logout()
  }

  return (
    <Sidebar>
      <SidebarHeader>
        <div className="flex h-16 items-center justify-center border-b px-6">
          <Image 
            src="/logo-dark.webp" 
            alt="CampusBook" 
            width={128}
            height={128}
            className="h-8 w-auto dark:hidden"
            priority
          />
          <Image 
            src="/logo-light.webp" 
            alt="CampusBook" 
            width={128}
            height={128}
            className="h-8 w-auto hidden dark:block"
            priority
          />
        </div>
      </SidebarHeader>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupLabel>Navigation</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {menuItems.map((item) => {
                const Icon = item.icon
                return (
                  <SidebarMenuItem key={item.href}>
                    <SidebarMenuButton asChild isActive={pathname === item.href}>
                      <Link href={item.href}>
                        <Icon className="h-4 w-4" />
                        <span>{item.title}</span>
                      </Link>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                )
              })}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <SidebarGroup>
          <SidebarGroupContent>
            <div className="flex items-center gap-3 mb-3">
              <div className="flex h-8 w-8 items-center justify-center rounded-full bg-muted">
                <User className="h-4 w-4" />
              </div>
              <div className="flex-1">
                {loading ? (
                  <>
                    <p className="text-sm font-medium">Loading...</p>
                    <p className="text-xs text-muted-foreground">Please wait</p>
                  </>
                ) : userProfile ? (
                  <>
                    <p className="text-sm font-medium">{userProfile.name}</p>
                    <p className="text-xs text-muted-foreground">{userProfile.email}</p>
                  </>
                ) : (
                  <>
                    <p className="text-sm font-medium">Unknown User</p>
                    <p className="text-xs text-muted-foreground">No profile found</p>
                  </>
                )}
              </div>
            </div>
            <Button
              variant="outline"
              size="sm"
              className="w-full"
              onClick={handleLogout}
            >
              <LogOut className="h-4 w-4" />
              Logout
            </Button>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarFooter>
    </Sidebar>
  )
}
