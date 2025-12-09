'use client'

import { useState, useCallback } from "react"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Loader } from "lucide-react"
import { completeOnboarding } from '../actions'
import { toast } from 'sonner'
import { useRouter } from 'next/navigation'
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"

interface ProfileData {
  name?: string | null
  university_id?: string | null
  phone?: string | null
  gender?: string | null
  department?: string | null
  designation?: string | null
  building_name?: string | null
  floor_number?: number | null
  room_number?: number | null
  seating_location?: string | null
  cabin?: string | null
  cubicle?: string | null
  workstation?: string | null
}

interface OnboardingFormProps extends React.ComponentPropsWithoutRef<"form"> {
  initialData?: ProfileData | null
}

export function OnboardingForm({ className, initialData, ...props }: OnboardingFormProps) {
  const [isLoading, setIsLoading] = useState(false)
  const [gender, setGender] = useState(initialData?.gender || '')
  const [seatingLocation, setSeatingLocation] = useState(initialData?.seating_location || '')
  const router = useRouter()
  const { start, finish } = useGlobalLoadingBar()

  const handleSubmit = useCallback(async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsLoading(true)
    start()

    const formData = new FormData(e.currentTarget)
    const res = await completeOnboarding(formData)

    if (res.error) {
      toast.error(res.error)
      setIsLoading(false)
      finish()
      return
    }

    toast.success('Profile completed successfully')
    router.push('/')
    setIsLoading(false)
  }, [router, start, finish])

  return (
    <form onSubmit={handleSubmit} className={cn("flex flex-col gap-6", className)} {...props}>
      <div className="flex flex-col items-center gap-2 text-center">
        <h1 className="text-2xl font-bold">Complete Your Profile</h1>
        <p className="text-sm text-muted-foreground">
          Please provide your university information
        </p>
      </div>

      <div className="grid gap-6">
        {/* Name */}
        <div className="grid gap-2">
          <Label htmlFor="name">Full Name *</Label>
          <Input
            id="name"
            name="name"
            placeholder="Enter your full name"
            defaultValue={initialData?.name || ''}
            disabled={!!initialData?.name}
            className={initialData?.name ? 'bg-muted' : ''}
            required
          />
        </div>

        {/* University ID */}
        <div className="grid gap-2">
          <Label htmlFor="university_id">University ID *</Label>
          <Input
            id="university_id"
            name="university_id"
            placeholder="e.g. 1132231374"
            defaultValue={initialData?.university_id || ''}
            disabled={!!initialData?.university_id}
            className={initialData?.university_id ? 'bg-muted' : ''}
            required
          />
        </div>

        {/* Phone */}
        <div className="grid gap-2">
          <Label htmlFor="phone">Phone Number *</Label>
          <Input
            id="phone"
            name="phone"
            type="tel"
            placeholder="+91 9172660318"
            defaultValue={initialData?.phone || ''}
            disabled={!!initialData?.phone}
            className={initialData?.phone ? 'bg-muted' : ''}
            required
          />
        </div>

        {/* Gender */}
        <div className="grid gap-2">
          <Label htmlFor="gender">Gender *</Label>
          <Select name="gender" value={gender} onValueChange={setGender} disabled={!!initialData?.gender} required>
            <SelectTrigger className={initialData?.gender ? 'bg-muted' : ''}>
              <SelectValue placeholder="Select gender" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="male">Male</SelectItem>
              <SelectItem value="female">Female</SelectItem>
              <SelectItem value="other">Other</SelectItem>
            </SelectContent>
          </Select>
        </div>

        {/* Department */}
        <div className="grid gap-2">
          <Label htmlFor="department">Department *</Label>
          <Input
            id="department"
            name="department"
            placeholder="e.g. Computer Science & Engineering"
            defaultValue={initialData?.department || ''}
            disabled={!!initialData?.department}
            className={initialData?.department ? 'bg-muted' : ''}
            required
          />
        </div>

        {/* Designation */}
        <div className="grid gap-2">
          <Label htmlFor="designation">Designation *</Label>
          <Input
            id="designation"
            name="designation"
            placeholder="e.g. Assistant Professor"
            defaultValue={initialData?.designation || ''}
            disabled={!!initialData?.designation}
            className={initialData?.designation ? 'bg-muted' : ''}
            required
          />
        </div>

        {/* Seating Location Section */}
        <div className="space-y-4">
          <h3 className="text-lg font-semibold">Seating Location</h3>
          
          {/* Building Name */}
          <div className="grid gap-2">
            <Label htmlFor="building_name">Building Name *</Label>
            <Input
              id="building_name"
              name="building_name"
              placeholder="e.g. Main Building, Block A"
              defaultValue={initialData?.building_name || ''}
              disabled={!!initialData?.building_name}
              className={initialData?.building_name ? 'bg-muted' : ''}
              required
            />
          </div>

          {/* Floor Number */}
          <div className="grid gap-2">
            <Label htmlFor="floor_number">Floor Number *</Label>
            <Input
              id="floor_number"
              name="floor_number"
              type="number"
              placeholder="e.g. 2"
              min="0"
              defaultValue={initialData?.floor_number?.toString() || ''}
              disabled={initialData?.floor_number != null}
              className={initialData?.floor_number != null ? 'bg-muted' : ''}
              required
            />
          </div>

          {/* Room Number */}
          <div className="grid gap-2">
            <Label htmlFor="room_number">Room Number *</Label>
            <Input
              id="room_number"
              name="room_number"
              type="number"
              placeholder="e.g. 201"
              min="0"
              defaultValue={initialData?.room_number?.toString() || ''}
              disabled={initialData?.room_number != null}
              className={initialData?.room_number != null ? 'bg-muted' : ''}
              required
            />
          </div>

          {/* Seating Location Type */}
          <div className="grid gap-2">
            <Label htmlFor="seating_location">Seating Location Type *</Label>
            <Select name="seating_location" value={seatingLocation} onValueChange={setSeatingLocation} disabled={!!initialData?.seating_location} required>
              <SelectTrigger className={initialData?.seating_location ? 'bg-muted' : ''}>
                <SelectValue placeholder="Select seating type" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="cabin">Cabin</SelectItem>
                <SelectItem value="cubicle">Cubicle</SelectItem>
                <SelectItem value="workstation">Workstation</SelectItem>
                <SelectItem value="office">Office</SelectItem>
                <SelectItem value="other">Other</SelectItem>
              </SelectContent>
            </Select>
          </div>

          {/* Cabin */}
          <div className="grid gap-2">
            <Label htmlFor="cabin">Cabin</Label>
            <Input
              id="cabin"
              name="cabin"
              placeholder="e.g. Cabin 3"
              defaultValue={initialData?.cabin || ''}
              disabled={!!initialData?.cabin}
              className={initialData?.cabin ? 'bg-muted' : ''}
            />
          </div>

          {/* Cubicle */}
          <div className="grid gap-2">
            <Label htmlFor="cubicle">Cubicle</Label>
            <Input
              id="cubicle"
              name="cubicle"
              placeholder="e.g. Cubicle A5"
              defaultValue={initialData?.cubicle || ''}
              disabled={!!initialData?.cubicle}
              className={initialData?.cubicle ? 'bg-muted' : ''}
            />
          </div>

          {/* Workstation */}
          <div className="grid gap-2">
            <Label htmlFor="workstation">Workstation</Label>
            <Input
              id="workstation"
              name="workstation"
              placeholder="e.g. Workstation 12"
              defaultValue={initialData?.workstation || ''}
              disabled={!!initialData?.workstation}
              className={initialData?.workstation ? 'bg-muted' : ''}
            />
          </div>
        </div>

        {/* Submit */}
        <Button type="submit" className="w-full" disabled={isLoading}>
          {isLoading ? (
            <>
              <Loader className="h-4 w-4 animate-spin" />
              Completing Profile...
            </>
          ) : (
            'Complete Profile'
          )}
        </Button>
      </div>
    </form>
  )
} 