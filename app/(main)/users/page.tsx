import { Suspense } from 'react'
import { getAllUsersData } from './actions'
import UsersContent from './components/UsersContent'
import UsersSkeleton from './components/UsersSkeleton'
import UsersErrorBoundary from './components/UsersErrorBoundary'
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

export default function UsersPage() {
  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2">
          <div className="flex items-center gap-2 px-4">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem className="hidden md:block">
                  <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbPage>Users</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>

        <div className="flex flex-1 flex-col gap-4 p-4">
          <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white">
                University Directory
              </h1>
              <p className="text-gray-600 dark:text-gray-400 mt-1">
                Search and explore our faculty and staff
              </p>
            </div>
          </div>

          <UsersErrorBoundary>
            <Suspense fallback={<UsersSkeleton />}>
              <UsersContentWrapper />
            </Suspense>
          </UsersErrorBoundary>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}

async function UsersContentWrapper() {
  const data = await getAllUsersData()
  return <UsersContent initialData={data} />
}
