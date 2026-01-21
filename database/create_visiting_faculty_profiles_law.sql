-- SQL Script to create profiles for visiting faculty users (School of Law)
-- Run this AFTER create_visiting_faculty_users.sql has been executed
-- Total profiles: 13

-- Insert profiles one by one, linking to auth.users by email

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Sumedh Nath', 'sumedh.nath.vf@mitwpu.edu.in', 'VF001', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('sumedh.nath.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Gaurav Ambedkar', 'gaurav.ambedkar.vf@mitwpu.edu.in', 'VF002', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('gaurav.ambedkar.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Ishaan Joshi', 'ishaan.joshi.vf@mitwpu.edu.in', 'VF003', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('ishaan.joshi.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Sourabh Sonawane', 'sourabh.sonawane.vf@mitwpu.edu.in', 'VF004', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('sourabh.sonawane.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Shalaka Inamdar', 'shalaka.inamdar.vf@mitwpu.edu.in', 'VF005', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('shalaka.inamdar.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Avinash Nazre', 'avinash.nazre.vf@mitwpu.edu.in', 'VF006', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('avinash.nazre.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Saumitra Mahajan', 'saumitra.mahajan.vf@mitwpu.edu.in', 'VF007', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('saumitra.mahajan.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Dhanashree Ghate', 'dhanashree.ghate.vf@mitwpu.edu.in', 'VF008', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('dhanashree.ghate.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Pawan Kalwala', 'pawan.kalwala.vf@mitwpu.edu.in', 'VF009', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('pawan.kalwala.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Satya Singh', 'satya.singh.vf@mitwpu.edu.in', 'VF010', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('satya.singh.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Akshay Pawale', 'akshay.pawale.vf@mitwpu.edu.in', 'VF011', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('akshay.pawale.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Seema Deshpande', 'seema.deshpande.vf@mitwpu.edu.in', 'VF012', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('seema.deshpande.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Amruta Malusare', 'amruta.malusare.vf@mitwpu.edu.in', 'VF013', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('amruta.malusare.vf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

-- Add three more visiting faculty entries
INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Mihir Inamdar', 'mihir.inamdar@mitwpu.edu.in', 'VF014', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('mihir.inamdar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Apurva Tiwari', '1362250349@mitwpu.edu.in', 'VF015', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('1362250349@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, designation, department)
SELECT id, 'Achira Chakraborty', '1362250377@mitwpu.edu.in', 'VF016', 'Visiting Faculty', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('1362250377@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

-- Verify the profiles were created (includes the three numeric emails)
SELECT 'Total visiting faculty profiles created (including these 3):' as status, COUNT(*) as count 
FROM profiles 
WHERE email LIKE '%.vf@mitwpu.edu.in' OR LOWER(email) IN ('mihir.inamdar@mitwpu.edu.in','1362250349@mitwpu.edu.in','1362250377@mitwpu.edu.in');
