import { Cpu, Zap, Clock, Bell, Smartphone, Fingerprint } from 'lucide-react'
import Image from 'next/image'

export default function ContentSection() {
    return (
        <section id="how-it-works" className="py-16 md:py-32">
            <div className="mx-auto max-w-5xl space-y-8 px-6 md:space-y-16">
                <h2 className="relative z-10 max-w-xl text-4xl font-medium lg:text-5xl">How CampusBook Works</h2>
                <div className="grid gap-6 sm:grid-cols-2 md:gap-12 lg:gap-24">
                    <div className="relative space-y-4">
                        <p className="text-muted-foreground">
                            CampusBook makes booking university resources simple for faculty. Just follow these easy steps:
                        </p>
                        <p className="text-muted-foreground">Choose your resource, pick a time, and book instantly. Stay organized and save time every day.</p>

                        <div className="grid grid-cols-2 gap-3 pt-6 sm:gap-4">
                            <div className="space-y-3">
                                <div className="flex items-center gap-2">
                                    <Zap className="size-4" />
                                    <h3 className="text-blue-500 dark:text-white text-sm font-medium">Book Instantly</h3>
                                </div>
                                <p className="text-muted-foreground text-sm">Reserve rooms, labs, and more in seconds.</p>
                            </div>
                            <div className="space-y-2">
                                <div className="flex items-center gap-2">
                                    <Cpu className="size-4" />
                                    <h3 className="text-blue-500 dark:text-white text-sm font-medium">Stay Organized</h3>
                                </div>
                                <p className="text-muted-foreground text-sm">Manage all your bookings in one place with ease.</p>
                            </div>
                            <div className="space-y-3">
                                <div className="flex items-center gap-2">
                                    <Clock className="size-4" />
                                    <h3 className="text-blue-500 dark:text-white text-sm font-medium">Real-Time Availability</h3>
                                </div>
                                <p className="text-muted-foreground text-sm">See up-to-date schedules and avoid double bookings.</p>
                            </div>
                            <div className="space-y-3">
                                <div className="flex items-center gap-2">
                                    <Bell className="size-4" />
                                    <h3 className="text-blue-500 dark:text-white text-sm font-medium">Automated Reminders</h3>
                                </div>
                                <p className="text-muted-foreground text-sm">Get notified before your bookings start.</p>
                            </div>
                            <div className="space-y-3">
                                <div className="flex items-center gap-2">
                                    <Smartphone className="size-4" />
                                    <h3 className="text-blue-500 dark:text-white text-sm font-medium">Mobile Friendly</h3>
                                </div>
                                <p className="text-muted-foreground text-sm">Book and manage resources from any device.</p>
                            </div>
                            <div className="space-y-3">
                                <div className="flex items-center gap-2">
                                    <Fingerprint className="size-4" />
                                    <h3 className="text-blue-500 dark:text-white text-sm font-medium">Secure Access</h3>
                                </div>
                                <p className="text-muted-foreground text-sm">Your bookings and data are always protected.</p>
                            </div>
                        </div>
                    </div>
                    <div className="relative mt-6 sm:mt-0">
                        <div className="bg-linear-to-b aspect-67/34 relative rounded-2xl from-zinc-300 to-transparent p-px dark:from-zinc-700">
                            <Image src="/building.webp" className="hidden rounded-[15px] dark:block" alt="university building dark" width={1206} height={612} />
                            <Image src="/building.webp" className="rounded-[15px] shadow dark:hidden" alt="university building light" width={1206} height={612} />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}
