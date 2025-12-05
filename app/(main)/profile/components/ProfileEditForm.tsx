'use client'

import { Card, CardTitle, CardDescription, CardContent, CardFooter } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { useForm } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import * as z from "zod"
import { useState } from "react"
import { useRouter } from "next/navigation"
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"
import { toast } from "sonner"
import { Loader, Save, ArrowLeft, User, Phone, Venus, Building2, Briefcase, IdCard } from "lucide-react"
import { updateProfile, type ProfileData } from '../actions'

const formSchema = z.object({
  name: z.string().min(2, "Name is required"),
  university_id: z.string().min(3, "University ID is required"),
  phone: z.string().min(10, "Phone number is required"),
  gender: z.enum(["male", "female", "other"]),
  designation: z.string().min(1, "Designation is required"),
  department: z.string().min(1, "Department is required"),
  seating_location: z.string().min(1, "Seating location type is required"),
  building_name: z.string().min(1, "Building name is required"),
  floor_number: z.string().min(1, "Floor number is required"),
  room_number: z.string().min(1, "Room number is required"),
  cabin: z.string().optional(),
  cubicle: z.string().optional(),
  workstation: z.string().optional()
})

type FormData = z.infer<typeof formSchema>

interface ProfileEditFormProps {
  profile: ProfileData
}

