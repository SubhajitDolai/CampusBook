import { redirect } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'
import { Toaster } from 'sonner'

export default async function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const supabase = await createClient()

  try {
    // Check if user is authenticated
    const { data: { user } } = await supabase.auth.getUser()
    
    if (!user) {
      redirect('/login')
    }

    // Get user profile to check role
    const { data: profile } = await supabase
      .from('profiles')
      .select('role, name')
      .eq('id', user.id)
      .single()

    // Check if user has admin or super_admin role
    if (!profile) {
      redirect('/onboarding')
    }

    if (profile.role !== 'admin' && profile.role !== 'super_admin') {
      // Redirect faculty users to main app with message
      redirect('/?error=unauthorized')
    }

    // User is authorized - render admin layout
    return (
      <>
        {children}
        <Toaster />
      </>
    )

  } catch (error) {
    console.error('Admin layout error:', error)
    redirect('/login')
  }
} 