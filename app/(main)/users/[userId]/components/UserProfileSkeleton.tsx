import { Skeleton } from "@/components/ui/skeleton"

export default function UserProfileSkeleton() {
  return (
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
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
          <div className="flex flex-col items-center md:items-start gap-2 w-full">
            <div className="flex items-center gap-2">
              <Skeleton className="h-8 w-40" />
              <Skeleton className="h-6 w-20" />
            </div>
            <Skeleton className="h-5 w-56" />
          </div>
          <Skeleton className="h-10 w-28 self-center md:self-start" />
        </div>

        {/* Info Grid Skeleton */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
          <div className="space-y-4">
            <div className="flex items-center gap-3">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-5 w-48" />
            </div>
            <div className="flex items-center gap-3">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-5 w-32" />
            </div>
            <div className="flex items-center gap-3">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-5 w-24" />
            </div>
          </div>
          <div className="space-y-4">
            <div className="flex items-center gap-3">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-6 w-20" />
            </div>
            <div className="flex items-center gap-3">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-5 w-40" />
            </div>
            <div className="flex items-center gap-3">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-5 w-36" />
            </div>
          </div>
        </div>

        {/* Seating Location Skeleton */}
        <div className="px-8 pb-8">
          <div className="border-t pt-8">
            <div className="flex items-center gap-2 mb-6">
              <Skeleton className="h-5 w-5" />
              <Skeleton className="h-6 w-32" />
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div className="space-y-4">
                {Array.from({ length: 3 }).map((_, i) => (
                  <div key={i} className="flex items-center gap-3">
                    <Skeleton className="h-5 w-5" />
                    <div className="space-y-1">
                      <Skeleton className="h-3 w-16" />
                      <Skeleton className="h-4 w-24" />
                    </div>
                  </div>
                ))}
              </div>
              <div className="space-y-4">
                {Array.from({ length: 3 }).map((_, i) => (
                  <div key={i} className="flex items-center gap-3">
                    <Skeleton className="h-5 w-5" />
                    <div className="space-y-1">
                      <Skeleton className="h-3 w-20" />
                      <Skeleton className="h-4 w-28" />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
