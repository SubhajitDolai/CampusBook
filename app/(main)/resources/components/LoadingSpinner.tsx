import { Loader2 } from 'lucide-react'

interface LoadingSpinnerProps {
  message?: string
}

export function LoadingSpinner({ message = "Loading resources..." }: LoadingSpinnerProps) {
  return (
    <div className="flex items-center justify-center py-12">
      <Loader2 className="h-8 w-8 animate-spin" />
      <span className="ml-2">{message}</span>
    </div>
  )
} 