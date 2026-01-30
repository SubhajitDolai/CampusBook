-- SQL Script to create profiles for group users (School of Liberal Arts)
-- Run this AFTER create_liberalarts_group_users.sql has been executed

-- Insert profiles one by one, linking to auth.users by email

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Liberal Arts Labs', 'liberalarts.lab@mitwpu.edu.in', 'VFLA-GRP-001', 'Group Account', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('liberalarts.lab@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Liberal Arts Visiting Faculty Group', 'liberalarts.vf@mitwpu.edu.in', 'VFLA-GRP-002', 'Group Account', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('liberalarts.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Liberal Arts Staff', 'liberalarts.staff@mitwpu.edu.in', 'VFLA-GRP-003', 'Group Account', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('liberalarts.staff@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

-- Verify the profiles were created
SELECT 'Total Liberal Arts group profiles created (these emails):' as status, COUNT(*) as count 
FROM profiles 
WHERE LOWER(email) IN (
  'liberalarts.lab@mitwpu.edu.in',
  'liberalarts.vf@mitwpu.edu.in',
  'liberalarts.staff@mitwpu.edu.in'
);