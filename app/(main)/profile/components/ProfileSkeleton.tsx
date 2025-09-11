import { Skeleton } from '@/components/ui/skeleton'
import { Card } from '@/components/ui/card'

export function ProfileSkeleton() {
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
      <Card className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
          <div className="flex flex-col items-center md:items-start gap-2">
            <div className="flex items-center gap-2">
              <Skeleton className="h-8 w-40 rounded" />
              <Skeleton className="h-6 w-20 rounded" />
            </div>
            <Skeleton className="h-5 w-56 rounded" />
          </div>
          <Skeleton className="h-10 w-32 rounded flex items-center gap-2">
            {/* This represents the EditProfileButton with loading state */}
          </Skeleton>
        </div>
        
        {/* Info Grid Skeleton */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
          <div className="space-y-4">
            {/* Email with icon */}
            <div className="flex items-center gap-3">
              <Skeleton className="size-5 rounded" />
              <Skeleton className="h-5 w-48 rounded" />
            </div>
            {/* Phone with icon */}
            <div className="flex items-center gap-3">
              <Skeleton className="size-5 rounded" />
              <Skeleton className="h-5 w-32 rounded" />
            </div>
            {/* University ID with icon */}
            <div className="flex items-center gap-3">
              <Skeleton className="size-5 rounded" />
              <Skeleton className="h-5 w-36 rounded" />
            </div>
          </div>
          <div className="space-y-4">
            {/* Gender with icon and badge */}
            <div className="flex items-center gap-3">
              <Skeleton className="size-5 rounded" />
              <Skeleton className="h-6 w-16 rounded" />
            </div>
            {/* Department with icon */}
            <div className="flex items-center gap-3">
              <Skeleton className="size-5 rounded" />
              <Skeleton className="h-5 w-44 rounded" />
            </div>
            {/* Designation with icon */}
            <div className="flex items-center gap-3">
              <Skeleton className="size-5 rounded" />
              <Skeleton className="h-5 w-40 rounded" />
            </div>
          </div>
        </div>

        {/* Seating Location Section Skeleton */}
        <div className="px-8 pb-8">
          <div className="border-t pt-8">
            {/* Section heading with icon */}
            <div className="flex items-center gap-2 mb-6">
              <Skeleton className="h-5 w-5 rounded" />
              <Skeleton className="h-6 w-32 rounded" />
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div className="space-y-4">
                {/* Building */}
                <div className="flex items-center gap-3">
                  <Skeleton className="size-5 rounded" />
                  <div className="space-y-1">
                    <Skeleton className="h-3 w-16 rounded" />
                    <Skeleton className="h-5 w-28 rounded" />
                  </div>
                </div>
                {/* Floor */}
                <div className="flex items-center gap-3">
                  <Skeleton className="size-5 rounded" />
                  <div className="space-y-1">
                    <Skeleton className="h-3 w-12 rounded" />
                    <Skeleton className="h-5 w-8 rounded" />
                  </div>
                </div>
                {/* Room */}
                <div className="flex items-center gap-3">
                  <Skeleton className="size-5 rounded" />
                  <div className="space-y-1">
                    <Skeleton className="h-3 w-16 rounded" />
                    <Skeleton className="h-5 w-12 rounded" />
                  </div>
                </div>
              </div>
              <div className="space-y-4">
                {/* Location Type */}
                <div className="flex items-center gap-3">
                  <Skeleton className="size-5 rounded" />
                  <div className="space-y-1">
                    <Skeleton className="h-3 w-24 rounded" />
                    <Skeleton className="h-5 w-20 rounded" />
                  </div>
                </div>
                {/* Cabin */}
                <div className="flex items-center gap-3">
                  <Skeleton className="size-5 rounded" />
                  <div className="space-y-1">
                    <Skeleton className="h-3 w-12 rounded" />
                    <Skeleton className="h-5 w-16 rounded" />
                  </div>
                </div>
                {/* Cubicle */}
                <div className="flex items-center gap-3">
                  <Skeleton className="size-5 rounded" />
                  <div className="space-y-1">
                    <Skeleton className="h-3 w-16 rounded" />
                    <Skeleton className="h-5 w-20 rounded" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Card>
    </div>
  )
}

