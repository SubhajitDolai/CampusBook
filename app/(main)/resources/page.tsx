import { Suspense } from 'react'
import { getInitialResourcesData } from './actions'
import ResourcesContent from './components/ResourcesContent'
import ResourcesSkeleton from './components/ResourcesSkeleton'
import ResourcesErrorBoundary from './components/ResourcesErrorBoundary'
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

export default function ResourcesPage() {
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
                  <BreadcrumbPage>Resources</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>

        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          <div className="mb-8">
            <h1 className="text-3xl font-bold mb-2">All Resources</h1>
            <p className="text-muted-foreground">Search and book resources across all campus buildings</p>
          </div>

          <ResourcesErrorBoundary>
            <Suspense fallback={<ResourcesSkeleton />}>
              <ResourcesContentWrapper />
            </Suspense>
          </ResourcesErrorBoundary>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}

async function ResourcesContentWrapper() {
  const data = await getInitialResourcesData()
  return <ResourcesContent initialData={data} />
}