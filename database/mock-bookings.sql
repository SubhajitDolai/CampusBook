-- Mock data for bookings table
-- This file contains sample booking data for testing the CampusBook system

INSERT INTO bookings (id, resource_id, user_id, start_date, end_date, start_time, end_time, reason, recurring, status, approved_by, approved_at, created_at) VALUES
-- Pending Bookings
('660e8400-e29b-41d4-a716-446655440401', '550e8400-e29b-41d4-a716-446655440301', '550e8400-e29b-41d4-a716-446655440001', '2024-01-15', '2024-01-15', '09:00:00', '11:00:00', 'Computer Science Lecture - Introduction to Programming', false, 'pending', NULL, NULL, NOW()),
('660e8400-e29b-41d4-a716-446655440402', '550e8400-e29b-41d4-a716-446655440302', '550e8400-e29b-41d4-a716-446655440002', '2024-01-16', '2024-01-16', '14:00:00', '16:00:00', 'Mathematics Tutorial - Calculus I', false, 'pending', NULL, NULL, NOW()),
('660e8400-e29b-41d4-a716-446655440403', '550e8400-e29b-41d4-a716-446655440309', '550e8400-e29b-41d4-a716-446655440003', '2024-01-17', '2024-01-17', '10:00:00', '12:00:00', 'Engineering Lab Session - Circuit Design', false, 'pending', NULL, NULL, NOW()),
('660e8400-e29b-41d4-a716-446655440404', '550e8400-e29b-41d4-a716-446655440318', '550e8400-e29b-41d4-a716-446655440004', '2024-01-18', '2024-01-18', '13:00:00', '15:00:00', 'Physics Lab - Mechanics Experiments', false, 'pending', NULL, NULL, NOW()),
('660e8400-e29b-41d4-a716-446655440405', '550e8400-e29b-41d4-a716-446655440329', '550e8400-e29b-41d4-a716-446655440005', '2024-01-19', '2024-01-19', '15:00:00', '17:00:00', 'Study Group - Advanced Algorithms', false, 'pending', NULL, NULL, NOW()),

-- Approved Bookings
('660e8400-e29b-41d4-a716-446655440406', '550e8400-e29b-41d4-a716-446655440304', '550e8400-e29b-41d4-a716-446655440006', '2024-01-20', '2024-01-20', '08:00:00', '10:00:00', 'Faculty Meeting - Department Planning', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '2 days', NOW() - INTERVAL '3 days'),
('660e8400-e29b-41d4-a716-446655440407', '550e8400-e29b-41d4-a716-446655440311', '550e8400-e29b-41d4-a716-446655440007', '2024-01-21', '2024-01-21', '11:00:00', '13:00:00', 'Mechanical Engineering Workshop', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '1 day', NOW() - INTERVAL '2 days'),
('660e8400-e29b-41d4-a716-446655440408', '550e8400-e29b-41d4-a716-446655440320', '550e8400-e29b-41d4-a716-446655440008', '2024-01-22', '2024-01-22', '14:00:00', '16:00:00', 'Biology Research - Cell Culture', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '12 hours', NOW() - INTERVAL '1 day'),
('660e8400-e29b-41d4-a716-446655440409', '550e8400-e29b-41d4-a716-446655440334', '550e8400-e29b-41d4-a716-446655440009', '2024-01-23', '2024-01-23', '16:00:00', '18:00:00', 'Academic Conference - Research Presentation', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '6 hours', NOW() - INTERVAL '12 hours'),
('660e8400-e29b-41d4-a716-446655440410', '550e8400-e29b-41d4-a716-446655440342', '550e8400-e29b-41d4-a716-446655440010', '2024-01-24', '2024-01-24', '09:00:00', '11:00:00', 'Programming Competition Practice', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '3 hours', NOW() - INTERVAL '6 hours'),

-- Rejected Bookings
('660e8400-e29b-41d4-a716-446655440411', '550e8400-e29b-41d4-a716-446655440305', '550e8400-e29b-41d4-a716-446655440011', '2024-01-25', '2024-01-25', '10:00:00', '12:00:00', 'Personal Project - Not academic related', false, 'rejected', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '1 day', NOW() - INTERVAL '2 days'),
('660e8400-e29b-41d4-a716-446655440412', '550e8400-e29b-41d4-a716-446655440312', '550e8400-e29b-41d4-a716-446655440012', '2024-01-26', '2024-01-26', '15:00:00', '17:00:00', 'Social Event - Not permitted in lab', false, 'rejected', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '12 hours', NOW() - INTERVAL '1 day'),
('660e8400-e29b-41d4-a716-446655440413', '550e8400-e29b-41d4-a716-446655440321', '550e8400-e29b-41d4-a716-446655440013', '2024-01-27', '2024-01-27', '13:00:00', '15:00:00', 'Commercial Use - Violates policy', false, 'rejected', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '6 hours', NOW() - INTERVAL '12 hours'),

