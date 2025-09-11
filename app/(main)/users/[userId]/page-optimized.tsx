import { Suspense } from 'react'
import { notFound } from 'next/navigation'
import { getUserById } from '../actions'
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
import UserProfileContent from './components/UserProfileContent'
import UserProfileSkeleton from './components/UserProfileSkeleton'
import UserProfileErrorBoundary from './components/UserProfileErrorBoundary'

interface UserProfilePageProps {
  params: Promise<{
    userId: string
  }>
}

export default function UserProfilePage({ params }: UserProfilePageProps) {
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

        <UserProfileErrorBoundary>
          <Suspense fallback={<UserProfileSkeleton />}>
            <UserProfileWrapper params={params} />
          </Suspense>
        </UserProfileErrorBoundary>
      </SidebarInset>
    </SidebarProvider>
  )
}

async function UserProfileWrapper({ params }: { params: Promise<{ userId: string }> }) {
  const { userId } = await params
  const profile = await getUserById(userId)
  
  if (!profile) {
    notFound()
  }
  
  return <UserProfileContent profile={profile} />
}
