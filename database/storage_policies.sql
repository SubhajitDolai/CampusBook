-- Storage Policies for Profile Avatar Uploads
-- This file configures Supabase Storage policies for the 'profiles' bucket

-- Create one simple policy for authenticated users
-- Allows any authenticated user to upload, update, delete files in the profiles bucket
CREATE POLICY "Allow authenticated uploads to profiles"
ON storage.objects
FOR ALL
TO authenticated
USING (bucket_id = 'profiles')
WITH CHECK (bucket_id = 'profiles');

-- Note: Make sure the 'profiles' bucket is created and set to public in Supabase Dashboard
-- Storage → Create Bucket → Name: 'profiles' → Public: ✓
