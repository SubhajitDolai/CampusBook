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
            icon: 'user-check',
            question: 'Who can use CampusBook?',
            answer: 'CampusBook is intended only for MIT-WPU faculty and authorized administrative staff. Student access is restricted and managed separately by the university.',
        },
        {
            id: 'item-2',
            icon: 'layers',
            question: 'What types of resources can I book through CampusBook?',
            answer: 'Faculty can book classrooms, laboratories, seminar halls, meeting rooms, and other approved academic facilities as configured by the administration.',
        },
        {
            id: 'item-3',
            icon: 'calendar-clock',
            question: 'Can I book a classroom outside my regular timetable?',
            answer: 'Yes. If the classroom is available and permitted for booking, you may request a slot outside your regular timetable. All bookings require approval from the concerned authority.',
        },
        {
            id: 'item-4',
            icon: 'shield-check',
            question: 'Is there an approval process for certain bookings?',
            answer: 'Yes. Depending on the resource type and time slot, bookings may go through an approval workflow handled by Building Coordinator or administrators.',
        },
        {
            id: 'item-5',
            icon: 'repeat',
            question: 'Can I make recurring bookings for lectures or labs?',
            answer: 'Yes. Faculty can create bulk or recurring bookings for regular classes, lab sessions, or departmental activities to avoid repeated manual bookings.',
        },
        {
            id: 'item-6',
            icon: 'calendar-days',
            question: 'How early should I book a resource?',
            answer: 'Faculty are advised to place booking requests at least two days in advance. This allows sufficient time for review and approval, especially for shared or high-demand resources.',
        },
        {
            id: 'item-7',
            icon: 'alert-circle',
            question: 'How are conflicts handled if multiple faculty request the same resource?',
            answer: 'In case of multiple requests for the same resource and time slot, bookings are generally processed on a first-come, first-served basis. However, academic priority, such as scheduled teaching activities or administrative requirements, may be given preference where applicable.',
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