-- Cancelled Bookings
('660e8400-e29b-41d4-a716-446655440414', '550e8400-e29b-41d4-a716-446655440306', '550e8400-e29b-41d4-a716-446655440014', '2024-01-28', '2024-01-28', '09:00:00', '11:00:00', 'Lecture Hall Booking - Event cancelled', false, 'cancelled', NULL, NULL, NOW() - INTERVAL '2 days'),
('660e8400-e29b-41d4-a716-446655440415', '550e8400-e29b-41d4-a716-446655440313', '550e8400-e29b-41d4-a716-446655440015', '2024-01-29', '2024-01-29', '14:00:00', '16:00:00', 'CAD Lab Session - Instructor unavailable', false, 'cancelled', NULL, NULL, NOW() - INTERVAL '1 day'),

-- Recurring Bookings
('660e8400-e29b-41d4-a716-446655440416', '550e8400-e29b-41d4-a716-446655440303', '550e8400-e29b-41d4-a716-446655440016', '2024-01-30', '2024-02-27', '10:00:00', '12:00:00', 'Weekly Tutorial - Data Structures', true, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '3 days', NOW() - INTERVAL '4 days'),
('660e8400-e29b-41d4-a716-446655440417', '550e8400-e29b-41d4-a716-446655440310', '550e8400-e29b-41d4-a716-446655440017', '2024-02-01', '2024-02-29', '13:00:00', '15:00:00', 'Bi-weekly Lab - Electronics Design', true, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '2 days', NOW() - INTERVAL '3 days'),
('660e8400-e29b-41d4-a716-446655440418', '550e8400-e29b-41d4-a716-446655440319', '550e8400-e29b-41d4-a716-446655440018', '2024-02-02', '2024-02-28', '15:00:00', '17:00:00', 'Monthly Seminar - Chemistry Research', true, 'pending', NULL, NULL, NOW() - INTERVAL '1 day'),

-- Long-term Bookings
('660e8400-e29b-41d4-a716-446655440419', '550e8400-e29b-41d4-a716-446655440324', '550e8400-e29b-41d4-a716-446655440019', '2024-02-05', '2024-02-07', '09:00:00', '17:00:00', 'Research Project - Quantum Physics Experiments', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '1 day', NOW() - INTERVAL '2 days'),
('660e8400-e29b-41d4-a716-446655440420', '550e8400-e29b-41d4-a716-446655440325', '550e8400-e29b-41d4-a716-446655440020', '2024-02-10', '2024-02-12', '08:00:00', '18:00:00', 'Advanced Research - Nanotechnology', false, 'pending', NULL, NULL, NOW() - INTERVAL '6 hours'),

-- Evening Bookings
('660e8400-e29b-41d4-a716-446655440421', '550e8400-e29b-41d4-a716-446655440332', '550e8400-e29b-41d4-a716-446655440021', '2024-02-15', '2024-02-15', '18:00:00', '20:00:00', 'Evening Study Group - Advanced Mathematics', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '3 hours', NOW() - INTERVAL '6 hours'),
('660e8400-e29b-41d4-a716-446655440422', '550e8400-e29b-41d4-a716-446655440338', '550e8400-e29b-41d4-a716-446655440022', '2024-02-16', '2024-02-16', '19:00:00', '21:00:00', 'Student Organization Meeting', false, 'pending', NULL, NULL, NOW() - INTERVAL '2 hours'),

-- Weekend Bookings
('660e8400-e29b-41d4-a716-446655440423', '550e8400-e29b-41d4-a716-446655440344', '550e8400-e29b-41d4-a716-446655440023', '2024-02-17', '2024-02-17', '10:00:00', '16:00:00', 'Weekend Workshop - AI/ML Training', false, 'approved', '550e8400-e29b-41d4-a716-446655440101', NOW() - INTERVAL '1 hour', NOW() - INTERVAL '3 hours'),
('660e8400-e29b-41d4-a716-446655440424', '550e8400-e29b-41d4-a716-446655440349', '550e8400-e29b-41d4-a716-446655440024', '2024-02-18', '2024-02-18', '14:00:00', '18:00:00', 'Sunday Conference - Academic Symposium', false, 'pending', NULL, NULL, NOW() - INTERVAL '30 minutes'),

-- Recent Bookings (for testing real-time updates)
('660e8400-e29b-41d4-a716-446655440425', '550e8400-e29b-41d4-a716-446655440346', '550e8400-e29b-41d4-a716-446655440025', '2024-02-20', '2024-02-20', '09:00:00', '11:00:00', 'Software Engineering Project Demo', false, 'pending', NULL, NULL, NOW() - INTERVAL '15 minutes'),
('660e8400-e29b-41d4-a716-446655440426', '550e8400-e29b-41d4-a716-446655440347', '550e8400-e29b-41d4-a716-446655440026', '2024-02-21', '2024-02-21', '13:00:00', '15:00:00', 'Database Management Workshop', false, 'pending', NULL, NULL, NOW() - INTERVAL '5 minutes'); 