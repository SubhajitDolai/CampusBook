import { redirect } from 'next/navigation';
import { createClient } from '@/utils/supabase/server';

export default async function OnboardingCheck() {
  const supabase = await createClient();

  const { data: userData, error: userError } = await supabase.auth.getUser();
  if (userError || !userData?.user) redirect('/login');

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userData.user.id)
    .single();

  if (!profile) redirect('/onboarding');

  return null;
}