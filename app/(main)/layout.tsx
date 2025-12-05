import OnboardingCheck from '@/components/onboarding-check';
import BanCheck from '@/components/ban-check';

export default function MainLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <>
      <BanCheck />
      <OnboardingCheck />
      {children}
    </>
  );
}