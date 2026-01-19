"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import Image from "next/image"
import { LayoutDashboard, Building2, User, Home, BookOpen, LogOut, Moon, Sun, Monitor, Smartphone, Laptop, GraduationCap, Users, CalendarDays, UsersRound } from "lucide-react"
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
import { Button } from "@/components/ui/button"
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar"
import { useState, useEffect } from "react"
import { useTheme } from "next-themes"
import { createClient } from "@/utils/supabase/client"
import { logout } from "@/app/(auth)/login/actions"
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"

// Replace ThemeToggleSidebarMenuItem with real theme logic
function ThemeToggleSidebarMenuItem() {
  const { setTheme, theme } = useTheme();
  const [mounted, setMounted] = useState(false);
  const [deviceType, setDeviceType] = useState<'mobile' | 'tablet' | 'desktop'>('desktop');

  useEffect(() => {
    setMounted(true);
    const detectDevice = () => {
      const width = window.innerWidth;
      if (width < 768) setDeviceType('mobile');
      else if (width < 1024) setDeviceType('tablet');
      else setDeviceType('desktop');
    };
    detectDevice();
    window.addEventListener('resize', detectDevice);
    return () => window.removeEventListener('resize', detectDevice);
  }, []);

  const cycleTheme = () => {
    if (!mounted) return;
    if (theme === 'light') setTheme('dark');
    else if (theme === 'dark') setTheme('system');
    else setTheme('light');
  };

  let icon = <Sun className="h-4 w-4" />;
  let label = 'Light Mode';
  if (mounted) {
    if (theme === 'light') {
      icon = <Sun className="h-4 w-4" />;
      label = 'Light Mode';
    } else if (theme === 'dark') {
      icon = <Moon className="h-4 w-4" />;
      label = 'Dark Mode';
    } else {
      if (deviceType === 'mobile') {
        icon = <Smartphone className="h-4 w-4" />;
      } else if (deviceType === 'tablet') {
        icon = <Monitor className="h-4 w-4" />;
      } else {
        icon = <Laptop className="h-4 w-4" />;
      }
      label = 'System Theme';
    }
  }

  return (
    <SidebarMenuButton asChild isActive={false}>
      <button
        type="button"
        className="flex items-center gap-2 w-full px-2 py-2 text-sm rounded hover:bg-muted transition-colors cursor-pointer"
        onClick={cycleTheme}
        aria-label={`Current theme: ${label}. Click to cycle themes.`}
      >
        {icon}
        <span>{label}</span>
      </button>
    </SidebarMenuButton>
  );
}

export function AppSidebar() {
  const pathname = usePathname()
  const [userProfile, setUserProfile] = useState<{ name: string; email: string; avatar_url: string | null } | null>(null)
  const [loading, setLoading] = useState(true)
  const { start, finish } = useGlobalLoadingBar()
  const [loggingOut, setLoggingOut] = useState(false)

  useEffect(() => {
    async function fetchUserProfile() {
      try {
        const supabase = createClient()
        const { data: { user } } = await supabase.auth.getUser()
        if (user) {
          const { data: profile } = await supabase
            .from('profiles')
            .select('name, email, avatar_url')
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
      href: "/dashboard",
      icon: LayoutDashboard,
    },
    {
      title: "My Schedule",
      href: "/my-schedule",
      icon: CalendarDays,
    },
    {
      title: "Class Schedule",
      href: "/class-schedule",
      icon: UsersRound,
    },
    {
      title: "Buildings",
      href: "/buildings",
      icon: Building2,
    },
    {
      title: "Resources",
      href: "/resources",
      icon: GraduationCap,
    },
    {
      title: "Bookings",
      href: "/bookings",
      icon: BookOpen,
    },
    {
      title: "Users",
      href: "/users",
      icon: Users,
    },
    {
      title: "Profile",
      href: "/profile",
      icon: User,
    },
    {
      title: "Home",
      href: "/",
      icon: Home,
    },
  ]

  const handleLogout = async () => {
    setLoggingOut(true)
    start()
    try {
      await logout()
    } finally {
      setLoggingOut(false)
      finish()
    }
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
                const isActive = pathname === item.href
                return (
                  <SidebarMenuItem key={item.href}>
                    <SidebarMenuButton asChild isActive={isActive}>
                      {isActive ? (
                        <span>
                          <Icon className="h-4 w-4" />
                          <span>{item.title}</span>
                        </span>
                      ) : (
                        <Link href={item.href} onClick={() => start()}>
                          <Icon className="h-4 w-4" />
                          <span>{item.title}</span>
                        </Link>
                      )}
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                )
              })}
              <SidebarGroupLabel>Appearance</SidebarGroupLabel>
              <SidebarMenuItem>
                <ThemeToggleSidebarMenuItem />
              </SidebarMenuItem>
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <SidebarGroup>
          <SidebarGroupContent>
            <div className="flex items-center gap-3 mb-3">
              <Avatar className="h-8 w-8">
                {userProfile?.avatar_url && <AvatarImage src={userProfile.avatar_url} alt={userProfile.name} />}
                <AvatarFallback>
                  {userProfile?.name?.split(" ").map(n => n[0]).join("") || <User className="h-4 w-4" />}
                </AvatarFallback>
              </Avatar>
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
              disabled={loggingOut}
            >
              <LogOut className="h-4 w-4" />
              {loggingOut ? 'Logging out...' : 'Logout'}
            </Button>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarFooter>
    </Sidebar>
  )
}
