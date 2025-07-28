'use client';

import HeroSection from './hero-section';
import IntegrationsSection from './integrations-7';
import Features from './features-4';

import dynamic from 'next/dynamic';

const ContentSection = dynamic(() => import('./content-7'), { ssr: false });
const StatsSection = dynamic(() => import('./stats'), { ssr: false });
const Testimonials = dynamic(() => import('./testimonials'), { ssr: false });
const CallToAction = dynamic(() => import('./call-to-action'), { ssr: false });
const TeamSection = dynamic(() => import('./team'), { ssr: false });
const FAQsTwo = dynamic(() => import('./faqs-3'), { ssr: false });
const FooterSection = dynamic(() => import('./footer'), { ssr: false });

export default function HomeShell() {
  return (
    <>
      <HeroSection />
      <IntegrationsSection />
      <Features />
      <ContentSection />
      <StatsSection />
      <Testimonials />
      <CallToAction />
      <TeamSection />
      <FAQsTwo />
      <FooterSection />
    </>
  );
}