'use client'

import React, { Component, ReactNode } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { AlertTriangle, RefreshCw, ArrowLeft } from 'lucide-react'
import { useRouter } from 'next/navigation'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'

interface Props {
  children: ReactNode
}

interface State {
  hasError: boolean
  error?: Error
}

function ErrorFallback() {
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
            <div className="h-12 w-12 rounded-full bg-destructive/10 flex items-center justify-center">
              <AlertTriangle className="h-6 w-6 text-destructive" />
            </div>
          </div>
          <CardTitle>Failed to load user profile</CardTitle>
          <CardDescription>
            We couldn&apos;t load this user&apos;s information. This might be a temporary issue.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          <Button 
            onClick={() => window.location.reload()}
            className="w-full"
            variant="outline"
          >
            <RefreshCw className="h-4 w-4 mr-2" />
            Try Again
          </Button>
          <Button 
            onClick={handleBack}
            className="w-full"
            variant="secondary"
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Back to Users
          </Button>
          <p className="text-xs text-muted-foreground text-center mt-4">
            If the problem persists, please contact support.
          </p>
        </CardContent>
      </Card>
    </div>
  )
}

export default class UserProfileErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props)
    this.state = { hasError: false }
  }

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error }
  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('User profile error:', error, errorInfo)
  }

  render() {
    if (this.state.hasError) {
      return <ErrorFallback />
    }

    return this.props.children
  }
}
