// Resource status utility functions

export type ResourceStatus = 'Available' | 'In Use' | 'Maintenance' | 'Unavailable'

export function getStatusBadgeVariant(status: string): 'default' | 'secondary' | 'destructive' | 'outline' {
  switch (status) {
    case 'Available':
      return 'default'
    case 'In Use':
      return 'destructive'
    case 'Maintenance':
      return 'outline'
    case 'Unavailable':
      return 'secondary'
    default:
      return 'outline'
  }
}

export function getStatusColor(status: string): string {
  switch (status) {
    case 'Available':
      return 'text-green-600 dark:text-green-400'
    case 'In Use':
      return 'text-blue-600 dark:text-blue-400'
    case 'Maintenance':
      return 'text-yellow-600 dark:text-yellow-400'
    case 'Unavailable':
      return 'text-red-600 dark:text-red-400'
    default:
      return 'text-gray-600 dark:text-gray-400'
  }
}

export function isResourceBookable(status: string): boolean {
  return status === 'Available'
}

export function getButtonText(status: string): string {
  return isResourceBookable(status) ? 'Book Now' : 'View Details'
}
