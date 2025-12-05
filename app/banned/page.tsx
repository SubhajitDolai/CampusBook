import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Ban, Mail, ArrowLeft } from 'lucide-react'
import Link from 'next/link'
import { createClient } from '@/utils/supabase/server'

export default async function AccessRestrictedPage() {
  const supabase = await createClient()
  // Auto logout
  await supabase.auth.signOut()
  
  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <div className="w-full max-w-md mx-auto">
        <Card className="border shadow-lg">
          <CardHeader className="text-center pb-4">
            <div className="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-destructive/10">
              <Ban className="h-6 w-6 text-destructive" />
            </div>
            <CardTitle className="text-xl font-semibold">Access Restricted</CardTitle>
            <p className="text-sm text-muted-foreground">
              Your account has been temporarily suspended
            </p>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="space-y-2">
              <p className="text-sm text-muted-foreground">
                This may be due to:
              </p>
              <ul className="text-sm text-muted-foreground space-y-1 list-disc list-inside">
                <li>Policy violations</li>
                <li>Missed reservations</li>
                <li>Outstanding obligations</li>
              </ul>
            </div>
            
            <div className="space-y-3">
              <Button asChild className="w-full">
                <Link 
                  href="https://mail.google.com/mail/?view=cm&fs=1&to=subhajit.dolai@mitwpu.edu.in&su=Account%20Access%20Appeal%20Request"
                  target="_blank"
                >
                  <Mail className="mr-2 h-4 w-4" />
                  Contact Administration
                </Link>
              </Button>
              
              <Button variant="outline" asChild className="w-full">
                <Link href="/login">
                  <ArrowLeft className="mr-2 h-4 w-4" />
                  Back to Login
                </Link>
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}