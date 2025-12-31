import { Clock, Bell, Smartphone, Fingerprint, Settings2, Zap } from 'lucide-react'

export default function Features() {
    return (
        <section id="features" className="py-12 md:py-20">
            <div className="mx-auto max-w-5xl space-y-8 px-6 md:space-y-16">
                <div className="relative z-10 mx-auto max-w-xl space-y-6 text-center md:space-y-12">
                    <h2 className="text-balance text-4xl font-medium lg:text-5xl">Why CampusBook?</h2>
                    <p>CampusBook gives university faculty the tools to book, manage, and organize campus resources with speed and simplicity.</p>
                </div>

                <div className="relative mx-auto grid max-w-4xl divide-x divide-y border *:p-12 sm:grid-cols-2 lg:grid-cols-3">
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                        <Zap className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Instant Booking</h3>
                        </div>
                        <p className="text-sm">Reserve rooms, labs, and more in just a few clicks.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Clock className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Real-Time Availability</h3>
                        </div>
                        <p className="text-sm">See up-to-date schedules and avoid double bookings.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Bell className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Automated Reminders</h3>
                        </div>
                        <p className="text-sm">Get notified before your bookings start.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Smartphone className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Mobile Friendly</h3>
                        </div>
                        <p className="text-sm">Book and manage resources from any device.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Fingerprint className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Secure Access</h3>
                        </div>
                        <p className="text-sm">Your bookings and data are always protected.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Easy Management</h3>
                        </div>
                        <p className="text-sm">View, edit, or cancel bookings with ease.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Calendar-Based View</h3>
                        </div>
                        <p className="text-sm">Bookings can be viewed in a calendar format.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Faculty Directory</h3>
                        </div>
                        <p className="text-sm">The system maintains a directory of faculty members.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Analytics Dashboard</h3>
                        </div>
                        <p className="text-sm">Booking patterns, peak usage times & resource demand.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Class Timetable View</h3>
                        </div>
                        <p className="text-sm">Class schedules can be mapped within the system.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Classroom Timetable View</h3>
                        </div>
                        <p className="text-sm">Each classroom has its own timetable view.</p>
                    </div>
                    <div className="space-y-3">
                        <div className="flex items-center gap-2">
                            <Settings2 className="size-4 text-blue-500 dark:text-white " />
                            <h3 className="text-blue-500 dark:text-white text-sm font-medium">Faculty Timetable View</h3>
                        </div>
                        <p className="text-sm">Faculty members can view their lectures schedule</p>
                    </div>
                </div>
            </div>
        </section>
    )
}
