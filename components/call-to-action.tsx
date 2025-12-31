import { Button } from '@/components/ui/button'
import { useRouter } from 'next/navigation'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'

export default function CallToAction() {
    const router = useRouter()
    const { start } = useGlobalLoadingBar()

    const handleClick1 = () => {
        start()
        router.push('/dashboard')
    }
    const handleClick2 = () => {
        start()
        router.push('/resources')
    }

    return (
        <section id="get-started" className="py-16">
            <div className="mx-auto max-w-5xl rounded-3xl border px-6 py-12 md:py-20 lg:py-32">
                <div className="text-center">
                    <h2 className="text-balance text-4xl font-semibold lg:text-5xl">Simplify Your Campus Bookings</h2>
                    <p className="mt-4">Eliminate scheduling conflicts. Save time. Book any campus resource instantly.</p>

                    <div className="mt-12 flex flex-wrap justify-center gap-4">
                        <Button size="lg" onClick={handleClick1}>
                            <span>Get Started</span>
                        </Button>

                        <Button size="lg" variant="outline" onClick={handleClick2}>
                            <span>Resources</span>
                        </Button>
                    </div>
                </div>
            </div>
        </section>
    )
}
