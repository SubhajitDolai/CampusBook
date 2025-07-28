import { Button } from '@/components/ui/button'
import { useRouter } from 'next/navigation'
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider'

export default function CallToAction() {
    const router = useRouter()
    const { start } = useGlobalLoadingBar()

    const handleClick = () => {
        start()
        router.push('/dashboard')
    }

    return (
        <section id="get-started" className="py-16">
            <div className="mx-auto max-w-5xl rounded-3xl border px-6 py-12 md:py-20 lg:py-32">
                <div className="text-center">
                    <h2 className="text-balance text-4xl font-semibold lg:text-5xl">Ready to Book Smarter?</h2>
                    <p className="mt-4">Join faculty across universities using CampusBook to simplify resource booking.</p>

                    <div className="mt-12 flex flex-wrap justify-center gap-4">
                        <Button size="lg" onClick={handleClick}>
                            <span>Get Started</span>
                        </Button>

                        <Button size="lg" variant="outline" onClick={handleClick}>
                            <span>Book Demo</span>
                        </Button>
                    </div>
                </div>
            </div>
        </section>
    )
}
