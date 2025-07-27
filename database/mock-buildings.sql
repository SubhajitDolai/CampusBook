-- Mock data for buildings table
-- This file contains sample building data for testing the CampusBook system

INSERT INTO buildings (id, name, code, description, is_active, created_at) VALUES
-- Main Campus Buildings
('550e8400-e29b-41d4-a716-446655440101', 'Main Academic Building', 'MAB', 'Primary academic building with lecture halls, classrooms, and faculty offices. Houses the main administrative offices and student services.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440102', 'Engineering Complex', 'EC', 'Modern engineering facility with state-of-the-art laboratories, workshops, and research centers for all engineering departments.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440103', 'Science Center', 'SC', 'Advanced science laboratories and research facilities for physics, chemistry, biology, and mathematics departments.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440104', 'Library Building', 'LB', 'Central library with extensive collection, study spaces, computer labs, and research facilities.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440105', 'Student Center', 'STC', 'Student union building with cafeteria, recreation facilities, meeting rooms, and student organization offices.', true, NOW()),

-- Academic Buildings
('550e8400-e29b-41d4-a716-446655440106', 'Computer Science Block', 'CSB', 'Dedicated building for computer science department with programming labs, server rooms, and research facilities.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440107', 'Mechanical Engineering Block', 'MEB', 'Specialized facility for mechanical engineering with workshops, testing labs, and design studios.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440108', 'Electrical Engineering Block', 'EEB', 'Advanced electrical engineering facility with power labs, electronics workshops, and research centers.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440109', 'Civil Engineering Block', 'CEB', 'Civil engineering facility with structural testing labs, surveying equipment, and construction workshops.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440110', 'Chemical Engineering Block', 'CHEB', 'Chemical engineering facility with process labs, safety equipment, and research laboratories.', true, NOW()),

-- Research and Specialized Buildings
('550e8400-e29b-41d4-a716-446655440111', 'Research Center', 'RC', 'Advanced research facility with specialized laboratories, equipment, and collaborative spaces for interdisciplinary research.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440112', 'Innovation Hub', 'IH', 'Startup incubator and innovation center with co-working spaces, meeting rooms, and technology transfer offices.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440113', 'Conference Center', 'CC', 'Modern conference facility with auditoriums, meeting rooms, and presentation equipment for academic events.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440114', 'Sports Complex', 'SPC', 'Athletic facility with gymnasium, swimming pool, fitness center, and outdoor sports facilities.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440115', 'Health Center', 'HC', 'Student health services building with medical facilities, counseling offices, and wellness programs.', true, NOW()),

-- Administrative Buildings
('550e8400-e29b-41d4-a716-446655440116', 'Administration Block', 'AB', 'Main administrative offices including registrar, finance, human resources, and executive offices.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440117', 'Admissions Office', 'AO', 'Student admissions and enrollment services with counseling offices and application processing.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440118', 'International Affairs', 'IA', 'International student services, study abroad programs, and global partnerships office.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440119', 'Career Services', 'CRS', 'Career counseling, job placement services, and professional development programs.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440120', 'IT Services', 'ITS', 'Information technology services, computer support, and network infrastructure management.', true, NOW()),

-- Residential Buildings
('550e8400-e29b-41d4-a716-446655440121', 'Student Hostel A', 'SHA', 'Undergraduate student housing with dormitory rooms, common areas, and dining facilities.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440122', 'Student Hostel B', 'SHB', 'Graduate student housing with apartment-style accommodations and study spaces.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440123', 'Faculty Housing', 'FH', 'Residential accommodation for faculty and staff with family units and community facilities.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440124', 'Guest House', 'GH', 'Guest accommodation for visiting scholars, conference attendees, and university guests.', true, NOW()),

-- Support Buildings
('550e8400-e29b-41d4-a716-446655440125', 'Maintenance Building', 'MB', 'Facilities management, maintenance workshops, and utility services.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440126', 'Security Office', 'SO', 'Campus security headquarters with monitoring systems and emergency response facilities.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440127', 'Parking Complex', 'PC', 'Multi-level parking facility with vehicle registration and traffic management.', true, NOW()),
('550e8400-e29b-41d4-a716-446655440128', 'Power Station', 'PS', 'Electrical substation and power distribution center for campus utilities.', true, NOW()),

-- Legacy Buildings (Inactive)
('550e8400-e29b-41d4-a716-446655440129', 'Old Administration Block', 'OAB', 'Former administrative building, currently under renovation and not in use.', false, NOW()),
('550e8400-e29b-41d4-a716-446655440130', 'Legacy Science Lab', 'LSL', 'Old science laboratory building, scheduled for demolition and replacement.', false, NOW()); 