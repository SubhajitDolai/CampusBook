import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Calendar, Building2, Search, Plus } from 'lucide-react'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'
import { useRouter } from 'next/navigation'

export function QuickActionsCard() {
  const { start } = useGlobalLoadingBar()
  const router = useRouter()

  const handleNavigation = (href: string) => {
    start()
    router.push(href)
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Quick Actions</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-2 gap-3">
          <Button 
            variant="outline" 
            className="w-full h-20 flex-col gap-2"
            onClick={() => handleNavigation('/resources')}
          >
            <Search className="h-5 w-5" />
            <span className="text-sm">Browse Resources</span>
          </Button>
          
          <Button 
            variant="outline" 
            className="w-full h-20 flex-col gap-2"
            onClick={() => handleNavigation('/bookings')}
          >
            <Calendar className="h-5 w-5" />
            <span className="text-sm">My Bookings</span>
          </Button>
          
          <Button 
            variant="outline" 
            className="w-full h-20 flex-col gap-2"
            onClick={() => handleNavigation('/buildings')}
          >
            <Building2 className="h-5 w-5" />
            <span className="text-sm">View Buildings</span>
          </Button>
          
          <Button 
            variant="outline" 
            className="w-full h-20 flex-col gap-2"
            onClick={() => handleNavigation('/resources')}
          >
            <Plus className="h-5 w-5" />
            <span className="text-sm">New Booking</span>
          </Button>
        </div>
      </CardContent>
    </Card>
  )
} 