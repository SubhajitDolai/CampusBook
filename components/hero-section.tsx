'use client'
import React from 'react'
import { Swiper, SwiperSlide } from 'swiper/react'
import { Autoplay, EffectCoverflow } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/autoplay'
import 'swiper/css/navigation'
import 'swiper/css/pagination'
import 'swiper/css/effect-coverflow'
import Link from 'next/link'
import { Logo } from '@/components/logo'
import { ArrowRight, Menu, Rocket, X, CalendarCheck, Clock, Bell, Smartphone, Sun, Moon, Monitor, Laptop, Fingerprint, Settings2, BarChart3, ShieldCheck } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { logout } from '@/app/(auth)/login/actions';
import { useGlobalLoadingBar } from '@/components/providers/LoadingBarProvider';
import { useTheme } from 'next-themes';

const menuItems = [
    { name: 'Home', href: '#home' },
    { name: 'Features', href: '#features' },
    { name: 'Integrations', href: '#integrations' },
    { name: 'How It Works', href: '#how-it-works' },
    { name: 'Stats', href: '#stats' },
    { name: 'Testimonials', href: '#testimonials' },
    { name: 'FAQ', href: '#faq' },
    { name: 'Team', href: '#team' },
];

export default function HeroSection() {
    const [menuState, setMenuState] = React.useState(false)
    const { start } = useGlobalLoadingBar();
    const { setTheme, theme } = useTheme();
    const [mounted, setMounted] = React.useState(false);
    const [deviceType, setDeviceType] = React.useState<'mobile' | 'tablet' | 'desktop'>('desktop');

    React.useEffect(() => {
        setMounted(true);
        const detectDevice = () => {
            const width = window.innerWidth;
            if (width < 768) setDeviceType('mobile');
            else if (width < 1024) setDeviceType('tablet');
            else setDeviceType('desktop');
        };
        detectDevice();
        window.addEventListener('resize', detectDevice);
        return () => window.removeEventListener('resize', detectDevice);
    }, []);

    const handleLogout = () => {
        start();
        logout();
    };

    const cycleTheme = () => {
        if (!mounted) return;
        if (theme === 'light') setTheme('dark');
        else if (theme === 'dark') setTheme('system');
        else setTheme('light');
    };

    let icon = <Sun className="h-4 w-4" />;
    let label = 'Light Mode';
    if (mounted) {
        if (theme === 'light') {
            icon = <Sun className="h-4 w-4" />;
            label = 'Light Mode';
        } else if (theme === 'dark') {
            icon = <Moon className="h-4 w-4" />;
            label = 'Dark Mode';
        } else {
            if (deviceType === 'mobile') {
                icon = <Smartphone className="h-4 w-4" />;
            } else if (deviceType === 'tablet') {
                icon = <Monitor className="h-4 w-4" />;
            } else {
                icon = <Laptop className="h-4 w-4" />;
            }
            label = 'System Theme';
        }
    }

    return (
        <>
            <header>
                <nav
                    data-state={menuState && 'active'}
                    className="fixed z-20 w-full border-b border-dashed bg-white backdrop-blur md:relative dark:bg-zinc-950/50 lg:dark:bg-transparent">
                    <div className="m-auto max-w-5xl px-6">
                        <div className="flex flex-wrap items-center justify-between gap-6 py-3 lg:gap-0 lg:py-4">
                            <div className="flex w-full justify-between lg:w-auto">
                                <Link
                                    href="/"
                                    aria-label="home"
                                    className="flex items-center space-x-2">
                                    <Logo />
                                </Link>

                                <button
                                    onClick={() => setMenuState(!menuState)}
                                    aria-label={menuState == true ? 'Close Menu' : 'Open Menu'}
                                    className="relative z-20 -m-2.5 -mr-4 block cursor-pointer p-2.5 lg:hidden">
                                    <Menu className="in-data-[state=active]:rotate-180 in-data-[state=active]:scale-0 in-data-[state=active]:opacity-0 m-auto size-6 duration-200" />
                                    <X className="in-data-[state=active]:rotate-0 in-data-[state=active]:scale-100 in-data-[state=active]:opacity-100 absolute inset-0 m-auto size-6 -rotate-180 scale-0 opacity-0 duration-200" />
                                </button>
                            </div>

                            <div className="bg-background in-data-[state=active]:block lg:in-data-[state=active]:flex mb-6 hidden w-full flex-wrap items-center justify-end space-y-8 rounded-3xl border p-6 shadow-2xl shadow-zinc-300/20 md:flex-nowrap lg:m-0 lg:flex lg:w-fit lg:gap-6 lg:space-y-0 lg:border-transparent lg:bg-transparent lg:p-0 lg:shadow-none dark:shadow-none dark:lg:bg-transparent">
                                <div className="lg:pr-4">
                                    <ul className="space-y-6 text-base lg:flex lg:gap-8 lg:space-y-0 lg:text-sm">
                                        {menuItems.map((item, index) => (
                                            <li key={index}>
                                                <Link
                                                    href={item.href}
                                                    className="text-muted-foreground hover:text-accent-foreground block duration-150">
                                                    <span>{item.name}</span>
                                                </Link>
                                            </li>
                                        ))}
                                    </ul>
                                </div>

                                <div className="flex w-full flex-col space-y-3 sm:flex-row sm:gap-3 sm:space-y-0 md:w-fit lg:border-l lg:pl-6">
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        onClick={handleLogout}
                                    >
                                        Logout
                                    </Button>
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        type="button"
                                        onClick={cycleTheme}
                                        aria-label={`Current theme: ${label}. Click to cycle themes.`}
                                    >
                                        {icon}
                                        <span className="sr-only">{label}</span>
                                    </Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>
            <main className="overflow-hidden">
                <section id="home" className="relative">
                    <div className="relative py-24 lg:py-28">
                        <div className="mx-auto max-w-7xl px-6 md:px-12">
                            <div className="text-center sm:mx-auto sm:w-10/12 lg:mr-auto lg:mt-0 lg:w-4/5">
                                <Link
                                    href="/"
                                    className="rounded-(--radius) mx-auto flex w-fit items-center gap-2 border p-1 pr-3">
                                    <span className="bg-muted rounded-[calc(var(--radius)-0.25rem)] px-2 py-1 text-xs">New</span>
                                    <span className="text-sm">Introducing CampusGrid</span>
                                    <span className="bg-(--color-border) block h-4 w-px"></span>

                                    <ArrowRight className="size-4" />
                                </Link>

                                <h1 className="mt-8 text-4xl font-semibold md:text-5xl xl:text-5xl xl:[line-height:1.125]">
                                    Book University Resources<br /> With Ease and Simplicity
                                </h1>
                                <p className="mx-auto mt-8 hidden max-w-2xl text-wrap text-lg sm:block">CampusGrid lets university faculty quickly and reliably reserve rooms, labs, and campus resources. Simple, fast, and intuitive for your daily needs.</p>
                                <p className="mx-auto mt-6 max-w-2xl text-wrap sm:hidden">Reserve campus spaces in seconds. CampusGrid is built for faculty to save time and stay organized.</p>

                                <div className="mt-8">
                                    <Button
                                        size="lg"
                                        asChild>
                                        <Link href="#">
                                            <Rocket className="relative size-4" />
                                            <span className="text-nowrap">Get Started</span>
                                        </Link>
                                    </Button>
                                </div>
                            </div>
                            <div className="x-auto relative mx-auto mt-8 max-w-lg sm:mt-12">
                                <div className="absolute inset-0 -top-8 left-1/2 -z-20 h-56 w-full -translate-x-1/2 [background-image:linear-gradient(to_bottom,transparent_98%,theme(colors.gray.200/75%)_98%),linear-gradient(to_right,transparent_94%,_theme(colors.gray.200/75%)_94%)] [background-size:16px_35px] [mask:radial-gradient(black,transparent_95%)] dark:opacity-10"></div>
                                <div className="absolute inset-x-0 top-12 -z-[1] mx-auto h-1/3 w-2/3 rounded-full bg-blue-300 blur-3xl dark:bg-white/20"></div>

                                <Swiper
                                    slidesPerView={1}
                                    pagination={{ clickable: true }}
                                    loop
                                    autoplay={{ delay: 5000 }}
                                    modules={[Autoplay, EffectCoverflow]}>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <CalendarCheck className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Instant Booking</p>
                                            <span className="text-muted-foreground text-sm mt-2">Reserve any campus space in just a few clicks.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <Clock className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Real-Time Availability</p>
                                            <span className="text-muted-foreground text-sm mt-2">See up-to-date schedules and avoid double bookings.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <Bell className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Automated Reminders</p>
                                            <span className="text-muted-foreground text-sm mt-2">Get notified before your bookings start.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <Smartphone className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Mobile Friendly</p>
                                            <span className="text-muted-foreground text-sm mt-2">Book and manage resources from any device.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <Fingerprint className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Secure Access</p>
                                            <span className="text-muted-foreground text-sm mt-2">Your bookings and data are always protected.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <Settings2 className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Easy Management</p>
                                            <span className="text-muted-foreground text-sm mt-2">View, edit, or cancel bookings with ease.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <BarChart3 className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Analytics</p>
                                            <span className="text-muted-foreground text-sm mt-2">Track your bookings and usage statistics.</span>
                                        </div>
                                    </SwiperSlide>
                                    <SwiperSlide className="px-2">
                                        <div className="bg-background rounded-(--radius) h-44 max-w-lg border p-9 flex flex-col items-center justify-center">
                                            <ShieldCheck className="h-10 w-10 mb-4" />
                                            <p className="text-center text-lg font-medium">Access Control</p>
                                            <span className="text-muted-foreground text-sm mt-2">Only authorized faculty can book and manage specific resources.</span>
                                        </div>
                                    </SwiperSlide>
                                </Swiper>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </>
    )
}
