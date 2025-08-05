import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Calendar, Building2, Search, Plus } from 'lucide-react'
import Link from 'next/link'

export function QuickActionsCard() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Quick Actions</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-2 gap-3">
          <Link href="/resources">
            <Button variant="outline" className="w-full h-20 flex-col gap-2">
              <Search className="h-5 w-5" />
              <span className="text-sm">Browse Resources</span>
            </Button>
          </Link>
          
          <Link href="/bookings">
            <Button variant="outline" className="w-full h-20 flex-col gap-2">
              <Calendar className="h-5 w-5" />
              <span className="text-sm">My Bookings</span>
            </Button>
          </Link>
          
          <Link href="/buildings">
            <Button variant="outline" className="w-full h-20 flex-col gap-2">
              <Building2 className="h-5 w-5" />
              <span className="text-sm">View Buildings</span>
            </Button>
          </Link>
          
          <Link href="/resources">
            <Button variant="outline" className="w-full h-20 flex-col gap-2">
              <Plus className="h-5 w-5" />
              <span className="text-sm">New Booking</span>
            </Button>
          </Link>
        </div>
      </CardContent>
    </Card>
  )
} 