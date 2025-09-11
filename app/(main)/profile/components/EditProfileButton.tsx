'use client'

import { Button } from '@/components/ui/button'
import { Edit, Loader } from 'lucide-react'
import { useRouter } from 'next/navigation'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { useState } from 'react'

export function EditProfileButton() {
  const router = useRouter()
  const { start } = useGlobalLoadingBar()
  const [loading, setLoading] = useState(false)

  const handleClick = async () => {
    setLoading(true)
    start()
    router.push('/profile/edit')
  }

  return (
    <Button 
      variant="outline" 
      onClick={handleClick}
      disabled={loading}
      className="flex items-center gap-2"
    >
      {loading ? (
        <>
          <Loader className="size-4 animate-spin" />
          Loading...
        </>
      ) : (
        <>
          <Edit className="size-4" />
          Edit Profile
        </>
      )}
    </Button>
  )
}