export function ProfileEditSkeleton() {
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
      <Card className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
          <div className="flex flex-col items-center md:items-start gap-2">
            <div className="flex items-center gap-2">
              <Skeleton className="h-8 w-32 rounded" />
              <Skeleton className="h-6 w-20 rounded" />
            </div>
            <Skeleton className="h-5 w-64 rounded" />
          </div>
        </div>
        
        {/* Form Fields Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
          {/* Left column */}
          <div className="space-y-4">
            {/* Name field with icon */}
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Skeleton className="h-4 w-4 rounded" />
                <Skeleton className="h-4 w-20 rounded" />
              </div>
              <Skeleton className="h-10 w-full rounded" />
            </div>
            {/* University ID field */}
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Skeleton className="h-4 w-4 rounded" />
                <Skeleton className="h-4 w-24 rounded" />
              </div>
              <Skeleton className="h-10 w-full rounded" />
            </div>
            {/* Phone field */}
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Skeleton className="h-4 w-4 rounded" />
                <Skeleton className="h-4 w-28 rounded" />
              </div>
              <Skeleton className="h-10 w-full rounded" />
            </div>
          </div>
          {/* Right column */}
          <div className="space-y-4">
            {/* Gender field */}
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Skeleton className="h-4 w-4 rounded" />
                <Skeleton className="h-4 w-16 rounded" />
              </div>
              <Skeleton className="h-10 w-full rounded" />
            </div>
            {/* Department field */}
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Skeleton className="h-4 w-4 rounded" />
                <Skeleton className="h-4 w-24 rounded" />
              </div>
              <Skeleton className="h-10 w-full rounded" />
            </div>
            {/* Designation field */}
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Skeleton className="h-4 w-4 rounded" />
                <Skeleton className="h-4 w-24 rounded" />
              </div>
              <Skeleton className="h-10 w-full rounded" />
            </div>
          </div>
        </div>

        {/* Seating Location Section */}
        <div className="px-8 pb-8">
          <div className="border-t pt-8">
            <div className="flex items-center gap-2 mb-6">
              <Skeleton className="h-5 w-5 rounded" />
              <Skeleton className="h-6 w-48 rounded" />
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="space-y-4">
                {/* Building Name */}
                <div className="space-y-2">
                  <Skeleton className="h-4 w-24 rounded" />
                  <Skeleton className="h-10 w-full rounded" />
                </div>
                {/* Floor Number */}
                <div className="space-y-2">
                  <Skeleton className="h-4 w-20 rounded" />
                  <Skeleton className="h-10 w-full rounded" />
                </div>
                {/* Room Number */}
                <div className="space-y-2">
                  <Skeleton className="h-4 w-20 rounded" />
                  <Skeleton className="h-10 w-full rounded" />
                </div>
              </div>
              <div className="space-y-4">
                {/* Seating Location Type */}
                <div className="space-y-2">
                  <Skeleton className="h-4 w-32 rounded" />
                  <Skeleton className="h-10 w-full rounded" />
                </div>
                {/* Cabin */}
                <div className="space-y-2">
                  <Skeleton className="h-4 w-12 rounded" />
                  <Skeleton className="h-10 w-full rounded" />
                </div>
                {/* Cubicle */}
                <div className="space-y-2">
                  <Skeleton className="h-4 w-16 rounded" />
                  <Skeleton className="h-10 w-full rounded" />
                </div>
              </div>
            </div>
          </div>
        </div>
        
        {/* Buttons */}
        <div className="flex justify-between gap-2 px-8 pb-8">
          <Skeleton className="h-12 w-[140px] rounded" />
          <Skeleton className="h-12 w-[140px] rounded" />
        </div>
      </Card>
    </div>
  )
}
