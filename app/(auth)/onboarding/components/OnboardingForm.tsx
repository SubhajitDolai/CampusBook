'use client'

import { useState, useCallback, useRef } from "react"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar"
import { Loader, Camera, User } from "lucide-react"
import { completeOnboarding, uploadAvatar } from '../actions'
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
  const [uploading, setUploading] = useState(false)
  const [avatarUrl, setAvatarUrl] = useState<string | null>(null)
  const [cabin, setCabin] = useState(initialData?.cabin || '')
  const [cubicle, setCubicle] = useState(initialData?.cubicle || '')
  const [workstation, setWorkstation] = useState(initialData?.workstation || '')
  const fileInputRef = useRef<HTMLInputElement>(null)
  const router = useRouter()
  const { start, finish } = useGlobalLoadingBar()

  const handleAvatarUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    setUploading(true)
    const result = await uploadAvatar(file)
    
    if (result.error) {
      toast.error(result.error)
    } else if (result.url) {
      setAvatarUrl(result.url)
      toast.success('Profile image uploaded!')
    }
    setUploading(false)
  }

  const handleSubmit = useCallback(async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    
    // Validate avatar upload
    if (!avatarUrl) {
      toast.error('Please upload a profile picture')
      return
    }
    
    // Validate at least one of cabin, cubicle, or workstation is filled
    if (!cabin.trim() && !cubicle.trim() && !workstation.trim()) {
      toast.error('Please fill in at least one: Cabin, Cubicle, or Workstation')
      return
    }
    
    setIsLoading(true)
    start()

    const formData = new FormData(e.currentTarget)
    formData.append('avatar_url', avatarUrl)
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
  }, [router, start, finish, avatarUrl, cabin, cubicle, workstation])

  return (
    <form onSubmit={handleSubmit} className={cn("flex flex-col gap-6", className)} {...props}>
      <div className="flex flex-col items-center gap-2 text-center">
        <h1 className="text-2xl font-bold">Complete Your Profile</h1>
        <p className="text-sm text-muted-foreground">
          Please provide your university information
        </p>
      </div>

      {/* Avatar Upload */}
      <div className="flex flex-col items-center gap-2">
        <Label className="text-sm font-medium">Profile Picture *</Label>
        <div className="relative group">
          <Avatar className="size-24 border-4 border-background shadow-lg">
            {avatarUrl && <AvatarImage src={avatarUrl} alt="Profile" />}
            <AvatarFallback className="text-2xl">
              {initialData?.name ? initialData.name.split(" ").map(n => n[0]).join("") : <User className="h-10 w-10" />}
            </AvatarFallback>
          </Avatar>
          <button
            type="button"
            onClick={() => fileInputRef.current?.click()}
            disabled={uploading}
            className="absolute inset-0 flex items-center justify-center bg-black/50 rounded-full opacity-0 group-hover:opacity-100 transition-opacity cursor-pointer disabled:cursor-not-allowed"
          >
            {uploading ? (
              <Loader className="h-6 w-6 text-white animate-spin" />
            ) : (
              <Camera className="h-6 w-6 text-white" />
            )}
          </button>
          <input
            ref={fileInputRef}
            type="file"
            accept="image/*"
            onChange={handleAvatarUpload}
            className="hidden"
          />
        </div>
        <p className="text-xs text-muted-foreground">Click to upload image</p>
        {!avatarUrl && (
          <p className="text-xs text-destructive">Profile picture is required</p>
        )}
      </div>

      <div className="grid gap-6">
        {/* Name */}
        <div className="grid gap-2">
          <Label htmlFor="name">Full Name *</Label>
          <Input
            id="name"
            name={initialData?.name ? undefined : "name"}
            placeholder="Enter your full name"
            defaultValue={initialData?.name || ''}
            disabled={!!initialData?.name}
            className={initialData?.name ? 'bg-muted' : ''}
            required={!initialData?.name}
          />
          {initialData?.name && <input type="hidden" name="name" value={initialData.name} />}
        </div>

        {/* University ID */}
        <div className="grid gap-2">
          <Label htmlFor="university_id">University ID *</Label>
          <Input
            id="university_id"
            name={initialData?.university_id ? undefined : "university_id"}
            placeholder="e.g. 1132231374"
            defaultValue={initialData?.university_id || ''}
            disabled={!!initialData?.university_id}
            className={initialData?.university_id ? 'bg-muted' : ''}
            required={!initialData?.university_id}
          />
          {initialData?.university_id && <input type="hidden" name="university_id" value={initialData.university_id} />}
        </div>

        {/* Phone */}
        <div className="grid gap-2">
          <Label htmlFor="phone">Phone Number *</Label>
          <Input
            id="phone"
            name={initialData?.phone ? undefined : "phone"}
            type="tel"
            placeholder="+91 9172660318"
            defaultValue={initialData?.phone || ''}
            disabled={!!initialData?.phone}
            className={initialData?.phone ? 'bg-muted' : ''}
            required={!initialData?.phone}
          />
          {initialData?.phone && <input type="hidden" name="phone" value={initialData.phone} />}
        </div>

        {/* Gender */}
        <div className="grid gap-2">
          <Label htmlFor="gender">Gender *</Label>
          <Select name={initialData?.gender ? undefined : "gender"} value={gender} onValueChange={setGender} disabled={!!initialData?.gender}>
            <SelectTrigger className={initialData?.gender ? 'bg-muted' : ''}>
              <SelectValue placeholder="Select gender" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="male">Male</SelectItem>
              <SelectItem value="female">Female</SelectItem>
              <SelectItem value="other">Other</SelectItem>
            </SelectContent>
          </Select>
          {!initialData?.gender && (
            <input
              type="text"
              name="gender_validation"
              value={gender}
              onChange={() => {}}
              required
              className="sr-only"
              tabIndex={-1}
            />
          )}
          {initialData?.gender && <input type="hidden" name="gender" value={gender} />}
        </div>

        {/* Department */}
        <div className="grid gap-2">
          <Label htmlFor="department">Department *</Label>
          <Input
            id="department"
            name={initialData?.department ? undefined : "department"}
            placeholder="e.g. Computer Science & Engineering"
            defaultValue={initialData?.department || ''}
            disabled={!!initialData?.department}
            className={initialData?.department ? 'bg-muted' : ''}
            required={!initialData?.department}
          />
          {initialData?.department && <input type="hidden" name="department" value={initialData.department} />}
        </div>

        {/* Designation */}
        <div className="grid gap-2">
          <Label htmlFor="designation">Designation *</Label>
          <Input
            id="designation"
            name={initialData?.designation ? undefined : "designation"}
            placeholder="e.g. Assistant Professor"
            defaultValue={initialData?.designation || ''}
            disabled={!!initialData?.designation}
            className={initialData?.designation ? 'bg-muted' : ''}
            required={!initialData?.designation}
          />
          {initialData?.designation && <input type="hidden" name="designation" value={initialData.designation} />}
        </div>

        {/* Seating Location Section */}
        <div className="space-y-4">
          <h3 className="text-lg font-semibold">Seating Location</h3>
          
          {/* Building Name */}
          <div className="grid gap-2">
            <Label htmlFor="building_name">Building Name *</Label>
            <Input
              id="building_name"
              name={initialData?.building_name ? undefined : "building_name"}
              placeholder="e.g. Main Building, Block A"
              defaultValue={initialData?.building_name || ''}
              disabled={!!initialData?.building_name}
              className={initialData?.building_name ? 'bg-muted' : ''}
              required={!initialData?.building_name}
            />
            {initialData?.building_name && <input type="hidden" name="building_name" value={initialData.building_name} />}
          </div>

          {/* Floor Number */}
          <div className="grid gap-2">
            <Label htmlFor="floor_number">Floor Number *</Label>
            <Input
              id="floor_number"
              name={initialData?.floor_number != null ? undefined : "floor_number"}
              type="number"
              placeholder="e.g. 2"
              min="0"
              defaultValue={initialData?.floor_number?.toString() || ''}
              disabled={initialData?.floor_number != null}
              className={initialData?.floor_number != null ? 'bg-muted' : ''}
              required={initialData?.floor_number == null}
            />
            {initialData?.floor_number != null && <input type="hidden" name="floor_number" value={initialData.floor_number.toString()} />}
          </div>

          {/* Room Number */}
          <div className="grid gap-2">
            <Label htmlFor="room_number">Room Number *</Label>
            <Input
              id="room_number"
              name={initialData?.room_number != null ? undefined : "room_number"}
              type="number"
              placeholder="e.g. 201"
              min="0"
              defaultValue={initialData?.room_number?.toString() || ''}
              disabled={initialData?.room_number != null}
              className={initialData?.room_number != null ? 'bg-muted' : ''}
              required={initialData?.room_number == null}
            />
            {initialData?.room_number != null && <input type="hidden" name="room_number" value={initialData.room_number.toString()} />}
          </div>

          {/* Seating Location Type */}
          <div className="grid gap-2">
            <Label htmlFor="seating_location">Seating Location Type *</Label>
            <Select name={initialData?.seating_location ? undefined : "seating_location"} value={seatingLocation} onValueChange={setSeatingLocation} disabled={!!initialData?.seating_location}>
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
            {!initialData?.seating_location && (
              <input
                type="text"
                name="seating_location_validation"
                value={seatingLocation}
                onChange={() => {}}
                required
                className="sr-only"
                tabIndex={-1}
              />
            )}
            {initialData?.seating_location && <input type="hidden" name="seating_location" value={seatingLocation} />}
          </div>

          {/* Cabin */}
          <div className="grid gap-2">
            <Label htmlFor="cabin">Cabin {!initialData?.cabin && '*'}</Label>
            <Input
              id="cabin"
              name="cabin"
              placeholder="e.g. Cabin 3"
              value={cabin}
              onChange={(e) => setCabin(e.target.value)}
              disabled={!!initialData?.cabin}
              className={initialData?.cabin ? 'bg-muted' : ''}
            />
          </div>

          {/* Cubicle */}
          <div className="grid gap-2">
            <Label htmlFor="cubicle">Cubicle {!initialData?.cubicle && '*'}</Label>
            <Input
              id="cubicle"
              name="cubicle"
              placeholder="e.g. Cubicle A5"
              value={cubicle}
              onChange={(e) => setCubicle(e.target.value)}
              disabled={!!initialData?.cubicle}
              className={initialData?.cubicle ? 'bg-muted' : ''}
            />
          </div>

          {/* Workstation */}
          <div className="grid gap-2">
            <Label htmlFor="workstation">Workstation {!initialData?.workstation && '*'}</Label>
            <Input
              id="workstation"
              name="workstation"
              placeholder="e.g. Workstation 12"
              value={workstation}
              onChange={(e) => setWorkstation(e.target.value)}
              disabled={!!initialData?.workstation}
              className={initialData?.workstation ? 'bg-muted' : ''}
            />
            {!cabin && !cubicle && !workstation && (
              <p className="text-xs text-muted-foreground">* At least one of Cabin, Cubicle, or Workstation is required</p>
            )}
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