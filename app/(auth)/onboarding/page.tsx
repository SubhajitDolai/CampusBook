import { OnboardingForm } from "./components/OnboardingForm"
import { createClient } from "@/utils/supabase/server"
import { redirect } from "next/navigation"

export default async function OnboardingPage() {
  const supabase = await createClient()
  
  const { data: { user } } = await supabase.auth.getUser()
  
  if (!user) {
    redirect('/login')
  }

  // Fetch existing profile data if any
  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  return (
    <div className="flex min-h-svh w-full items-center justify-center p-6 md:p-10">
      <div className="w-full max-w-md">
        <OnboardingForm initialData={profile} />
      </div>
    </div>
  )
} 