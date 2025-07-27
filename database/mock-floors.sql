-- Mock data for floors table
-- This file contains sample floor data for testing the CampusBook system

INSERT INTO floors (id, building_id, floor_number, name, is_active, created_at) VALUES
-- Main Academic Building Floors
('550e8400-e29b-41d4-a716-446655440201', '550e8400-e29b-41d4-a716-446655440101', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440202', '550e8400-e29b-41d4-a716-446655440101', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440203', '550e8400-e29b-41d4-a716-446655440101', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440204', '550e8400-e29b-41d4-a716-446655440101', 4, 'Third Floor', true, NOW()),

-- Engineering Complex Floors
('550e8400-e29b-41d4-a716-446655440205', '550e8400-e29b-41d4-a716-446655440102', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440206', '550e8400-e29b-41d4-a716-446655440102', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440207', '550e8400-e29b-41d4-a716-446655440102', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440208', '550e8400-e29b-41d4-a716-446655440102', 4, 'Third Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440209', '550e8400-e29b-41d4-a716-446655440102', 5, 'Fourth Floor', true, NOW()),

-- Science Center Floors
('550e8400-e29b-41d4-a716-446655440210', '550e8400-e29b-41d4-a716-446655440103', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440211', '550e8400-e29b-41d4-a716-446655440103', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440212', '550e8400-e29b-41d4-a716-446655440103', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440213', '550e8400-e29b-41d4-a716-446655440103', 4, 'Third Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440214', '550e8400-e29b-41d4-a716-446655440103', 5, 'Fourth Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440215', '550e8400-e29b-41d4-a716-446655440103', 6, 'Fifth Floor', true, NOW()),

-- Library Building Floors
('550e8400-e29b-41d4-a716-446655440216', '550e8400-e29b-41d4-a716-446655440104', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440217', '550e8400-e29b-41d4-a716-446655440104', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440218', '550e8400-e29b-41d4-a716-446655440104', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440219', '550e8400-e29b-41d4-a716-446655440104', 4, 'Third Floor', true, NOW()),

-- Student Center Floors
('550e8400-e29b-41d4-a716-446655440220', '550e8400-e29b-41d4-a716-446655440105', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440221', '550e8400-e29b-41d4-a716-446655440105', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440222', '550e8400-e29b-41d4-a716-446655440105', 3, 'Second Floor', true, NOW()),

-- Computer Science Block Floors
('550e8400-e29b-41d4-a716-446655440223', '550e8400-e29b-41d4-a716-446655440106', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440224', '550e8400-e29b-41d4-a716-446655440106', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440225', '550e8400-e29b-41d4-a716-446655440106', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440226', '550e8400-e29b-41d4-a716-446655440106', 4, 'Third Floor', true, NOW()),

-- Mechanical Engineering Block Floors
('550e8400-e29b-41d4-a716-446655440227', '550e8400-e29b-41d4-a716-446655440107', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440228', '550e8400-e29b-41d4-a716-446655440107', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440229', '550e8400-e29b-41d4-a716-446655440107', 3, 'Second Floor', true, NOW()),

-- Electrical Engineering Block Floors
('550e8400-e29b-41d4-a716-446655440230', '550e8400-e29b-41d4-a716-446655440108', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440231', '550e8400-e29b-41d4-a716-446655440108', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440232', '550e8400-e29b-41d4-a716-446655440108', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440233', '550e8400-e29b-41d4-a716-446655440108', 4, 'Third Floor', true, NOW()),

-- Civil Engineering Block Floors
('550e8400-e29b-41d4-a716-446655440234', '550e8400-e29b-41d4-a716-446655440109', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440235', '550e8400-e29b-41d4-a716-446655440109', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440236', '550e8400-e29b-41d4-a716-446655440109', 3, 'Second Floor', true, NOW()),

-- Chemical Engineering Block Floors
('550e8400-e29b-41d4-a716-446655440237', '550e8400-e29b-41d4-a716-446655440110', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440238', '550e8400-e29b-41d4-a716-446655440110', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440239', '550e8400-e29b-41d4-a716-446655440110', 3, 'Second Floor', true, NOW()),

-- Research Center Floors
('550e8400-e29b-41d4-a716-446655440240', '550e8400-e29b-41d4-a716-446655440111', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440241', '550e8400-e29b-41d4-a716-446655440111', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440242', '550e8400-e29b-41d4-a716-446655440111', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440243', '550e8400-e29b-41d4-a716-446655440111', 4, 'Third Floor', true, NOW()),

-- Innovation Hub Floors
('550e8400-e29b-41d4-a716-446655440244', '550e8400-e29b-41d4-a716-446655440112', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440245', '550e8400-e29b-41d4-a716-446655440112', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440246', '550e8400-e29b-41d4-a716-446655440112', 3, 'Second Floor', true, NOW()),

-- Conference Center Floors
('550e8400-e29b-41d4-a716-446655440247', '550e8400-e29b-41d4-a716-446655440113', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440248', '550e8400-e29b-41d4-a716-446655440113', 2, 'First Floor', true, NOW()),

-- Sports Complex Floors
('550e8400-e29b-41d4-a716-446655440249', '550e8400-e29b-41d4-a716-446655440114', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440250', '550e8400-e29b-41d4-a716-446655440114', 2, 'First Floor', true, NOW()),

-- Health Center Floors
('550e8400-e29b-41d4-a716-446655440251', '550e8400-e29b-41d4-a716-446655440115', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440252', '550e8400-e29b-41d4-a716-446655440115', 2, 'First Floor', true, NOW()),

-- Administration Block Floors
('550e8400-e29b-41d4-a716-446655440253', '550e8400-e29b-41d4-a716-446655440116', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440254', '550e8400-e29b-41d4-a716-446655440116', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440255', '550e8400-e29b-41d4-a716-446655440116', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440256', '550e8400-e29b-41d4-a716-446655440116', 4, 'Third Floor', true, NOW()),

-- Admissions Office Floors
('550e8400-e29b-41d4-a716-446655440257', '550e8400-e29b-41d4-a716-446655440117', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440258', '550e8400-e29b-41d4-a716-446655440117', 2, 'First Floor', true, NOW()),

-- International Affairs Floors
('550e8400-e29b-41d4-a716-446655440259', '550e8400-e29b-41d4-a716-446655440118', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440260', '550e8400-e29b-41d4-a716-446655440118', 2, 'First Floor', true, NOW()),

-- Career Services Floors
('550e8400-e29b-41d4-a716-446655440261', '550e8400-e29b-41d4-a716-446655440119', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440262', '550e8400-e29b-41d4-a716-446655440119', 2, 'First Floor', true, NOW()),

-- IT Services Floors
('550e8400-e29b-41d4-a716-446655440263', '550e8400-e29b-41d4-a716-446655440120', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440264', '550e8400-e29b-41d4-a716-446655440120', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440265', '550e8400-e29b-41d4-a716-446655440120', 3, 'Second Floor', true, NOW()),

-- Student Hostel A Floors
('550e8400-e29b-41d4-a716-446655440266', '550e8400-e29b-41d4-a716-446655440121', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440267', '550e8400-e29b-41d4-a716-446655440121', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440268', '550e8400-e29b-41d4-a716-446655440121', 3, 'Second Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440269', '550e8400-e29b-41d4-a716-446655440121', 4, 'Third Floor', true, NOW()),

-- Student Hostel B Floors
('550e8400-e29b-41d4-a716-446655440270', '550e8400-e29b-41d4-a716-446655440122', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440271', '550e8400-e29b-41d4-a716-446655440122', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440272', '550e8400-e29b-41d4-a716-446655440122', 3, 'Second Floor', true, NOW()),

-- Faculty Housing Floors
('550e8400-e29b-41d4-a716-446655440273', '550e8400-e29b-41d4-a716-446655440123', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440274', '550e8400-e29b-41d4-a716-446655440123', 2, 'First Floor', true, NOW()),

-- Guest House Floors
('550e8400-e29b-41d4-a716-446655440275', '550e8400-e29b-41d4-a716-446655440124', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440276', '550e8400-e29b-41d4-a716-446655440124', 2, 'First Floor', true, NOW()),

-- Maintenance Building Floors
('550e8400-e29b-41d4-a716-446655440277', '550e8400-e29b-41d4-a716-446655440125', 1, 'Ground Floor', true, NOW()),

-- Security Office Floors
('550e8400-e29b-41d4-a716-446655440278', '550e8400-e29b-41d4-a716-446655440126', 1, 'Ground Floor', true, NOW()),

-- Parking Complex Floors
('550e8400-e29b-41d4-a716-446655440279', '550e8400-e29b-41d4-a716-446655440127', 1, 'Ground Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440280', '550e8400-e29b-41d4-a716-446655440127', 2, 'First Floor', true, NOW()),
('550e8400-e29b-41d4-a716-446655440281', '550e8400-e29b-41d4-a716-446655440127', 3, 'Second Floor', true, NOW()),

-- Power Station Floors
('550e8400-e29b-41d4-a716-446655440282', '550e8400-e29b-41d4-a716-446655440128', 1, 'Ground Floor', true, NOW()),

-- Legacy Buildings (Inactive)
('550e8400-e29b-41d4-a716-446655440283', '550e8400-e29b-41d4-a716-446655440129', 1, 'Ground Floor', false, NOW()),
('550e8400-e29b-41d4-a716-446655440284', '550e8400-e29b-41d4-a716-446655440130', 1, 'Ground Floor', false, NOW()); 