export function ProfileEditForm({ profile }: ProfileEditFormProps) {
  const [saving, setSaving] = useState(false)
  const [canceling, setCanceling] = useState(false)
  const router = useRouter()
  const { start } = useGlobalLoadingBar()

  const form = useForm<FormData>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      name: profile.name,
      university_id: profile.university_id || "",
      phone: profile.phone || "",
      gender: profile.gender,
      designation: profile.designation,
      department: profile.department,
      seating_location: profile.seating_location || "",
      building_name: profile.building_name || "",
      floor_number: profile.floor_number ? profile.floor_number.toString() : "",
      room_number: profile.room_number ? profile.room_number.toString() : "",
      cabin: profile.cabin || "",
      cubicle: profile.cubicle || "",
      workstation: profile.workstation || ""
    }
  })

  const onSubmit = async (data: FormData) => {
    setSaving(true)
    start()
    try {
      const result = await updateProfile({
        name: data.name,
        university_id: data.university_id,
        phone: data.phone || null,
        gender: data.gender,
        designation: data.designation,
        department: data.department,
        seating_location: data.seating_location,
        building_name: data.building_name,
        floor_number: parseInt(data.floor_number, 10),
        room_number: parseInt(data.room_number, 10),
        cabin: data.cabin || null,
        cubicle: data.cubicle || null,
        workstation: data.workstation || null
      })

      if (result.error) {
        toast.error(result.error)
      } else {
        toast.success("Profile updated successfully!")
        router.push("/profile")
        router.refresh()
      }
    } catch {
      toast.error("Something went wrong. Please try again.")
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
      {/* Banner + Avatar (matches profile page) */}
      <div className="w-full max-w-3xl relative">
        <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
        <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
          <div className="size-24 border-4 border-background shadow-lg rounded-full bg-muted flex items-center justify-center text-2xl font-bold text-muted-foreground select-none">
            {form.watch("name")?.split(" ").map(n => n[0]).join("") || ""}
          </div>
        </div>
      </div>

      {/* Main Card */}
      <Card className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
          <div className="flex flex-col items-center md:items-start gap-2">
            <div className="flex items-center gap-2">
              <CardTitle className="text-2xl font-bold">Edit Profile</CardTitle>
              <span className="capitalize px-2 py-1 rounded bg-secondary text-secondary-foreground text-xs font-semibold border border-secondary/40">
                {profile.role.replace("_", " ")}
              </span>
            </div>
            <CardDescription className="text-base text-muted-foreground">
              Update your personal information. Fields marked with * are required.
            </CardDescription>
          </div>
        </div>

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)}>
            <CardContent className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
              <div className="space-y-4">
                <FormField
                  control={form.control}
                  name="name"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="flex items-center gap-2">
                        <User className="h-4 w-4" />
                        Full Name *
                      </FormLabel>
                      <FormControl>
                        <Input placeholder="Enter your full name" {...field} />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="university_id"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="flex items-center gap-2">
                        <IdCard className="h-4 w-4" />
                        University ID *
                      </FormLabel>
                      <FormControl>
                        <Input placeholder="Enter your University ID" {...field} />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="phone"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="flex items-center gap-2">
                        <Phone className="h-4 w-4" />
                        Phone Number *
                      </FormLabel>
                      <FormControl>
                        <Input placeholder="+91 9876543210" {...field} />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
              </div>
              <div className="space-y-4">
                <FormField
                  control={form.control}
                  name="gender"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="flex items-center gap-2">
                        <Venus className="h-4 w-4" />
                        Gender *
                      </FormLabel>
                      <Select onValueChange={field.onChange} defaultValue={field.value}>
                        <FormControl>
                          <SelectTrigger>
                            <SelectValue placeholder="Select gender" />
                          </SelectTrigger>
                        </FormControl>
                        <SelectContent>
                          <SelectItem value="male">Male</SelectItem>
                          <SelectItem value="female">Female</SelectItem>
                          <SelectItem value="other">Other</SelectItem>
                        </SelectContent>
                      </Select>
                      <FormMessage />
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="department"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="flex items-center gap-2">
                        <Building2 className="h-4 w-4" />
                        Department *
                      </FormLabel>
                      <FormControl>
                        <Input placeholder="Enter your department" {...field} />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="designation"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="flex items-center gap-2">
                        <Briefcase className="h-4 w-4" />
                        Designation *
                      </FormLabel>
                      <FormControl>
                        <Input placeholder="Enter your designation" {...field} />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
              </div>
            </CardContent>
            
            {/* Seating Location Section */}
            <CardContent className="px-8 pb-8">
              <div className="border-t pt-8">
                <h3 className="text-lg font-semibold mb-6 flex items-center gap-2">
                  <Building2 className="h-5 w-5" />
                  Seating Location Information
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="space-y-4">
                    <FormField
                      control={form.control}
                      name="building_name"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Building Name *</FormLabel>
                          <FormControl>
                            <Input placeholder="e.g. Main Building, Block A" {...field} />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                    <FormField
                      control={form.control}
                      name="floor_number"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Floor Number *</FormLabel>
                          <FormControl>
                            <Input 
                              type="number" 
                              placeholder="e.g. 2" 
                              min="0"
                              {...field} 
                            />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                    <FormField
                      control={form.control}
                      name="room_number"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Room Number *</FormLabel>
                          <FormControl>
                            <Input 
                              type="number" 
                              placeholder="e.g. 201" 
                              min="0"
                              {...field} 
                            />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                  </div>
                  <div className="space-y-4">
                    <FormField
                      control={form.control}
                      name="seating_location"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Seating Location Type *</FormLabel>
                          <Select onValueChange={field.onChange} defaultValue={field.value}>
                            <FormControl>
                              <SelectTrigger>
                                <SelectValue placeholder="Select seating type" />
                              </SelectTrigger>
                            </FormControl>
                            <SelectContent>
                              <SelectItem value="cabin">Cabin</SelectItem>
                              <SelectItem value="cubicle">Cubicle</SelectItem>
                              <SelectItem value="workstation">Workstation</SelectItem>
                              <SelectItem value="office">Office</SelectItem>
                              <SelectItem value="other">Other</SelectItem>
                            </SelectContent>
                          </Select>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                    <FormField
                      control={form.control}
                      name="cabin"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Cabin</FormLabel>
                          <FormControl>
                            <Input placeholder="e.g. Cabin 3" {...field} />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                    <FormField
                      control={form.control}
                      name="cubicle"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Cubicle</FormLabel>
                          <FormControl>
                            <Input placeholder="e.g. Cubicle A5" {...field} />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                    <FormField
                      control={form.control}
                      name="workstation"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel>Workstation</FormLabel>
                          <FormControl>
                            <Input placeholder="e.g. Workstation 12" {...field} />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                  </div>
                </div>
              </div>
            </CardContent>
            <CardFooter className="flex justify-between gap-2 px-8 pb-8">
              <Button
                size="lg"
                variant="outline"
                className="min-w-[140px]"
                type="button"
                onClick={() => { 
                  setCanceling(true)
                  start() 
                  router.push("/profile")
                }}
                disabled={saving || canceling}
              >
                {canceling ? (
                  <>
                    <Loader className="h-4 w-4 animate-spin" />
                    Loading...
                  </>
                ) : (
                  <>
                    <ArrowLeft className="h-4 w-4" />
                    Cancel
                  </>
                )}
              </Button>
              <Button type="submit" size="lg" className="min-w-[140px]" disabled={saving || canceling}>
                {saving ? (
                  <>
                    <Loader className="h-4 w-4 animate-spin" />
                    Saving...
                  </>
                ) : (
                  <>
                    <Save className="h-4 w-4" />
                    Save Changes
                  </>
                )}
              </Button>
            </CardFooter>
          </form>
        </Form>
      </Card>
    </div>
  )
}
