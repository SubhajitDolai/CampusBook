-- SQL Script to create profiles for visiting faculty users (School of Liberal Arts)
-- Run this AFTER create_visiting_faculty_users_liberal_arts.sql has been executed

-- Insert profiles one by one, linking to auth.users by email

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Dhanashree Bhide', 'dhanashree.bhide.vf@mitwpu.edu.in', 'VFLA001', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('dhanashree.bhide.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Purbash Nayak', 'purbash.nayak.vf@mitwpu.edu.in', 'VFLA002', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('purbash.nayak.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Tushar Dutt', 'tushar.dutt.vf@mitwpu.edu.in', 'VFLA003', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('tushar.dutt.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Maitreyee De', 'maitreyee.de.vf@mitwpu.edu.in', 'VFLA004', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('maitreyee.de.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Geetanjali Gole', 'geetanjali.gole.vf@mitwpu.edu.in', 'VFLA005', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('geetanjali.gole.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Umaima Lokhandwala', 'umaima.lokhandwala.vf@mitwpu.edu.in', 'VFLA006', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('umaima.lokhandwala.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

-- Note: this email may already exist in other visiting-faculty scripts; INSERT will be skipped if profile exists
INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Dhanashree Ghate', 'dhanashree.ghate.vf@mitwpu.edu.in', 'VFLA007', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('dhanashree.ghate.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Ketaki Hasabnis', 'ketaki.hasabnis.vf@mitwpu.edu.in', 'VFLA008', 'Visiting Faculty', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('ketaki.hasabnis.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

-- Verify the profiles were created
SELECT 'Total Liberal Arts visiting faculty profiles created (these emails):' as status, COUNT(*) as count 
FROM profiles 
WHERE LOWER(email) IN (
  'dhanashree.bhide.vf@mitwpu.edu.in',
  'purbash.nayak.vf@mitwpu.edu.in',
  'tushar.dutt.vf@mitwpu.edu.in',
  'maitreyee.de.vf@mitwpu.edu.in',
  'geetanjali.gole.vf@mitwpu.edu.in',
  'umaima.lokhandwala.vf@mitwpu.edu.in',
  'dhanashree.ghate.vf@mitwpu.edu.in',
  'ketaki.hasabnis.vf@mitwpu.edu.in'
);