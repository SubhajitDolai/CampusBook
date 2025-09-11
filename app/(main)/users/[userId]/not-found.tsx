'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { UserX, ArrowLeft } from 'lucide-react'
import { useRouter } from 'next/navigation'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'

export default function UserNotFound() {
  const router = useRouter()
  const { start } = useGlobalLoadingBar()

  const handleBack = () => {
    start()
    router.push('/users')
  }

  return (
    <div className="flex flex-1 flex-col gap-4 p-4 items-center justify-center min-h-[60vh]">
      <Card className="w-full max-w-md">
        <CardHeader className="text-center">
          <div className="flex justify-center mb-4">
            <div className="h-12 w-12 rounded-full bg-muted flex items-center justify-center">
              <UserX className="h-6 w-6 text-muted-foreground" />
            </div>
          </div>
          <CardTitle>User not found</CardTitle>
          <CardDescription>
            The user you&apos;re looking for doesn&apos;t exist or has been removed.
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Button 
            onClick={handleBack}
            className="w-full"
            variant="outline"
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Back to Users
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
