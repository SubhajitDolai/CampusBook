"use client"

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
import { Card, CardTitle, CardDescription, CardContent, CardFooter } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"
import { Skeleton } from "@/components/ui/skeleton"
import { useForm } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import * as z from "zod"
import { useEffect, useState } from "react"
import { createClient } from "@/utils/supabase/client"
import { useRouter } from "next/navigation"
import { useGlobalLoadingBar } from "@/components/providers/LoadingBarProvider"
import { toast } from "sonner"
import { Loader, Save, ArrowLeft, User, Phone, Venus, Building2, Briefcase, IdCard } from "lucide-react"

const formSchema = z.object({
  name: z.string().min(2, "Name is required"),
  university_id: z.string().min(3, "University ID is required"),
  phone: z.string().min(10, "Phone number is required"),
  gender: z.enum(["male", "female", "other"]),
  designation: z.string().min(1, "Designation is required"),
  department: z.string().min(1, "Department is required")
})

type Profile = {
  name: string;
  email?: string;
  university_id: string;
  phone?: string;
  gender: 'male' | 'female' | 'other';
  designation: string;
  department: string;
  role: string;
};

type FormData = z.infer<typeof formSchema>

export default function ProfileEditPage() {
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [currentProfile, setCurrentProfile] = useState<Profile | null>(null)
  const router = useRouter()
  const { start } = useGlobalLoadingBar()

  const form = useForm<FormData>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      name: "",
      university_id: "",
      phone: "",
      gender: "male",
      designation: "",
      department: ""
    }
  })

  useEffect(() => {
    async function fetchProfile() {
      setLoading(true)
      setError(null)
      try {
        const supabase = createClient()
        const { data: { user } } = await supabase.auth.getUser()
        if (!user) {
          setError("Not authenticated.")
          setLoading(false)
          return
        }
        const { data, error } = await supabase
          .from("profiles")
          .select("name, email, university_id, phone, gender, designation, department, role")
          .eq("id", user.id)
          .single()
        if (error || !data) {
          setError("Profile not found.")
        } else {
          setCurrentProfile(data)
          form.reset({
            name: data.name,
            university_id: data.university_id || "",
            phone: data.phone || "",
            gender: data.gender,
            designation: data.designation,
            department: data.department
          })
        }
      } catch (e) {
        console.log(e)
        setError("Failed to load profile.")
      } finally {
        setLoading(false)
      }
    }
    fetchProfile()
  }, [form])

  const onSubmit = async (data: FormData) => {
    setSaving(true)
    setError(null)
    start()
    try {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        setError("Not authenticated.")
        setSaving(false)
        return
      }

      // Check if university_id is unique (if changed)
      if (currentProfile && data.university_id !== currentProfile.university_id) {
        const { data: existing, error: checkError } = await supabase
          .from("profiles")
          .select("id")
          .eq("university_id", data.university_id)
          .neq("id", user.id)
        if (checkError) {
          setError("Failed to check University ID. Try again.")
          setSaving(false)
          return
        }
        if (existing && existing.length > 0) {
          setError("This University ID is already taken.")
          setSaving(false)
          return
        }
      }

      const { error } = await supabase
        .from("profiles")
        .update({
          name: data.name,
          university_id: data.university_id,
          phone: data.phone || null,
          gender: data.gender,
          designation: data.designation,
          department: data.department
        })
        .eq("id", user.id)

      if (error) {
        setError("Failed to update profile. Please try again.")
      } else {
        toast.success("Profile updated successfully!")
        router.push("/profile")
      }
    } catch (e) {
      console.log(e)
      setError("Something went wrong. Please try again.")
    } finally {
      setSaving(false)
    }
  }

  if (loading) {
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
                    <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
                  </BreadcrumbItem>
                  <BreadcrumbSeparator className="hidden md:block" />
                  <BreadcrumbItem>
                    <BreadcrumbLink href="/profile">Profile</BreadcrumbLink>
                  </BreadcrumbItem>
                  <BreadcrumbSeparator className="hidden md:block" />
                  <BreadcrumbItem>
                    <BreadcrumbPage>Edit</BreadcrumbPage>
                  </BreadcrumbItem>
                </BreadcrumbList>
              </Breadcrumb>
            </div>
          </header>
          <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
            {/* Banner + Avatar Skeleton (matches profile page) */}
            <div className="w-full max-w-3xl relative">
              <Skeleton className="h-36 w-full rounded-b-2xl" />
              <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
                <Skeleton className="size-24 rounded-full border-4 border-background shadow-lg" />
              </div>
            </div>
            {/* Main Card Skeleton (matches edit UI: all required fields and buttons, with label and input skeletons) */}
            <div className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80 rounded-xl">
              <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
                <div className="flex flex-col items-center md:items-start gap-2">
                  <div className="flex items-center gap-2">
                    <Skeleton className="h-8 w-32 rounded" /> {/* Edit Profile title */}
                    <Skeleton className="h-6 w-20 rounded" /> {/* Role badge */}
                  </div>
                  <Skeleton className="h-5 w-56 rounded" /> {/* Description */}
                </div>
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-8 px-8 pb-8">
                {/* Left column */}
                <div className="space-y-6">
                  {/* Name */}
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32 rounded" /> {/* Label */}
                    <Skeleton className="h-10 w-full rounded" /> {/* Input */}
                  </div>
                  {/* University ID */}
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32 rounded" />
                    <Skeleton className="h-10 w-full rounded" />
                  </div>
                  {/* Phone */}
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32 rounded" />
                    <Skeleton className="h-10 w-full rounded" />
                  </div>
                </div>
                {/* Right column */}
                <div className="space-y-6">
                  {/* Gender */}
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32 rounded" />
                    <Skeleton className="h-10 w-full rounded" />
                  </div>
                  {/* Department */}
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32 rounded" />
                    <Skeleton className="h-10 w-full rounded" />
                  </div>
                  {/* Designation */}
                  <div className="space-y-2">
                    <Skeleton className="h-4 w-32 rounded" />
                    <Skeleton className="h-10 w-full rounded" />
                  </div>
                </div>
              </div>
              <div className="flex justify-between gap-2 px-8 pb-8">
                <Skeleton className="h-12 w-[140px] rounded" /> {/* Cancel button */}
                <Skeleton className="h-12 w-[140px] rounded" /> {/* Save button */}
              </div>
            </div>
          </div>
        </SidebarInset>
      </SidebarProvider>
    )
  }

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
                  <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbLink href="/profile">Profile</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbPage>Edit</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh]">
          {error ? (
            <Alert variant="destructive" className="max-w-xl mt-8">
              <AlertTitle>Error</AlertTitle>
              <AlertDescription>{error}</AlertDescription>
            </Alert>
          ) : (
            <>
              {/* Banner + Avatar (matches profile page) */}
              <div className="w-full max-w-3xl relative">
                <div className="h-36 w-full rounded-b-2xl bg-gradient-to-r from-blue-100 via-indigo-100 to-purple-100 dark:from-blue-950 dark:via-indigo-950 dark:to-purple-950" />
                <div className="absolute left-1/2 -bottom-12 -translate-x-1/2">
                  <div className="size-24 border-4 border-background shadow-lg rounded-full bg-muted flex items-center justify-center text-2xl font-bold text-muted-foreground select-none">
                    {form.watch("name")?.split(" ").map(n => n[0]).join("") || ""}
                  </div>
                </div>
              </div>
              {/* Main Card (matches profile page, but with editable fields) */}
              <Card className="w-full max-w-3xl mt-16 p-0 overflow-visible shadow-xl border bg-background/80">
                <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 px-8 pt-8 pb-6">
                  <div className="flex flex-col items-center md:items-start gap-2">
                    <div className="flex items-center gap-2">
                      <CardTitle className="text-2xl font-bold">Edit Profile</CardTitle>
                      {currentProfile && (
                        <span className="capitalize px-2 py-1 rounded bg-secondary text-secondary-foreground text-xs font-semibold border border-secondary/40">
                          {currentProfile.role.replace("_", " ")}
                        </span>
                      )}
                    </div>
                    <CardDescription className="text-base text-muted-foreground">Update your personal information. Fields marked with * are required.</CardDescription>
                  </div>
                  {/* Removed duplicate Cancel button from top right */}
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
                    <CardFooter className="flex justify-between gap-2 px-8 pb-8">
                      <Button
                        size="lg"
                        variant="outline"
                        className="min-w-[140px]"
                        type="button"
                        onClick={() => { start(); router.push("/profile") }}
                        disabled={saving}
                      >
                        <ArrowLeft className="h-4 w-4" />
                        Cancel
                      </Button>
                      <Button type="submit" size="lg" className="min-w-[140px]" disabled={saving}>
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
            </>
          )}
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}