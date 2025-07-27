-- Mock data for resources table
-- This file contains sample resource data for testing the CampusBook system

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active, created_at) VALUES
-- Main Academic Building Resources
('550e8400-e29b-41d4-a716-446655440301', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440201', 'Room 101', 'classroom', 40, 'General purpose classroom with projector', 'Projector, Whiteboard, Audio System', true, NOW()),
('550e8400-e29b-41d4-a716-446655440302', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440201', 'Room 102', 'classroom', 35, 'Standard classroom setup', 'Whiteboard, Audio System', true, NOW()),
('550e8400-e29b-41d4-a716-446655440303', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440201', 'Room 103', 'classroom', 30, 'Small classroom for tutorials', 'Whiteboard', true, NOW()),
('550e8400-e29b-41d4-a716-446655440304', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440202', 'Room 201', 'classroom', 45, 'Large classroom with smart board', 'Smart Board, Projector, Audio System', true, NOW()),
('550e8400-e29b-41d4-a716-446655440305', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440202', 'Room 202', 'classroom', 40, 'Computer lab classroom', 'Computers, Projector, Whiteboard', true, NOW()),
('550e8400-e29b-41d4-a716-446655440306', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440203', 'Room 301', 'classroom', 50, 'Lecture hall style classroom', 'Projector, Audio System, Microphone', true, NOW()),
('550e8400-e29b-41d4-a716-446655440307', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440203', 'Room 302', 'classroom', 35, 'Standard classroom', 'Whiteboard, Audio System', true, NOW()),
('550e8400-e29b-41d4-a716-446655440308', '550e8400-e29b-41d4-a716-446655440101', '550e8400-e29b-41d4-a716-446655440204', 'Room 401', 'classroom', 40, 'Advanced classroom with video conferencing', 'Video Conferencing, Projector, Audio System', true, NOW()),

-- Engineering Complex Resources
('550e8400-e29b-41d4-a716-446655440309', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440205', 'Computer Lab 101', 'lab', 25, 'Computer lab with engineering software', 'Computers, Engineering Software, Projector', true, NOW()),
('550e8400-e29b-41d4-a716-446655440310', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440205', 'Electronics Lab 102', 'lab', 20, 'Electronics and circuit design lab', 'Oscilloscopes, Multimeters, Breadboards', true, NOW()),
('550e8400-e29b-41d4-a716-446655440311', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440206', 'Mechanical Lab 201', 'lab', 15, 'Mechanical engineering workshop', 'Lathes, Milling Machines, 3D Printers', true, NOW()),
('550e8400-e29b-41d4-a716-446655440312', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440206', 'Robotics Lab 202', 'lab', 18, 'Robotics and automation lab', 'Robots, Sensors, Control Systems', true, NOW()),
('550e8400-e29b-41d4-a716-446655440313', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440207', 'CAD Lab 301', 'lab', 30, 'Computer-aided design lab', 'CAD Software, 3D Modeling Tools', true, NOW()),
('550e8400-e29b-41d4-a716-446655440314', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440207', 'Fluid Mechanics Lab 302', 'lab', 12, 'Fluid mechanics and hydraulics lab', 'Flow Meters, Pumps, Pressure Sensors', true, NOW()),
('550e8400-e29b-41d4-a716-446655440315', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440208', 'Thermal Lab 401', 'lab', 10, 'Thermal engineering lab', 'Heat Exchangers, Temperature Sensors', true, NOW()),
('550e8400-e29b-41d4-a716-446655440316', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440208', 'Materials Lab 402', 'lab', 15, 'Materials testing lab', 'Universal Testing Machine, Microscopes', true, NOW()),
('550e8400-e29b-41d4-a716-446655440317', '550e8400-e29b-41d4-a716-446655440102', '550e8400-e29b-41d4-a716-446655440209', 'Control Systems Lab 501', 'lab', 20, 'Control systems and automation lab', 'PLC Systems, SCADA, Control Panels', true, NOW()),

-- Science Center Resources
('550e8400-e29b-41d4-a716-446655440318', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440210', 'Physics Lab 101', 'lab', 25, 'General physics laboratory', 'Oscilloscopes, Spectrometers, Lasers', true, NOW()),
('550e8400-e29b-41d4-a716-446655440319', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440210', 'Chemistry Lab 102', 'lab', 20, 'General chemistry laboratory', 'Bunsen Burners, Test Tubes, Chemicals', true, NOW()),
('550e8400-e29b-41d4-a716-446655440320', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440211', 'Biology Lab 201', 'lab', 18, 'Biology and microbiology lab', 'Microscopes, Incubators, Petri Dishes', true, NOW()),
('550e8400-e29b-41d4-a716-446655440321', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440211', 'Organic Chemistry Lab 202', 'lab', 15, 'Advanced organic chemistry lab', 'HPLC, NMR, Mass Spectrometer', true, NOW()),
('550e8400-e29b-41d4-a716-446655440322', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440212', 'Analytical Chemistry Lab 301', 'lab', 12, 'Analytical chemistry laboratory', 'Spectrophotometers, Chromatographs', true, NOW()),
('550e8400-e29b-41d4-a716-446655440323', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440212', 'Biochemistry Lab 302', 'lab', 16, 'Biochemistry and molecular biology lab', 'PCR Machines, Gel Electrophoresis', true, NOW()),
('550e8400-e29b-41d4-a716-446655440324', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440213', 'Quantum Physics Lab 401', 'lab', 8, 'Advanced quantum physics lab', 'Lasers, Interferometers, Quantum Sensors', true, NOW()),
('550e8400-e29b-41d4-a716-446655440325', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440213', 'Nanotechnology Lab 402', 'lab', 10, 'Nanotechnology research lab', 'AFM, SEM, Clean Room Equipment', true, NOW()),
('550e8400-e29b-41d4-a716-446655440326', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440214', 'Genetics Lab 501', 'lab', 14, 'Genetics and genomics lab', 'DNA Sequencers, PCR Machines', true, NOW()),
('550e8400-e29b-41d4-a716-446655440327', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440214', 'Ecology Lab 502', 'lab', 12, 'Ecology and environmental science lab', 'Field Equipment, Data Loggers', true, NOW()),
('550e8400-e29b-41d4-a716-446655440328', '550e8400-e29b-41d4-a716-446655440103', '550e8400-e29b-41d4-a716-446655440215', 'Astronomy Lab 601', 'lab', 6, 'Astronomy and astrophysics lab', 'Telescopes, Spectrometers, CCD Cameras', true, NOW()),

-- Library Building Resources
('550e8400-e29b-41d4-a716-446655440329', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440216', 'Study Room 101', 'classroom', 8, 'Quiet study room', 'Tables, Chairs, Whiteboard', true, NOW()),
('550e8400-e29b-41d4-a716-446655440330', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440216', 'Study Room 102', 'classroom', 6, 'Small study room', 'Tables, Chairs', true, NOW()),
('550e8400-e29b-41d4-a716-446655440331', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440216', 'Computer Lab 103', 'lab', 20, 'Library computer lab', 'Computers, Printers, Scanners', true, NOW()),
('550e8400-e29b-41d4-a716-446655440332', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440217', 'Group Study Room 201', 'classroom', 12, 'Group study and discussion room', 'Tables, Chairs, Whiteboard, Projector', true, NOW()),
('550e8400-e29b-41d4-a716-446655440333', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440217', 'Study Room 202', 'classroom', 10, 'Medium study room', 'Tables, Chairs, Whiteboard', true, NOW()),
('550e8400-e29b-41d4-a716-446655440334', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440218', 'Conference Room 301', 'hall', 30, 'Library conference room', 'Projector, Audio System, Video Conferencing', true, NOW()),
('550e8400-e29b-41d4-a716-446655440335', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440218', 'Study Room 302', 'classroom', 8, 'Quiet study room', 'Tables, Chairs', true, NOW()),
('550e8400-e29b-41d4-a716-446655440336', '550e8400-e29b-41d4-a716-446655440104', '550e8400-e29b-41d4-a716-446655440219', 'Seminar Room 401', 'hall', 40, 'Library seminar room', 'Projector, Audio System, Podium', true, NOW()),

-- Student Center Resources
('550e8400-e29b-41d4-a716-446655440337', '550e8400-e29b-41d4-a716-446655440105', '550e8400-e29b-41d4-a716-446655440220', 'Meeting Room 101', 'hall', 25, 'Student organization meeting room', 'Tables, Chairs, Whiteboard', true, NOW()),
('550e8400-e29b-41d4-a716-446655440338', '550e8400-e29b-41d4-a716-446655440105', '550e8400-e29b-41d4-a716-446655440220', 'Activity Room 102', 'hall', 50, 'Student activity and event room', 'Audio System, Lighting, Stage', true, NOW()),
('550e8400-e29b-41d4-a716-446655440339', '550e8400-e29b-41d4-a716-446655440105', '550e8400-e29b-41d4-a716-446655440221', 'Conference Room 201', 'hall', 35, 'Student conference room', 'Projector, Audio System, Video Conferencing', true, NOW()),
('550e8400-e29b-41d4-a716-446655440340', '550e8400-e29b-41d4-a716-446655440105', '550e8400-e29b-41d4-a716-446655440221', 'Study Lounge 202', 'classroom', 20, 'Relaxed study environment', 'Comfortable Seating, Tables', true, NOW()),
('550e8400-e29b-41d4-a716-446655440341', '550e8400-e29b-41d4-a716-446655440105', '550e8400-e29b-41d4-a716-446655440222', 'Event Hall 301', 'hall', 200, 'Large event and performance hall', 'Stage, Lighting, Sound System, Projector', true, NOW()),

-- Computer Science Block Resources
('550e8400-e29b-41d4-a716-446655440342', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440223', 'Programming Lab 101', 'lab', 30, 'Computer programming laboratory', 'Computers, Development Software, Servers', true, NOW()),
('550e8400-e29b-41d4-a716-446655440343', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440223', 'Data Science Lab 102', 'lab', 25, 'Data science and analytics lab', 'Computers, Statistical Software, Big Data Tools', true, NOW()),
('550e8400-e29b-41d4-a716-446655440344', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440224', 'AI/ML Lab 201', 'lab', 20, 'Artificial intelligence and machine learning lab', 'GPUs, AI Frameworks, Neural Network Tools', true, NOW()),
('550e8400-e29b-41d4-a716-446655440345', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440224', 'Cybersecurity Lab 202', 'lab', 18, 'Cybersecurity and network security lab', 'Penetration Testing Tools, Network Equipment', true, NOW()),
('550e8400-e29b-41d4-a716-446655440346', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440225', 'Software Engineering Lab 301', 'lab', 25, 'Software development and testing lab', 'Development Tools, Testing Frameworks, CI/CD', true, NOW()),
('550e8400-e29b-41d4-a716-446655440347', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440225', 'Database Lab 302', 'lab', 20, 'Database and information systems lab', 'Database Servers, Query Tools, Data Modeling', true, NOW()),
('550e8400-e29b-41d4-a716-446655440348', '550e8400-e29b-41d4-a716-446655440106', '550e8400-e29b-41d4-a716-446655440226', 'Cloud Computing Lab 401', 'lab', 15, 'Cloud computing and distributed systems lab', 'Cloud Platforms, Virtualization Tools, Containers', true, NOW()),

-- Conference Center Resources
('550e8400-e29b-41d4-a716-446655440349', '550e8400-e29b-41d4-a716-446655440113', '550e8400-e29b-41d4-a716-446655440247', 'Main Auditorium', 'auditorium', 500, 'Large conference auditorium', 'Stage, Sound System, Projector, Lighting', true, NOW()),
('550e8400-e29b-41d4-a716-446655440350', '550e8400-e29b-41d4-a716-446655440113', '550e8400-e29b-41d4-a716-446655440247', 'Seminar Room A', 'hall', 100, 'Medium seminar room', 'Projector, Audio System, Podium', true, NOW()),
('550e8400-e29b-41d4-a716-446655440351', '550e8400-e29b-41d4-a716-446655440113', '550e8400-e29b-41d4-a716-446655440247', 'Seminar Room B', 'hall', 80, 'Medium seminar room', 'Projector, Audio System, Podium', true, NOW()),
('550e8400-e29b-41d4-a716-446655440352', '550e8400-e29b-41d4-a716-446655440113', '550e8400-e29b-41d4-a716-446655440248', 'Meeting Room 201', 'hall', 50, 'Small conference meeting room', 'Projector, Audio System, Video Conferencing', true, NOW()),
('550e8400-e29b-41d4-a716-446655440353', '550e8400-e29b-41d4-a716-446655440113', '550e8400-e29b-41d4-a716-446655440248', 'Meeting Room 202', 'hall', 40, 'Small conference meeting room', 'Projector, Audio System, Video Conferencing', true, NOW()),

-- Legacy Resources (Inactive)
('550e8400-e29b-41d4-a716-446655440354', '550e8400-e29b-41d4-a716-446655440129', '550e8400-e29b-41d4-a716-446655440283', 'Old Lab 101', 'lab', 15, 'Legacy laboratory equipment', 'Outdated Equipment', false, NOW()),
('550e8400-e29b-41d4-a716-446655440355', '550e8400-e29b-41d4-a716-446655440130', '550e8400-e29b-41d4-a716-446655440284', 'Old Classroom 201', 'classroom', 30, 'Legacy classroom', 'Basic Equipment', false, NOW()); 