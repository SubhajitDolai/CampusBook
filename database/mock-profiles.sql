-- Mock data for profiles table
-- This file contains sample data for testing the CampusBook system
-- First creates auth.users entries, then inserts profiles

-- Create auth users first
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token) VALUES
-- Super Admins
('550e8400-e29b-41d4-a716-446655440001', 'rajesh.kumar@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440002', 'priya.sharma@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Admins
('550e8400-e29b-41d4-a716-446655440003', 'amit.patel@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440004', 'meera.singh@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440005', 'sanjay.verma@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Computer Science
('550e8400-e29b-41d4-a716-446655440006', 'anjali.desai@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440007', 'rahul.gupta@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440008', 'kavita.reddy@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440009', 'vikram.malhotra@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440010', 'sunita.iyer@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Mechanical Engineering
('550e8400-e29b-41d4-a716-446655440011', 'deepak.joshi@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440012', 'rekha.menon@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440013', 'arjun.nair@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440014', 'lakshmi.pillai@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440015', 'suresh.kumar@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Electrical Engineering
('550e8400-e29b-41d4-a716-446655440016', 'geeta.sharma@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440017', 'manoj.tiwari@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440018', 'anjali.kapoor@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440019', 'rajiv.saxena@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440020', 'priyanka.das@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Civil Engineering
('550e8400-e29b-41d4-a716-446655440021', 'ramesh.chandra@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440022', 'meenakshi.rao@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440023', 'ashok.verma@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Chemical Engineering
('550e8400-e29b-41d4-a716-446655440024', 'swati.agarwal@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440025', 'nitin.sharma@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440026', 'pooja.gupta@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Physics
('550e8400-e29b-41d4-a716-446655440027', 'suresh.menon@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440028', 'radha.krishnan@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Mathematics
('550e8400-e29b-41d4-a716-446655440029', 'arun.kumar@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440030', 'leela.iyer@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Chemistry
('550e8400-e29b-41d4-a716-446655440031', 'rajeshwari.pillai@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440032', 'mahesh.reddy@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Biology
('550e8400-e29b-41d4-a716-446655440033', 'anjali.nair@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440034', 'srikant.das@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - Economics
('550e8400-e29b-41d4-a716-446655440035', 'priya.menon@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440036', 'rajiv.kapoor@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - English
('550e8400-e29b-41d4-a716-446655440037', 'meera.patel@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440038', 'arun.sharma@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),

-- Faculty - History
('550e8400-e29b-41d4-a716-446655440039', 'kavita.rao@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''),
('550e8400-e29b-41d4-a716-446655440040', 'suresh.iyer@university.edu', crypt('password123', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');

-- Now insert profiles with the same UUIDs
INSERT INTO profiles (id, name, email, university_id, phone, gender, designation, department, role) VALUES
-- Super Admins
('550e8400-e29b-41d4-a716-446655440001', 'Dr. Rajesh Kumar', 'rajesh.kumar@university.edu', 'SUPER001', '+91-9876543210', 'male', 'Vice Chancellor', 'Administration', 'super_admin'),
('550e8400-e29b-41d4-a716-446655440002', 'Dr. Priya Sharma', 'priya.sharma@university.edu', 'SUPER002', '+91-9876543211', 'female', 'Registrar', 'Administration', 'super_admin'),

-- Admins
('550e8400-e29b-41d4-a716-446655440003', 'Prof. Amit Patel', 'amit.patel@university.edu', 'ADMIN001', '+91-9876543212', 'male', 'Head of IT', 'Computer Science', 'admin'),
('550e8400-e29b-41d4-a716-446655440004', 'Dr. Meera Singh', 'meera.singh@university.edu', 'ADMIN002', '+91-9876543213', 'female', 'Dean of Engineering', 'Mechanical Engineering', 'admin'),
('550e8400-e29b-41d4-a716-446655440005', 'Prof. Sanjay Verma', 'sanjay.verma@university.edu', 'ADMIN003', '+91-9876543214', 'male', 'Head of Department', 'Electrical Engineering', 'admin'),

-- Faculty - Computer Science
('550e8400-e29b-41d4-a716-446655440006', 'Dr. Anjali Desai', 'anjali.desai@university.edu', 'CS001', '+91-9876543215', 'female', 'Associate Professor', 'Computer Science', 'faculty'),
('550e8400-e29b-41d4-a716-446655440007', 'Prof. Rahul Gupta', 'rahul.gupta@university.edu', 'CS002', '+91-9876543216', 'male', 'Assistant Professor', 'Computer Science', 'faculty'),
('550e8400-e29b-41d4-a716-446655440008', 'Dr. Kavita Reddy', 'kavita.reddy@university.edu', 'CS003', '+91-9876543217', 'female', 'Professor', 'Computer Science', 'faculty'),
('550e8400-e29b-41d4-a716-446655440009', 'Prof. Vikram Malhotra', 'vikram.malhotra@university.edu', 'CS004', '+91-9876543218', 'male', 'Assistant Professor', 'Computer Science', 'faculty'),
('550e8400-e29b-41d4-a716-446655440010', 'Dr. Sunita Iyer', 'sunita.iyer@university.edu', 'CS005', '+91-9876543219', 'female', 'Associate Professor', 'Computer Science', 'faculty'),

-- Faculty - Mechanical Engineering
('550e8400-e29b-41d4-a716-446655440011', 'Prof. Deepak Joshi', 'deepak.joshi@university.edu', 'ME001', '+91-9876543220', 'male', 'Professor', 'Mechanical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440012', 'Dr. Rekha Menon', 'rekha.menon@university.edu', 'ME002', '+91-9876543221', 'female', 'Associate Professor', 'Mechanical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440013', 'Prof. Arjun Nair', 'arjun.nair@university.edu', 'ME003', '+91-9876543222', 'male', 'Assistant Professor', 'Mechanical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440014', 'Dr. Lakshmi Pillai', 'lakshmi.pillai@university.edu', 'ME004', '+91-9876543223', 'female', 'Professor', 'Mechanical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440015', 'Prof. Suresh Kumar', 'suresh.kumar@university.edu', 'ME005', '+91-9876543224', 'male', 'Assistant Professor', 'Mechanical Engineering', 'faculty'),

-- Faculty - Electrical Engineering
('550e8400-e29b-41d4-a716-446655440016', 'Dr. Geeta Sharma', 'geeta.sharma@university.edu', 'EE001', '+91-9876543225', 'female', 'Professor', 'Electrical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440017', 'Prof. Manoj Tiwari', 'manoj.tiwari@university.edu', 'EE002', '+91-9876543226', 'male', 'Associate Professor', 'Electrical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440018', 'Dr. Anjali Kapoor', 'anjali.kapoor@university.edu', 'EE003', '+91-9876543227', 'female', 'Assistant Professor', 'Electrical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440019', 'Prof. Rajiv Saxena', 'rajiv.saxena@university.edu', 'EE004', '+91-9876543228', 'male', 'Professor', 'Electrical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440020', 'Dr. Priyanka Das', 'priyanka.das@university.edu', 'EE005', '+91-9876543229', 'female', 'Associate Professor', 'Electrical Engineering', 'faculty'),

-- Faculty - Civil Engineering
('550e8400-e29b-41d4-a716-446655440021', 'Prof. Ramesh Chandra', 'ramesh.chandra@university.edu', 'CE001', '+91-9876543230', 'male', 'Professor', 'Civil Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440022', 'Dr. Meenakshi Rao', 'meenakshi.rao@university.edu', 'CE002', '+91-9876543231', 'female', 'Associate Professor', 'Civil Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440023', 'Prof. Ashok Verma', 'ashok.verma@university.edu', 'CE003', '+91-9876543232', 'male', 'Assistant Professor', 'Civil Engineering', 'faculty'),

-- Faculty - Chemical Engineering
('550e8400-e29b-41d4-a716-446655440024', 'Dr. Swati Agarwal', 'swati.agarwal@university.edu', 'CHE001', '+91-9876543233', 'female', 'Professor', 'Chemical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440025', 'Prof. Nitin Sharma', 'nitin.sharma@university.edu', 'CHE002', '+91-9876543234', 'male', 'Associate Professor', 'Chemical Engineering', 'faculty'),
('550e8400-e29b-41d4-a716-446655440026', 'Dr. Pooja Gupta', 'pooja.gupta@university.edu', 'CHE003', '+91-9876543235', 'female', 'Assistant Professor', 'Chemical Engineering', 'faculty'),

-- Faculty - Physics
('550e8400-e29b-41d4-a716-446655440027', 'Prof. Suresh Menon', 'suresh.menon@university.edu', 'PHY001', '+91-9876543236', 'male', 'Professor', 'Physics', 'faculty'),
('550e8400-e29b-41d4-a716-446655440028', 'Dr. Radha Krishnan', 'radha.krishnan@university.edu', 'PHY002', '+91-9876543237', 'female', 'Associate Professor', 'Physics', 'faculty'),

-- Faculty - Mathematics
('550e8400-e29b-41d4-a716-446655440029', 'Dr. Arun Kumar', 'arun.kumar@university.edu', 'MATH001', '+91-9876543238', 'male', 'Professor', 'Mathematics', 'faculty'),
('550e8400-e29b-41d4-a716-446655440030', 'Prof. Leela Iyer', 'leela.iyer@university.edu', 'MATH002', '+91-9876543239', 'female', 'Associate Professor', 'Mathematics', 'faculty'),

-- Faculty - Chemistry
('550e8400-e29b-41d4-a716-446655440031', 'Dr. Rajeshwari Pillai', 'rajeshwari.pillai@university.edu', 'CHEM001', '+91-9876543240', 'female', 'Professor', 'Chemistry', 'faculty'),
('550e8400-e29b-41d4-a716-446655440032', 'Prof. Mahesh Reddy', 'mahesh.reddy@university.edu', 'CHEM002', '+91-9876543241', 'male', 'Associate Professor', 'Chemistry', 'faculty'),

-- Faculty - Biology
('550e8400-e29b-41d4-a716-446655440033', 'Dr. Anjali Nair', 'anjali.nair@university.edu', 'BIO001', '+91-9876543242', 'female', 'Professor', 'Biology', 'faculty'),
('550e8400-e29b-41d4-a716-446655440034', 'Prof. Srikant Das', 'srikant.das@university.edu', 'BIO002', '+91-9876543243', 'male', 'Associate Professor', 'Biology', 'faculty'),

-- Faculty - Economics
('550e8400-e29b-41d4-a716-446655440035', 'Dr. Priya Menon', 'priya.menon@university.edu', 'ECO001', '+91-9876543244', 'female', 'Professor', 'Economics', 'faculty'),
('550e8400-e29b-41d4-a716-446655440036', 'Prof. Rajiv Kapoor', 'rajiv.kapoor@university.edu', 'ECO002', '+91-9876543245', 'male', 'Associate Professor', 'Economics', 'faculty'),

-- Faculty - English
('550e8400-e29b-41d4-a716-446655440037', 'Dr. Meera Patel', 'meera.patel@university.edu', 'ENG001', '+91-9876543246', 'female', 'Professor', 'English', 'faculty'),
('550e8400-e29b-41d4-a716-446655440038', 'Prof. Arun Sharma', 'arun.sharma@university.edu', 'ENG002', '+91-9876543247', 'male', 'Associate Professor', 'English', 'faculty'),

-- Faculty - History
('550e8400-e29b-41d4-a716-446655440039', 'Dr. Kavita Rao', 'kavita.rao@university.edu', 'HIST001', '+91-9876543248', 'female', 'Professor', 'History', 'faculty'),
('550e8400-e29b-41d4-a716-446655440040', 'Prof. Suresh Iyer', 'suresh.iyer@university.edu', 'HIST002', '+91-9876543249', 'male', 'Associate Professor', 'History', 'faculty');

-- Note: All users have password 'password123' for testing purposes
-- You can log in with any email and password 'password123' 