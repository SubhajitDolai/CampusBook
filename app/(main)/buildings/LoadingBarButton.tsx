"use client";

import { Button } from '@/components/ui/button'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { useRouter } from 'next/navigation'
import { ComponentProps } from 'react'

interface LoadingBarButtonProps extends Omit<ComponentProps<typeof Button>, 'onClick'> {
  href: string
  children: React.ReactNode
}

export function LoadingBarButton({ href, children, ...buttonProps }: LoadingBarButtonProps) {
  const { start } = useGlobalLoadingBar()
  const router = useRouter()

  const handleClick = () => {
    start()
    router.push(href)
  }

  return (
    <Button {...buttonProps} onClick={handleClick}>
      {children}
    </Button>
  )
}
