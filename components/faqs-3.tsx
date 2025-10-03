'use client'

import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion'
import { DynamicIcon, type IconName } from 'lucide-react/dynamic'
import Link from 'next/link'

type FAQItem = {
    id: string
    icon: IconName
    question: string
    answer: string
}

export default function FAQsThree() {
    const faqItems: FAQItem[] = [
        {
            id: 'item-1',
            icon: 'calendar',
            question: 'How do I book a classroom or resource?',
            answer: 'Simply log in, select the resource you want to book, choose your preferred time, and confirm your booking. You’ll receive a confirmation instantly.',
        },
        {
            id: 'item-2',
            icon: 'edit',
            question: 'Can I edit or cancel a booking?',
            answer: 'Yes, you can view, edit, or cancel your bookings at any time from your dashboard, as long as it’s before the booking start time.',
        },
        {
            id: 'item-3',
            icon: 'users',
            question: 'Who can use CampusBook?',
            answer: 'CampusBook is designed for university faculty to book and manage campus resources. Access is typically provided by your university administration.',
        },
        {
            id: 'item-4',
            icon: 'bell',
            question: 'Will I get reminders for my bookings?',
            answer: 'Yes, CampusBook sends automated reminders before your booking starts so you never miss a reservation.',
        },
        {
            id: 'item-5',
            icon: 'lock',
            question: 'Is my data secure?',
            answer: 'Absolutely. All your booking information and personal data are protected with industry-standard security measures.',
        },
    ]

    return (
        <section id="faq" className="py-20">
            <div className="mx-auto max-w-5xl px-4 md:px-6">
                <div className="flex flex-col gap-10 md:flex-row md:gap-16">
                    <div className="md:w-1/3">
                        <div className="sticky top-20">
                            <h2 className="mt-4 text-3xl font-bold">Frequently Asked Questions</h2>
                            <p className="text-muted-foreground mt-4">
                                Can&apos;t find what you&apos;re looking for? Contact our{' '}
                                <Link
                                    href="#"
                                    className="text-blue-500 dark:text-white font-medium hover:underline">
                                    support team
                                </Link>
                            </p>
                        </div>
                    </div>
                    <div className="md:w-2/3">
                        <Accordion
                            type="single"
                            collapsible
                            className="w-full space-y-2">
                            {faqItems.map((item) => (
                                <AccordionItem
                                    key={item.id}
                                    value={item.id}
                                    className="bg-background shadow-xs rounded-lg border px-4 last:border-b">
                                    <AccordionTrigger className="cursor-pointer items-center py-5 hover:no-underline">
                                        <div className="flex items-center gap-3">
                                            <div className="flex size-6">
                                                <DynamicIcon
                                                    name={item.icon}
                                                    className="m-auto size-4"
                                                />
                                            </div>
                                            <span className="text-base">{item.question}</span>
                                        </div>
                                    </AccordionTrigger>
                                    <AccordionContent className="pb-5">
                                        <div className="px-9">
                                            <p className="text-base">{item.answer}</p>
                                        </div>
                                    </AccordionContent>
                                </AccordionItem>
                            ))}
                        </Accordion>
                    </div>
                </div>
            </div>
        </section>
    )
}
