'use client'

import { Component, ReactNode } from 'react'
import { Button } from '@/components/ui/button'
import { Alert, AlertTitle, AlertDescription } from '@/components/ui/alert'

interface Props {
  children: ReactNode
  fallback?: ReactNode
}

interface State {
  hasError: boolean
  error?: Error
}

export class ProfileErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props)
    this.state = { hasError: false }
  }

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error }
  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('Profile error:', error, errorInfo)
  }

  render() {
    if (this.state.hasError) {
      return this.props.fallback || (
        <div className="flex flex-1 flex-col gap-4 p-0 pt-0 items-center min-h-[70vh] justify-center">
          <Alert variant="destructive" className="max-w-xl">
            <AlertTitle>Something went wrong</AlertTitle>
            <AlertDescription className="mb-4">
              {this.state.error?.message || 'Failed to load profile data'}
            </AlertDescription>
            <Button onClick={() => window.location.reload()}>Try again</Button>
          </Alert>
        </div>
      )
    }

    return this.props.children
  }
}
