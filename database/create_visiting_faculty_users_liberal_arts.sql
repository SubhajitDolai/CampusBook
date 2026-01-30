-- SQL Script to create visiting faculty users in Supabase Auth (School of Liberal Arts)
-- Password for all users: Test@12345
--
-- IMPORTANT: Run this in the Supabase SQL Editor with appropriate permissions
-- The password hash below is for 'Test@12345' using bcrypt
--
-- Note: In Supabase, you need to use the auth.users table
-- The password is hashed using bcrypt with the format: $2a$10$...

DO $$
DECLARE
    email_list TEXT[] := ARRAY[
        'dhanashree.bhide.vf@mitwpu.edu.in',
        'purbash.nayak.vf@mitwpu.edu.in',
        'tushar.dutt.vf@mitwpu.edu.in',
        'maitreyee.de.vf@mitwpu.edu.in',
        'geetanjali.gole.vf@mitwpu.edu.in',
        'umaima.lokhandwala.vf@mitwpu.edu.in',
        'dhanashree.ghate.vf@mitwpu.edu.in',
        'ketaki.hasabnis.vf@mitwpu.edu.in'
    ];
    user_email TEXT;
    new_user_id UUID;
BEGIN
    FOREACH user_email IN ARRAY email_list
    LOOP
        -- Skip empty emails
        IF user_email IS NULL OR user_email = '' THEN
            CONTINUE;
        END IF;

        -- Check if user already exists
        SELECT id INTO new_user_id 
        FROM auth.users 
        WHERE LOWER(email) = LOWER(user_email);

        IF new_user_id IS NULL THEN
            -- Insert new user
            INSERT INTO auth.users (
                instance_id,
                id,
                aud,
                role,
                email,
                encrypted_password,
                email_confirmed_at,
                invited_at,
                confirmation_token,
                confirmation_sent_at,
                recovery_token,
                recovery_sent_at,
                email_change_token_new,
                email_change,
                email_change_sent_at,
                last_sign_in_at,
                raw_app_meta_data,
                raw_user_meta_data,
                is_super_admin,
                created_at,
                updated_at,
                phone,
                phone_confirmed_at,
                phone_change,
                phone_change_token,
                phone_change_sent_at,
                email_change_token_current,
                email_change_confirm_status,
                banned_until,
                reauthentication_token,
                reauthentication_sent_at,
                is_sso_user,
                deleted_at
            ) VALUES (
                '00000000-0000-0000-0000-000000000000',
                gen_random_uuid(),
                'authenticated',
                'authenticated',
                user_email,
                crypt('Test@12345', gen_salt('bf')),
                NOW(),
                NOW(),
                '',
                NOW(),
                '',
                NOW(),
                '',
                '',
                NOW(),
                NOW(),
                '{"provider":"email","providers":["email"]}',
                '{}',
                FALSE,
                NOW(),
                NOW(),
                NULL,
                NULL,
                '',
                '',
                NOW(),
                '',
                0,
                NULL,
                '',
                NOW(),
                FALSE,
                NULL
            )
            RETURNING id INTO new_user_id;

            RAISE NOTICE 'Created user: %', user_email;
        ELSE
            RAISE NOTICE 'User already exists: %', user_email;
        END IF;
    END LOOP;
END $$;

-- Verify the users were created
SELECT COUNT(*) as total_visiting_faculty_users
FROM auth.users
WHERE email LIKE '%.vf@mitwpu.edu.in' AND LOWER(email) IN (
    'dhanashree.bhide.vf@mitwpu.edu.in',
    'purbash.nayak.vf@mitwpu.edu.in',
    'tushar.dutt.vf@mitwpu.edu.in',
    'maitreyee.de.vf@mitwpu.edu.in',
    'geetanjali.gole.vf@mitwpu.edu.in',
    'umaima.lokhandwala.vf@mitwpu.edu.in',
    'dhanashree.ghate.vf@mitwpu.edu.in',
    'ketaki.hasabnis.vf@mitwpu.edu.in'
);