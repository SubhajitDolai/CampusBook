import { Loader2 } from 'lucide-react'
import { AppSidebar } from "../../components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbList,
  BreadcrumbPage,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"

interface LoadingSpinnerProps {
  message?: string
  withSidebar?: boolean
  breadcrumbTitle?: string
}

export function LoadingSpinner({ 
  message = "Loading resources...", 
  withSidebar = false,
  breadcrumbTitle = "Resources"
}: LoadingSpinnerProps) {
  const LoadingContent = () => (
    <div className="flex items-center justify-center py-12">
      <Loader2 className="h-8 w-8 animate-spin" />
      <span className="ml-2">{message}</span>
    </div>
  )

  if (withSidebar) {
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
                  <BreadcrumbItem>
                    <BreadcrumbPage>{breadcrumbTitle}</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
            <LoadingContent />
          </div>
        </SidebarInset>
      </SidebarProvider>
    )
  }

  return <LoadingContent />
} 