-- Password Reset Function
-- ADMIN USE ONLY - Run from Supabase SQL Editor
-- DO NOT expose via RPC or API endpoints
-- Usage: SELECT * FROM reset_user_password('email@mitwpu.edu.in', 'NewPassword123');

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- WARNING: This function should only be executed by database administrators
-- from the Supabase SQL Editor. Do not call this from application code.
CREATE OR REPLACE FUNCTION reset_user_password(
    user_email TEXT,
    new_password TEXT
)
RETURNS TABLE (
    success BOOLEAN,
    message TEXT,
    email TEXT
) AS $$
DECLARE
    user_exists BOOLEAN;
BEGIN
    -- Check if user exists
    SELECT EXISTS(
        SELECT 1 FROM auth.users WHERE LOWER(auth.users.email) = LOWER(user_email)
    ) INTO user_exists;
    
    IF NOT user_exists THEN
        RETURN QUERY SELECT FALSE, 'User not found'::TEXT, user_email;
        RETURN;
    END IF;
    
    -- Update password with bcrypt hash
    UPDATE auth.users
    SET encrypted_password = crypt(new_password, gen_salt('bf')),
        updated_at = NOW()
    WHERE LOWER(auth.users.email) = LOWER(user_email);
    
    RETURN QUERY SELECT TRUE, 'Password updated successfully'::TEXT, user_email;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
