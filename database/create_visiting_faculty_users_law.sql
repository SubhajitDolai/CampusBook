-- SQL Script to create visiting faculty users in Supabase Auth
-- Password for all users: Test@12345
-- 
-- IMPORTANT: Run this in the Supabase SQL Editor with appropriate permissions
-- The password hash below is for 'Test@12345' using bcrypt
-- 
-- Note: In Supabase, you need to use the auth.users table
-- The password is hashed using bcrypt with the format: $2a$10$...

-- Create visiting faculty users for School of Law

DO $$
DECLARE
    email_list TEXT[] := ARRAY[
        'sumedh.nath.vf@mitwpu.edu.in',
        'gaurav.ambedkar.vf@mitwpu.edu.in',
        'ishaan.joshi.vf@mitwpu.edu.in',
        'sourabh.sonawane.vf@mitwpu.edu.in',
        'shalaka.inamdar.vf@mitwpu.edu.in',
        'avinash.nazre.vf@mitwpu.edu.in',
        'saumitra.mahajan.vf@mitwpu.edu.in',
        'dhanashree.ghate.vf@mitwpu.edu.in',
        'pawan.kalwala.vf@mitwpu.edu.in',
        'satya.singh.vf@mitwpu.edu.in',
        'akshay.pawale.vf@mitwpu.edu.in',
        'seema.deshpande.vf@mitwpu.edu.in',
        'amruta.malusare.vf@mitwpu.edu.in',
        'mihir.inamdar@mitwpu.edu.in',
        '1362250349@mitwpu.edu.in',
        '1362250377@mitwpu.edu.in'
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
WHERE email LIKE '%.vf@mitwpu.edu.in' OR LOWER(email) IN ('mihir.inamdar@mitwpu.edu.in','1362250349@mitwpu.edu.in','1362250377@mitwpu.edu.in');
