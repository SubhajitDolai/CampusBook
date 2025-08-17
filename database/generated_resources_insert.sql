-- Generated SQL for inserting resources from MITWPU Infrastructure Data
-- Run this script against your database

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fe92c2d6-9cad-404c-9656-c55b98280009',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = -1),
    'AT- B001',
    'others'::resource_type,
    2,
    'BOOK RACK HALL - Central Library',
    'Benches: 0, Chairs: 5, Stools: 5, CCTV: 10, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1347a765-3b54-4df8-b751-6a7318911286',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = -1),
    'AT- B003',
    'lab'::resource_type,
    19,
    'PHOTOGRAPHY LAB - School of Liberal Arts - Department of Photography',
    'Benches: 14, Chairs: 18, Stools: 1, Computers: 18',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0f6f9e46-b9d4-4992-861a-4d17c30a99dd',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 001',
    'others'::resource_type,
    4,
    'BOOK ISSUE COUNTER / OPEN SPACE - Central Library',
    'Benches: 0, Chairs: 4, CCTV: 9, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c7fa5da7-8daf-4db4-bca3-2c822f6c0c95',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 003',
    'others'::resource_type,
    67,
    'DIGITAL LIBRARY - Central Library',
    'Benches: 14, Chairs: 67, CCTV: 2, Computers: 50',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dd65b52a-d595-4630-b165-3cff4a95b93b',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 004',
    'others'::resource_type,
    28,
    'CONFERENCE ROOM - Central Library',
    'Benches: 0, Chairs: 28, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '77bd5557-0f5e-4bd8-b88b-cc1ee80ffc53',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 004A',
    'others'::resource_type,
    7,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3a6d908f-9543-490b-b668-4ae8392fdaf8',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 004B',
    'others'::resource_type,
    4,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '430cbfca-be8b-49e8-ad2a-63c27730b065',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 005',
    'others'::resource_type,
    30,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'de493cf3-0156-4294-b033-510cb3d1dc9b',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 005A',
    'others'::resource_type,
    4,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 2, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2ef95942-157a-4141-aab1-2dc7cdba6429',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 005B',
    'others'::resource_type,
    6,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5ec436ca-9ad5-425a-9c9f-fdd6ed6f9a7d',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 005C',
    'others'::resource_type,
    6,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 6',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b0400676-11cc-4d0a-a090-7290d57de66b',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 0),
    'AT- 005D',
    'others'::resource_type,
    6,
    'DISCUSSION ROOM - Central Library',
    'Benches: 0, Chairs: 6',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac0faf38-d340-4cf1-a8c8-11c4fe35aeaf',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 1),
    'AT- 101',
    'others'::resource_type,
    38,
    'BOOK RACK HALL - Central Library',
    'Benches: 0, Stools: 38, CCTV: 10, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '71bffd30-e66f-45af-b47a-baefeee5b0c9',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 2),
    'AT- 201',
    'others'::resource_type,
    37,
    'BOOK RACK HALL - Central Library',
    'Benches: 0, Stools: 36, CCTV: 10, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2ac70373-fb34-41c6-8651-64f4ab66fb8b',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 3),
    'AT- 301',
    'others'::resource_type,
    350,
    'READING HALL - Central Library',
    'Benches: 125, Chairs: 282, Stools: 35, CCTV: 10, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '076581b7-7b19-4afe-9114-e6da5177ad49',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 4),
    'AT- 401',
    'others'::resource_type,
    350,
    'READING HALL - Central Library',
    'Benches: 149, Chairs: 259, Stools: 35, CCTV: 10, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0ecd5361-d100-4455-a49d-af0083692010',
    '3713d3a7-49c4-466b-9b5d-2820a77ed123',
    (SELECT id FROM floors WHERE building_id = '3713d3a7-49c4-466b-9b5d-2820a77ed123' AND floor_number = 5),
    'AT- 501',
    'others'::resource_type,
    350,
    'READING HALL - Central Library',
    'Benches: 159, Chairs: 259, CCTV: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '89396219-8f58-4e96-8eb5-d1cd9ea02a66',
    'c786553d-fe99-4c42-b42d-fcef939476d3',
    (SELECT id FROM floors WHERE building_id = 'c786553d-fe99-4c42-b42d-fcef939476d3' AND floor_number = 0),
    'AK-01',
    'others'::resource_type,
    NULL,
    'AKHADA - Departement of Sports',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '114192ff-1cb1-4ffc-8e80-9765e13349b5',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = -1),
    'AB-B004',
    'classroom'::resource_type,
    20,
    'TUTORIAL ROOM - School of Liberal Arts - Department of Peace Studies',
    'Benches: 20, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '34dbb40a-04ef-4b35-8519-a2520b546042',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = -1),
    'AB-B005',
    'classroom'::resource_type,
    40,
    'TUTORIAL ROOM - School of Liberal Arts - Department of Peace Studies',
    'Benches: 7, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '91151bab-a4e7-4558-a1c5-787d092c1b99',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = -1),
    'AB-B006',
    'lab'::resource_type,
    25,
    'ADVANCED HEAT TRANSFER & HVAC LAB - School of Engineering and Technology - FY B.TECH',
    'Benches: 10, Chairs: 5, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '420e3ffd-ecec-4345-a71a-02a9f344670e',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = -1),
    'AB-B007',
    'lab'::resource_type,
    52,
    'APPLIED LAB - School of Engineering and Technology - FY B.TECH',
    'Benches: 1, Chairs: 10, Stools: 52, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac3d56d7-61b6-46cf-92e4-037ba8371d16',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 0),
    'AB-002',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bd229861-9567-4d28-94d3-768d0fb1cea1',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 0),
    'AB-003',
    'classroom'::resource_type,
    25,
    'TUTORIAL ROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 37, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '37ecc6a6-85b5-49f8-a356-2ac02a2d1ddd',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 0),
    'AB-004',
    'classroom'::resource_type,
    80,
    'TUTORIAL ROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 39, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cab71e7f-1786-4f60-9b95-37c213544bef',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 0),
    'AB-006A',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 36, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ffc993dc-8585-4954-98ac-1cf25c12b8b3',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 1),
    'AB-102',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8b67b838-2ff1-42bf-8626-81b23ccc104c',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 1),
    'AB-103',
    'classroom'::resource_type,
    68,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3272ec1c-ad67-47ff-aa33-1cb43e132a58',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 1),
    'AB-104',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '761e1baf-d501-4a15-909a-b2f348407cb9',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 1),
    'AB-105',
    'lab'::resource_type,
    32,
    'COMPUTER LABORATORY-1 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 32, Computers: 32',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd31b19dd-03a7-4c66-bcfe-249d336e8b0e',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 1),
    'AB-106A',
    'lab'::resource_type,
    48,
    'COMPUTER LABORATORY-2 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 48, Computers: 48',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '46b1cd4d-071b-48f3-abcf-30ac4e981784',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 2),
    'AB-201',
    'classroom'::resource_type,
    68,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 38, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bf9a6411-c673-4c6e-aeb1-aaf9f7a55968',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 2),
    'AB-203',
    'classroom'::resource_type,
    74,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 36, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ef51eda-0fa8-41fd-bb8a-f98413e8be4d',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 2),
    'AB-204',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2f2543c9-d398-40b5-aef1-9ea9fc4b5ebf',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 2),
    'AB-205',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '792407bf-c378-4d52-bfce-01a8ea2b6ee0',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 2),
    'AB-206',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 37, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '75cf478a-4de8-431b-a9df-b9e64d6c05ad',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 2),
    'AB-207',
    'lab'::resource_type,
    40,
    'BASIC MECHANICAL ENGG - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 2, Stools: 38',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'be805b07-3627-43f2-858f-0dde0716cebb',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 3),
    'AB-301',
    'classroom'::resource_type,
    74,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 39, Chairs: 1, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dca7aaad-067a-486a-b473-e2abfdfc204a',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 3),
    'AB-303',
    'lab'::resource_type,
    35,
    'CHEMISTRY LAB-1 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 2, Stools: 35, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'da1ce848-241a-4543-a579-637bf426a934',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 3),
    'AB-304',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1b3d7aed-229d-4e13-957d-ecd3d023159b',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 3),
    'AB-305',
    'lab'::resource_type,
    43,
    'COMPUTER LABORATORY-2 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 43, Computers: 43',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '138e57b5-7873-4d48-92df-6ee0474bc662',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 4),
    'AB-403',
    'lab'::resource_type,
    35,
    'CHEMISTRY LAB-2 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 4, Stools: 35, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2b81fe86-a51f-4b95-97c4-79b69b388512',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 4),
    'AB-404',
    'lab'::resource_type,
    40,
    'LANGUAGE LAB - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 40',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e9c4951b-a6eb-4cf5-a9ab-fd1dfb7ddb70',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 4),
    'AB-405',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 36, Chairs: 2, Smartboard: 1, Computers: 40',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5b48b157-d77f-42a6-af7a-22236f7902cf',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 4),
    'AB-406',
    'lab'::resource_type,
    30,
    'BEEE LAB 1 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 23, Stools: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6f19dc8e-ba63-4bfa-83e4-26685a01d70d',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 4),
    'AB-407',
    'lab'::resource_type,
    30,
    'BEEE LAB 2 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 30, Stools: 5, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '909431e3-440f-4443-8b44-9a5669b878c9',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 5),
    'AB-501',
    'classroom'::resource_type,
    50,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 40, Chairs: 61, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5382b94c-6e1c-4c5e-a4d5-9b6bec86d8de',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 5),
    'AB-503',
    'others'::resource_type,
    5,
    'RECORDING STUDIO - Centre for Digital Learning',
    'Benches: 0',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '59908369-6e82-4144-a5e7-477077a1433a',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 5),
    'AB-505',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 36, Chairs: 10, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f29ae227-fc67-4a4f-a05a-5a47d029a2b2',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 5),
    'AB-506',
    'classroom'::resource_type,
    13,
    'TUTORIAL ROOM - Unallocated - Unallocated',
    'Benches: 0, Chairs: 27, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6db9bcaf-41f6-43be-a510-907ad5bb7d47',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 6),
    'AB-601',
    'classroom'::resource_type,
    76,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 40, Chairs: 1, Smartboard: 1, LED TV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fd6e3389-7b9b-4684-b89a-20de4b5fc19b',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 6),
    'AB-603',
    'lab'::resource_type,
    60,
    'PHYSICS LAB-1 - School of Engineering and Technology - FY B.TECH',
    'Benches: 12, Chairs: 5, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1e93b380-21ef-4231-a161-36946ee85ea4',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 6),
    'AB-604',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - FY B.TECH',
    'Benches: 41, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ec211c6f-f631-4f23-a397-e3ef324dd341',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 6),
    'AB-605',
    'lab'::resource_type,
    30,
    'PHYSICS LAB-2 - School of Engineering and Technology - FY B.TECH',
    'Benches: 0, Chairs: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '87b2b689-76ce-4717-b158-9a5ad9c3639c',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 6),
    'AB-606',
    'classroom'::resource_type,
    30,
    'CLASSROOM - Unallocated - Unallocated',
    'Benches: 0, Chairs: 31, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '041f2861-718b-4ee1-86e4-f941bde464a3',
    'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    (SELECT id FROM floors WHERE building_id = 'c9d8ab2a-d543-4e56-b83a-d667da55b399' AND floor_number = 7),
    'AB-701',
    'others'::resource_type,
    0,
    'COSMOS GROUND STATION - School of Engineering and Technology - FY B.TECH',
    'Benches: 0',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac5d192a-2188-4dd7-ad3e-cca846a0c662',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 0),
    'AR-002',
    'lab'::resource_type,
    30,
    'ELECTRICAL & HARDWARE LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 30, Stools: 30, CCTV: 3, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0f74e30e-2077-4953-8bd8-99d8e9fa766a',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 0),
    'AR-003',
    'lab'::resource_type,
    25,
    'FLUID POWER LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 7, Stools: 30, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8c0bc93c-57ee-489e-a0c1-47190962b50c',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 0),
    'AR-004',
    'lab'::resource_type,
    25,
    'POWER ENGG. & MECH. LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 5, Stools: 32, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd07e643c-0ccb-42c9-b513-6efc6f53327e',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 0),
    'AR-005',
    'lab'::resource_type,
    15,
    'CONCRETE TECH. LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 5, Stools: 25, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eab63ba7-77f4-4ed8-8b87-7b5f285b56b0',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 1),
    'AR-102',
    'lab'::resource_type,
    40,
    'CHEMISTRY LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 5, Stools: 35, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ee364dda-1e63-4162-9354-1af46f73708c',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 1),
    'AR-103',
    'lab'::resource_type,
    37,
    'PHYSICS LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 7, Stools: 30, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3e27fd71-57ce-41c1-9f22-0a420a0a06b1',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 1),
    'AR-104',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '82833289-a18e-4d67-8480-013681fe7454',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 1),
    'AR-105',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fb1ba01c-8643-4e11-a1fc-2089090b7091',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 2),
    'AR-203',
    'classroom'::resource_type,
    78,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 39, Stools: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '15e539c5-a120-4b58-9754-502a9ac5e7b3',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 2),
    'AR-204',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5b254036-6aa1-48b6-b99f-305d57f46762',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 2),
    'AR-205',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 42, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '59401f93-e787-4042-b4e5-825b7ac9f412',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 3),
    'AR-302',
    'lab'::resource_type,
    55,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 50, Smartboard: 1, CCTV: 2, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5d6c78df-5cee-4b1c-b4aa-cb418d9b8d13',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 3),
    'AR-303',
    'lab'::resource_type,
    55,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 55, CCTV: 2, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fc939587-fa96-44ff-9fed-50b46b182d82',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 3),
    'AR-304',
    'lab'::resource_type,
    55,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 50, Smartboard: 1, CCTV: 2, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a4c1cb80-14d3-4b1d-94a6-12af0f1cdf28',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 3),
    'AR-305',
    'lab'::resource_type,
    55,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 40, CCTV: 2, Computers: 45',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '754e3b7f-596e-4e43-80ab-777dd4f4a0f0',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 4),
    'AR-401',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 35, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '400e0ca7-7d93-4246-91a3-048f2e683fd0',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 4),
    'AR-402',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 32, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5109096d-a970-4d38-b7cf-66bbca9c13d2',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 4),
    'AR-403',
    'classroom'::resource_type,
    76,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 38, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '604d448c-2262-42b0-a738-50f22b004360',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 4),
    'AR-404',
    'classroom'::resource_type,
    76,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 38, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '62bc47b4-f1cf-4a9d-a85b-d835584ac5b2',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 4),
    'AR-405',
    'classroom'::resource_type,
    78,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 39, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8e008525-be22-446f-b420-cf85a12587f5',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 5),
    'AR-501',
    'lab'::resource_type,
    40,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 51, Smartboard: 1, CCTV: 2, Computers: 45',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2529007d-eef2-4d4a-ad55-c5e9999d9173',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 5),
    'AR-503',
    'lab'::resource_type,
    40,
    'ELECTRONICS LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 3, Stools: 50, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4508d430-a84d-40a0-af99-d881c6d28157',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 5),
    'AR-504',
    'classroom'::resource_type,
    74,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 37, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '38816ea4-beea-4950-9d60-6aca0fd061b2',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 5),
    'AR-505',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 35, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3d4b78fa-afe8-4611-aa4e-648b9103d776',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 6),
    'AR-601',
    'hall'::resource_type,
    33,
    'DRAWING HALL - School of Engineering and Technology - Department of Polytechnic',
    'Benches: 33, Stools: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '58a82a7c-5d67-43e4-8fde-257e8cc642b2',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 6),
    'AR-602',
    'lab'::resource_type,
    20,
    'ENGLISH LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 17, CCTV: 2, Computers: 21',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '78f0e1e1-b9e6-42ea-ad12-51f4baef66f1',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 6),
    'AR-603',
    'hall'::resource_type,
    26,
    'DRAWING HALL - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 1, Stools: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a2b31efe-f95d-4470-a318-74e7a3f511ee',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 6),
    'AR-604',
    'lab'::resource_type,
    20,
    'E & TC AND MECHANICAL LAB - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 10, Stools: 20, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ea4dba99-baf3-4f0f-bcf8-4d3fabadfbda',
    '9df2f6de-5404-4974-9331-8a5d79ec93af',
    (SELECT id FROM floors WHERE building_id = '9df2f6de-5404-4974-9331-8a5d79ec93af' AND floor_number = 6),
    'AR-605',
    'lab'::resource_type,
    60,
    'E & TC LABORATORY - School of Engineering and Technology - Department of Polytechnic',
    'Chairs: 5, Stools: 55, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4fcf84a6-5c86-4f9a-94e5-41d84e9e4c59',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 0),
    'AI-003',
    'classroom'::resource_type,
    50,
    'ACCOUNTING MUSEUM - School of Economics & Commerce - Department of Commerce and Accounting',
    'Benches: 25, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd713af85-1be2-4e95-9580-6edbdd05e40f',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 1),
    'AI-101',
    'lab'::resource_type,
    42,
    'COMPUTER LABORATORY - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4463745c-90bd-4117-9280-3b29bde85e7e',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 1),
    'AI-102',
    'lab'::resource_type,
    80,
    'COMPUTER LABORATORY - School of Economics & Commerce - Department of Economics and Public Policy',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4575bba3-1d67-4deb-a067-76fc81c8c71c',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 1),
    'AI-103',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2d5fa967-d670-4d3a-8103-a7791430ed3c',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 1),
    'AI-104',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1830d2e9-9b19-4474-a556-af930216b2c6',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 2),
    'AI-201',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    'Benches: 32',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '286377e4-628a-44dc-9935-425612de011a',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 2),
    'AI-202',
    'classroom'::resource_type,
    68,
    'CLASSROOM - School of Economics & Commerce - Department of Economics and Public Policy',
    'Benches: 34',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4c095130-a791-4f56-9068-5042f2d56bf4',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 2),
    'AI-203',
    'classroom'::resource_type,
    76,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    'Benches: 38',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a86e6ce1-f6b3-465c-8550-6c48cb0023be',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 2),
    'AI-204',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2a6e92c4-a45c-49e3-a65f-d59b894cd8ff',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 4),
    'AI-401',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3cc5c074-9576-47f2-b451-51650ba35e48',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 4),
    'AI-402',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '54f00e29-80c0-498b-91eb-5cf346217de8',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 4),
    'AI-403',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Economics and Public Policy',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '98a5e0e8-71b4-4d76-9128-543b887ed9d4',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 4),
    'AI-404',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '963f1d43-2dc0-4ce0-a2ab-f21a241e6d55',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 5),
    'AI-501',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Economics and Public Policy',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0cd421bf-d294-40fe-a110-8285d94ffbbc',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 5),
    'AI-502',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Economics and Public Policy',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e5b7c605-1db1-4d1b-b0a1-7e16bf066112',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 5),
    'AI-503',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Commerce and Accounting',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '82f79b91-2c2d-406d-98d3-9f0a2938163b',
    'c2cd0170-9b2e-4354-984a-01309b084b55',
    (SELECT id FROM floors WHERE building_id = 'c2cd0170-9b2e-4354-984a-01309b084b55' AND floor_number = 5),
    'AI-504',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Economics & Commerce - Department of Economics and Public Policy',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ed28e375-ded0-47fb-a927-b3a74ccb73fc',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-002',
    'lab'::resource_type,
    12,
    'PETROLEUM ENGG LAB - Department of Research and Development - Department of Research and Development',
    'Stools: 12, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b96085ce-166c-4382-86b1-3a923d0332bf',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-003',
    'lab'::resource_type,
    17,
    'MTECH PHD RESEARCH LAB - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 1, Stools: 16, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '92ee1ad6-db3e-4992-8ee9-2043eaaf3994',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-004',
    'lab'::resource_type,
    22,
    'MATERIAL TESTING CHARACTERISATION LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 2, Stools: 20, Smart TV: 1, CCTV: 1, Computers: 6',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6f419f6e-a435-4036-bedd-41904b5c99cd',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-005',
    'lab'::resource_type,
    5,
    'DST SERB LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 4, Stools: 25, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '33367282-5f89-47f6-9d04-18c6ae71cdb1',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-008',
    'lab'::resource_type,
    4,
    'FACULTY ROOM - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '11d66c75-ba70-4716-8352-bd4c793124c7',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-009',
    'lab'::resource_type,
    10,
    'ADVANCED & FUNCTION MATERIAL LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Stools: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '38632cd3-9fbf-4818-9dcc-d2177ddf9ac2',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-010',
    'lab'::resource_type,
    27,
    'MATERIAL SYNTHESIS LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 2, Stools: 25, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5ca6958e-5268-4843-9ea1-e318e47556ee',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-011',
    'lab'::resource_type,
    10,
    'MATERIAL COMPOUNDING & PROCESSING LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Stools: 10, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b674104d-3e48-4b56-be09-dc4522785f18',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 0),
    'BJ-015',
    'others'::resource_type,
    0,
    'BOILER ROOM - Student Council - Student Council',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '794b5636-d7fe-4e30-ad1e-6d3dc77387eb',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-102',
    'lab'::resource_type,
    20,
    'CHEMICAL & BIOLOGICAL ANALYSIS LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Stools: 20, Smartboard: 1, CCTV: 1, Computers: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'df89619d-e486-40b7-a310-209d2383e8aa',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-103',
    'lab'::resource_type,
    20,
    'CRE LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Stools: 20, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2b395c62-3f03-4342-a079-1a2ff3c583ed',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-104',
    'lab'::resource_type,
    24,
    'BIOMEDICAL & ENGG LAB - School of Engineering and Technology - Department of Bioengineering',
    'Stools: 24, Smartboard: 1, CCTV: 1, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1617e529-ae4a-4020-9a61-3172e40c4a0b',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-105A',
    'others'::resource_type,
    10,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7bf254a9-51d0-4734-b612-226e99c19f53',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-106B',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5bf6908d-3788-4eab-81b0-fe685c2f7dce',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-107',
    'lab'::resource_type,
    5,
    'CHEMICAL PROCESS DEVELOPMENT LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 1, Stools: 21, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cfe41c1b-10e7-43e3-bea2-508c617b11ed',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-108A',
    'lab'::resource_type,
    5,
    'BIO PROCESS ENGINEERIN LAB - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 1, Stools: 8, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '95c4cca8-00e9-40c5-aab1-bdb814648ffd',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-108B',
    'lab'::resource_type,
    10,
    'DST FUNDED LAB DR. MILIND DESHMUKH - School of Engineering and Technology - Department of Bioengineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4bf839c4-f36a-44b6-8da4-ef7543ee7a5a',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 1),
    'BJ-109',
    'lab'::resource_type,
    1,
    'BIO ENGG LAB - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 2, Stools: 22, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f0344eaf-3305-4ddf-baa1-5f99dcf0be6b',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-202',
    'lab'::resource_type,
    20,
    'PETROLEUM RESERWIRE CHARACTRISATION LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 20, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '677c07ba-16e3-46d6-bb44-8f7eae3e9dfe',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-203',
    'lab'::resource_type,
    42,
    'PETROLEUM DRILLING ENGINEERING & FUILDS - School of Engineering and Technology - Department of Petroleum Engineering',
    'Benches: 11, Chairs: 20, Stools: 7, Smartboard: 2, Smart TV: 1, CCTV: 1, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7468f30e-3562-4091-b885-e6bda2bb2c8a',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-204',
    'lab'::resource_type,
    20,
    'PETROLEUM DRILLING ENGINEERING & FUILDS - School of Engineering and Technology - Department of Petroleum Engineering',
    'Benches: 10, Chairs: 24, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c45db472-5dea-40dd-86d1-c240c12dbb0b',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-205',
    'lab'::resource_type,
    26,
    'PETROLEUM EXPLORATION LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 26, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e80fef19-fe66-4148-abb4-65b13920dd61',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-206',
    'classroom'::resource_type,
    30,
    'PG CLASSROOM - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 30',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c84bb24d-c0a0-4bc9-b10b-29c742086f5c',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-209',
    'lab'::resource_type,
    1,
    'FUEL TESTING & CHARACTERISATION LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Stools: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b3797736-7116-4001-aaea-000bbb548295',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-210',
    'lab'::resource_type,
    1,
    'BIO CHEMICAL ENERGY LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Stools: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f5450df1-ff3f-4b35-b83e-b53e0064656c',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-211',
    'lab'::resource_type,
    3,
    'INSTRUMENTATION & PROCESS CONTROL LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 3, Stools: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f9502b2d-40cb-4474-9afe-7f60dd14a9f7',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 2),
    'BJ-212',
    'lab'::resource_type,
    21,
    'CHEMICAL ENGG UNIT OPERATIONAL LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 2, Stools: 22, CCTV: 2, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4c5626f2-bd50-4fd4-b824-f20a387bac99',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-302',
    'lab'::resource_type,
    25,
    'PETROLEUM EMERGING TECH LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 1, Stools: 25, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dea5a4f4-cb93-40df-a6fe-fe4a2934fe50',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-303',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Engineering and Technology - Department of Petroleum Engineering',
    'Benches: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bae29d8b-d493-4a0b-9af5-ee412051f160',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-304',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Engineering and Technology - Department of Chemical Engineering',
    'Benches: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '70d45bab-ade5-46a6-83a9-6e7e56375c28',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-305A',
    'others'::resource_type,
    10,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '14176c07-9ae7-4b5c-8b8d-a5ab860fe699',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-307',
    'lab'::resource_type,
    24,
    'PERTROLEUM MODELLING & STIMULATION LAB-A - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 20, Stools: 24, LED TV: 1, CCTV: 1, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '36fa9aa2-973a-49ff-ad0a-e6fff5de9f0d',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-308',
    'lab'::resource_type,
    26,
    'PERTROLEUM MODELLING & STIMULATION LAB-B - School of Engineering and Technology - Department of Petroleum Engineering',
    'Benches: 8, Chairs: 26, Smartboard: 1, CCTV: 2, Computers: 26',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ad131b1c-d7a9-44e5-92c7-ef2ee165dbf2',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-309',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Engineering and Technology - Department of Chemical Engineering',
    'Benches: 32, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c0b27637-5f52-4a77-bd89-c97bad50b6d6',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-310',
    'lab'::resource_type,
    20,
    'COMPUTATION LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 20, Smartboard: 1, CCTV: 1, Computers: 21',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0285541a-5b92-4c2f-a2aa-f53ac82a3eed',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-311',
    'lab'::resource_type,
    60,
    'COMPUTATION LAB - School of Engineering and Technology - Department of Chemical Engineering',
    'Chairs: 21, Stools: 60, Smartboard: 1, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '08cde448-e91b-47ce-8fce-71c3c34fea15',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-312',
    'lab'::resource_type,
    24,
    'BIO ENGG LAB - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 24, Smartboard: 1, CCTV: 1, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a7129456-8fba-4dd5-9d8f-f487fdb5932e',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 3),
    'BJ-314',
    'lab'::resource_type,
    20,
    'PETROLEUM PRODUCTION ENGINEERING LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Stools: 20, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'aa1735c3-9231-4d9b-afd7-a3d8ad515262',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 4),
    'BJ-401',
    'classroom'::resource_type,
    8,
    'PG CLASSROOM - School of Engineering and Technology - Department of Material Science Engineering',
    'Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f70e6f17-9321-4403-bb4f-d04398040d60',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 4),
    'BJ-401A',
    'classroom'::resource_type,
    20,
    'PG CLASSROOM - School of Engineering and Technology - Department of Material Science Engineering',
    'Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c22c90df-bafb-41d8-be5a-3711e20b5bb0',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 4),
    'BJ-402',
    'others'::resource_type,
    10,
    'OFFICE - School of Engineering and Technology',
    'Chairs: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'de552bd6-f974-4f5f-ba2f-c7d9e233743e',
    'eb2405c3-f57b-4f84-a588-314e895d8166',
    (SELECT id FROM floors WHERE building_id = 'eb2405c3-f57b-4f84-a588-314e895d8166' AND floor_number = 4),
    'BJ-402C',
    'others'::resource_type,
    0,
    'OFFICE - School of Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '78415799-6f3f-44ec-aa49-c64c9541e846',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = -2),
    'CK-B2-001',
    'others'::resource_type,
    0,
    'PARKING',
    'CCTV: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ba4f489e-eece-4eba-991b-85e78bd5402c',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = -1),
    'CK-B1-002',
    'others'::resource_type,
    0,
    'PARKING',
    'CCTV: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b5eb4843-1557-4132-b720-d3ba351fcb4b',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 0),
    'CK-001',
    'lab'::resource_type,
    63,
    'COMPUTER LAB - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Chairs: 63, Smartboard: 1, CCTV: 2, Computers: 63',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cd56412c-2dce-4170-8b12-1977d554bae9',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 0),
    'CK-010',
    'others'::resource_type,
    0,
    'PARKING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8bcc3186-5840-47b9-9418-daf5e6b51896',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 0),
    'CK-011',
    'lab'::resource_type,
    0,
    'COLLABRATION AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '95a5bc45-f2df-44a1-b4ef-3f676a2589db',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 0),
    'CK-012',
    'lab'::resource_type,
    0,
    'COLLABRATION AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0d84f39a-1380-44cd-b24e-fd2c51660b18',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 1),
    'CK-102C',
    'others'::resource_type,
    10,
    'CONFERENCE ROOM - School of Business - ADMISSION',
    'Chairs: 6, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ebef511a-8d44-40ad-875c-71dea15fab03',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 1),
    'CK-103C',
    'others'::resource_type,
    8,
    'CONFERENCE ROOM - ADMISSION',
    'Chairs: 5, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '84f8af4c-64ae-422f-83dc-e4089e5f1919',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 1),
    'CK-103D',
    'others'::resource_type,
    8,
    'CONFERENCE ROOM - ADMISSION',
    'Chairs: 6, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '28c20ee5-1503-414a-b82a-fcba8cd2fdb8',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 1),
    'CK-106D',
    'others'::resource_type,
    20,
    'CONFERENCE ROOM - ADMISSION',
    'Chairs: 20, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8d49d657-6eec-4cc9-b386-e59637ea17ff',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 1),
    'CK-133',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8bbfce5b-f3e3-404e-9fc4-8c648cdab96d',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-201',
    'hall'::resource_type,
    152,
    'SEMINAR HALL - School of Business - Department of Business',
    'Benches: 76, Chairs: 6, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '28f0099a-fe1e-45b6-95d9-75d5d8f26ac1',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-202',
    'others'::resource_type,
    1,
    'GD ROOM - CIAP',
    'Chairs: 3, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '84054879-32e8-4d36-8c05-2d25f3ad8c69',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-203',
    'others'::resource_type,
    3,
    'CONFERENCE ROOM - CIAP',
    'Chairs: 3, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd2b910ec-a494-4b2f-aa22-18967d0c22ce',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-205',
    'others'::resource_type,
    8,
    'GD ROOM - CIAP',
    'Chairs: 6, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd1aefeac-c029-4edb-9392-396b755a2f36',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-206',
    'others'::resource_type,
    3,
    'GD ROOM - CIAP',
    'Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6cfa58a5-512d-45cf-ae88-13137fe43fb5',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-207',
    'others'::resource_type,
    3,
    'GD ROOM - CIAP',
    'Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ed83cb88-a9e2-4a70-9af3-b9f04fb2179c',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-209',
    'others'::resource_type,
    20,
    'CONFERENCE ROOM - CIAP',
    'Chairs: 20, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ee775b70-bc83-477c-a77c-1410e7f6f78f',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-216 A',
    'hall'::resource_type,
    132,
    'SEMINAR HALL - School of Business - Department of Business',
    'Benches: 66, Chairs: 1, Smartboard: 1, Smart TV: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a8ee4f18-b7e1-482a-ba95-6cc0d2f4bbe4',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-217',
    'hall'::resource_type,
    132,
    'SEMINAR HALL - School of Business - Department of Business',
    'Benches: 66, Chairs: 3, Smartboard: 1, Smart TV: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bf309f3d-51a4-49c0-95cb-dbcfe322ab94',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-219',
    'others'::resource_type,
    0,
    'PANTRY - School of Business - CIAP',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '473d2497-d125-4385-9d3b-14de88b6cf4b',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-221',
    'others'::resource_type,
    3,
    'GD ROOM - CIAP',
    'Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '70f48776-11fc-449b-8d35-e1983c481cf4',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-222',
    'others'::resource_type,
    3,
    'GD ROOM - CIAP',
    'Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3c21d2a2-4f99-4317-87a9-d7ad5b61d460',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-223',
    'others'::resource_type,
    4,
    'GD ROOM - CIAP',
    'Chairs: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '14457e8b-262c-4d16-a0cf-d5552a9b98b1',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-224',
    'others'::resource_type,
    4,
    'GD ROOM - CIAP',
    'Chairs: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7edfdd31-2442-4eaf-8dac-c701fd82426d',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-225',
    'others'::resource_type,
    4,
    'GD ROOM - CIAP',
    'Chairs: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f409907d-3000-4494-b88c-8bcc8d4de5c2',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-226',
    'others'::resource_type,
    3,
    'GD ROOM - CIAP',
    'Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7846a196-e7c4-483f-b261-59fb55001e3f',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 2),
    'CK-228',
    'hall'::resource_type,
    152,
    'SEMINAR HALL - CIAP',
    'Benches: 76, Chairs: 2, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '241e4e5d-363b-4eb2-aca8-f5eac76dcd28',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 3),
    'CK-301',
    'classroom'::resource_type,
    96,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 48, Chairs: 2, Smartboard: 2, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cb3ecbfb-b357-4d8f-8a60-daf1af95b50b',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 3),
    'CK-302',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c690de35-baeb-4e23-9b38-2861df00f595',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 3),
    'CK-303',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dbfe88c6-6a55-41d5-a94c-fa9e6fcca341',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 3),
    'CK-307',
    'others'::resource_type,
    60,
    'COMMON AREA',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3d8fb5e2-5851-4153-a21b-e70c0bd93cb3',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-401',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 2, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6c12a707-7f8b-483c-be6c-cd03e02a8b33',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-402',
    'classroom'::resource_type,
    56,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 28, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cdc927aa-641e-4692-8189-c31597cc0de6',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-403',
    'classroom'::resource_type,
    96,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 48, Chairs: 2, Smartboard: 2, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd1a1bb26-da5c-4d1e-91d6-f84b96f9f428',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-404',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 2, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '110a0003-bf01-4888-b35e-717423c3e084',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-405',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '06a7053b-be42-4552-8456-02698b7dc7e9',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-407',
    'classroom'::resource_type,
    40,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 20, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '27bcc27d-9f53-4ead-bc4e-0748843fca8d',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-408',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '246ea669-e082-40dc-9b0a-7aac283634a5',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-409',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '573b9fe9-e5fa-4f7d-85b7-96a4dd1f0143',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-410',
    'classroom'::resource_type,
    50,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 25, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0928f35a-d41b-472c-9c2b-a7262c5227a9',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-413',
    'lab'::resource_type,
    60,
    'COLLABRATION AREA - School of Business - Department of Business',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5bfd427f-312a-4972-b4c2-0e0618fb2265',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-415',
    'classroom'::resource_type,
    56,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 28, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e6143d05-c2ab-4041-9ec4-85114bec9fef',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 4),
    'CK-416',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 2, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b0ce51f6-86ce-4d5a-a475-1fff235906f9',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-501',
    'hall'::resource_type,
    144,
    'SEMINAR HALL - School of Business - Department of Business',
    'Benches: 72, Chairs: 4, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2a45b646-4889-499d-ab29-710905ead841',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-502',
    'classroom'::resource_type,
    96,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 48, Chairs: 2, Smartboard: 2, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cc390ad8-525c-4d31-bbde-7fe49a3752a8',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-503',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '15f9398f-2d0b-474e-8940-40069c488f59',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-504',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '82c44ebe-b2d9-422f-8b86-ce6bd1867492',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-506',
    'hall'::resource_type,
    132,
    'SEMINAR HALL - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 66, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '71a2fcf5-fdb6-40dd-a0e1-08a981626b3a',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-507',
    'hall'::resource_type,
    132,
    'SEMINAR HALL - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 66, Chairs: 4, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8dadff89-ef0a-460a-83a2-97fd1ae4f94b',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-510',
    'lab'::resource_type,
    60,
    'COLLABRATION AREA - School of Business - Department of Business',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c23ddb87-88e5-450d-983e-3a6c156f1566',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 5),
    'CK-512',
    'hall'::resource_type,
    144,
    'SEMINAR HALL - School of Business - Department of Business',
    'Benches: 72, Chairs: 1, Smartboard: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ee2b4270-9425-4057-b000-5f9a615e29e7',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 6),
    'CK-611',
    'others'::resource_type,
    10,
    'SOB DEAN CABIN - School of Business - Department of Business',
    'Chairs: 10, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac84b6b4-e598-49e9-9b3a-ff47fc602772',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 6),
    'CK-613 A',
    'others'::resource_type,
    0,
    'REFUGE AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'af52977a-17c7-47bb-9507-656f92d28f0b',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 6),
    'CK-616',
    'others'::resource_type,
    0,
    'PANTRY - School of Business - Department of Business',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e0bb606-33c4-4e94-a7b9-d531231c46d1',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-701',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c9207b91-c568-42f3-843a-6a6ac8bab8be',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-702',
    'classroom'::resource_type,
    56,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 28, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'afb657d2-313f-40b8-8580-9d085283e9a7',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-703',
    'classroom'::resource_type,
    72,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 36, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'be63c7d5-8217-480d-a6b7-d98449b558c8',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-704',
    'classroom'::resource_type,
    72,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 36, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd2c9ee21-5e0c-4a59-8588-71e294bfd1e0',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-705',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6e9c40bb-80be-44f0-8db4-8df498fdcb25',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-706',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 36, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '91cd5e34-b4c9-4243-a58a-dc58834f7ef7',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-707',
    'classroom'::resource_type,
    40,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 20, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9739c461-0fad-488a-91f0-22a15ce57a0a',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-708',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '928d5811-9dcb-4dc3-98ee-f0d1f71a495d',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-709',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2f2d5c3a-be0a-4108-a534-b9d41a342299',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-710',
    'classroom'::resource_type,
    50,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 25, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0b8fb45b-c52e-4c3c-b5f8-3b991eb0c90f',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-713',
    'lab'::resource_type,
    60,
    'COLLABRATION AREA - School of Business - Department of Business',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '315b62fe-322c-4f51-92e5-9dfb6c8dd6ec',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-715',
    'classroom'::resource_type,
    56,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 28, Chairs: 1, Smartboard: 1, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a2090c1c-ecd2-4196-a68c-6ced5daa9584',
    '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    (SELECT id FROM floors WHERE building_id = '07aaf60d-c6f5-4d0d-98f4-cefed8e99515' AND floor_number = 7),
    'CK-716',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 3, Smartboard: 1, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8a71d996-2004-4980-93c9-457bdb18f489',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 0),
    'DR-002',
    'classroom'::resource_type,
    60,
    'OFFICE - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 60, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '83cefb02-a331-4e2f-8ffd-a4a373e566da',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 0),
    'DR-005',
    'lab'::resource_type,
    28,
    'SURVEYING LAB - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 11, Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e6955671-0a28-421a-88f2-70a135c0ab1e',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 0),
    'DR-006',
    'lab'::resource_type,
    35,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Public Health',
    'Chairs: 35, Stools: 1, Smartboard: 1, Computers: 31',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '008f1cd6-bc3d-4ec5-bd68-e3234baff973',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 0),
    'DR-007',
    'lab'::resource_type,
    36,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Public Health',
    'Benches: 18, Chairs: 39, Smartboard: 1, Computers: 36',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a59764a9-a05a-4439-bc99-fe802baa0782',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 0),
    'DR-008',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1acf8051-87b4-46db-95bf-7d45eef708b1',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 1),
    'DR-103',
    'classroom'::resource_type,
    2,
    'CLASSROOM - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 9, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8f257241-88f1-4577-9529-e72d2f57f2ca',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 1),
    'DR-105',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'aca38d9d-7899-4011-a03c-99012b0423b1',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 1),
    'DR-106',
    'lab'::resource_type,
    25,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 35, Stools: 1, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '79e92a9a-5b24-45c9-93f2-e5e2faa47fc6',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 1),
    'DR-107',
    'classroom'::resource_type,
    41,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 46, Smartboard: 1, Computers: 41',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '88af22f8-d389-4216-a5d7-346c59f2638a',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 2),
    'DR-203',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Health Sciences and Technology - Department of Clinical Sciences',
    'Benches: 80, Chairs: 80, Stools: 4, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c8a75199-15d5-4dc0-bc2d-d0d3a3909dbd',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 2),
    'DR-204',
    'classroom'::resource_type,
    60,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Wellness and Yogic Science',
    'Benches: 30, Chairs: 50, Computers: 30',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '78ebb2b6-86f6-4165-9964-72cbfb7e6e26',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 2),
    'DR-205',
    'lab'::resource_type,
    39,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Clinical Sciences',
    'Benches: 27, Chairs: 36, Computers: 27',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eed9cdc2-50cb-4c7e-b11a-77a88ef771df',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 2),
    'DR-206',
    'classroom'::resource_type,
    80,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Wellness and Yogic Science',
    'Benches: 40, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7d176145-5749-4aa9-8a61-cfceaf59d68d',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 2),
    'DR-207',
    'lab'::resource_type,
    25,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 25, Stools: 1, Computers: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e1a54102-c111-4ecb-add9-8d7d4a065b9d',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-302',
    'classroom'::resource_type,
    30,
    'PG CLASSROOM - Unallocated - Unallocated',
    'Benches: 15, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e16d71c4-4e27-4458-8b42-b730737a60bc',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-303',
    'classroom'::resource_type,
    80,
    'CLASSROOM - Unallocated - Unallocated',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '765d14bc-8c11-4730-b556-960c4cadbccb',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-304',
    'lab'::resource_type,
    30,
    'COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Clinical Sciences',
    'Chairs: 30, Smartboard: 1, Computers: 30',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9264895c-1c9c-48cd-a1ad-497e90934aae',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-305',
    'lab'::resource_type,
    35,
    'COMPUTER LABORATORY - School of Engineering and Technology - FY B.TECH',
    'Chairs: 35, Smartboard: 1, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b1ce0d84-b86b-4eeb-b551-3f5e325b7714',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-306',
    'lab'::resource_type,
    40,
    'COMPUTER LABORATORY - School of Engineering and Technology - FY B.TECH',
    'Chairs: 40, Smartboard: 1, Computers: 37',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cdb3a0eb-2135-4e12-9197-80c5687a784c',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-307A',
    'lab'::resource_type,
    35,
    'COMPUTER LABORATORY - School of Engineering and Technology - FY B.TECH',
    'Chairs: 70, Smartboard: 1, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0dcbd910-3574-4832-b1c7-d62af2394df5',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 3),
    'DR-307B',
    'lab'::resource_type,
    35,
    'COMPUTER LABORATORY - School of Engineering and Technology - FY B.TECH',
    'Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '73231b8e-118c-4cc3-8acd-2a2572afe6b6',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-402',
    'lab'::resource_type,
    20,
    'BLOCK CHAIN LAB - Unallocated - Unallocated',
    'Chairs: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '208de91d-dd11-4a7b-9bef-3d16c4ef9ce0',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-403',
    'hall'::resource_type,
    80,
    'SEMINAR HALL - NA  - NA',
    'Benches: 80, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '025db544-2ebc-4868-8caa-090f56be6067',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-404',
    'hall'::resource_type,
    60,
    'SEMINAR HALL - NA  - NA',
    'Benches: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4bf5890e-862a-4765-b90c-ddacfabfb3d7',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-405',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '61551d56-5fc0-4db5-a320-ccf1176e6d90',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-406',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f72d3fc5-53f2-4604-b6fe-e808e5e81c91',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-407A',
    'lab'::resource_type,
    48,
    'BLOCK CHAIN LAB - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 48, Computers: 24',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b7c7c03f-290e-4614-a0e7-b8e95acf85a8',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-407B',
    'lab'::resource_type,
    45,
    'WEB LAB - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 45, Computers: 21',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4b0db2b3-1ad6-47df-98cd-22c8bdca12bd',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-407C',
    'lab'::resource_type,
    45,
    'HUMAN LAB - Unallocated - Unallocated',
    'Chairs: 45, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd9f4bd03-6247-4e88-b3a2-81c284eb560a',
    '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    (SELECT id FROM floors WHERE building_id = '0f4a93e5-0553-465e-89cc-2c09ec552b3a' AND floor_number = 4),
    'DR-407D',
    'lab'::resource_type,
    24,
    'SPDC LAB - Unallocated - Unallocated',
    'Chairs: 24, Computers: 12',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '585fbf50-1404-4a73-aa52-97be263cf1c1',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 0),
    'DR-P001',
    'lab'::resource_type,
    8,
    'WRUSTERS PILOT PLANT LAB - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 8, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e600d4c1-be82-48d1-ab78-ae6ba6c24a96',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 0),
    'DR-P002',
    'lab'::resource_type,
    25,
    'DOMAGKS MEDICINAL CHEMISTRY LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 5, Stools: 32, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f1620bb3-892c-4ccb-a061-26a4db494d6f',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 0),
    'DR-P003',
    'lab'::resource_type,
    25,
    'VOGELS PHARMACEUTICAL CHEMISTRY LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 4, Stools: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1997c8ca-8489-4f8d-91b1-256a11a293bd',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 0),
    'DR-P005',
    'lab'::resource_type,
    25,
    'BURGERS PHARMACEUTICAL CHEMISTRY LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 13, Stools: 12',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd1f27b8c-0169-490e-b97d-9644d39df5d0',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P101',
    'classroom'::resource_type,
    60,
    'CLASSROOM II - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 60, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a0c3f142-85fa-4589-abfc-e24d880b07d0',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P102',
    'lab'::resource_type,
    25,
    'CHARAK''S PHARMACOLOGY & PHYTOCHEMISTRY LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 4, Stools: 24',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e49538b3-8e49-4861-8dc7-d0aa777fb03a',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P103',
    'lab'::resource_type,
    25,
    'BEERS& LAMBERT''S PHARMACEUTICAL ANALYSIS LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 3, Stools: 12, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd306a6fc-05d0-4e87-b1f6-8e8b59c4a242',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P104',
    'classroom'::resource_type,
    110,
    'REMINGTON HALL / CLASSROOM I - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Benches: 55, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0390344b-7ffb-4ecb-9afb-a55c857afa96',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P107',
    'others'::resource_type,
    10,
    'CONFERENCE ROOM - School of Consciousness - School of Consciousness',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1bb2ce14-1929-4136-9f05-aae7f8804c06',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P108',
    'lab'::resource_type,
    25,
    'LIFE SCIENCES LAB - School of Consciousness - School of Consciousness',
    'Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7429fade-ff38-4dc8-8da5-27d583b4b61c',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P109',
    'lab'::resource_type,
    2,
    'INSTRUMENTATION LAB - School of Consciousness - School of Consciousness',
    'Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '67269f2a-7b40-45f5-ab18-c1965d5349a6',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P110',
    'lab'::resource_type,
    5,
    'LIFE SCIENCES LAB 2 - School of Consciousness - School of Consciousness',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e1f11a35-b89a-45b3-a966-cb516f8cfb54',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 1),
    'DR-P114A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM - School of Health Sciences and Technology - School of Health Science & Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ea4dc6b3-db36-45d5-8a86-866b01368ce0',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 2),
    'DR-P201',
    'classroom'::resource_type,
    116,
    'CLASSROOM - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Benches: 58, Smartboard: 1, Smart TV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3e6ef22c-9926-4d17-b356-dc62bd9a7bcd',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 2),
    'DR-P202',
    'lab'::resource_type,
    25,
    'GOODMAN ANATOMY PHARMACOLOGY LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 8, Stools: 29, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0fd83864-cb57-4b5b-a6f1-78fae35cc505',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 2),
    'DR-P203',
    'lab'::resource_type,
    25,
    'GALENS PHARMACEUTICAL LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 5, Stools: 23',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f37da16e-4975-4c59-8d8d-e9a46e3ed80d',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 2),
    'DR-P204',
    'lab'::resource_type,
    25,
    'WRENS PHARMACEUTICAL LABORATORY (STERILE) - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 5, Stools: 18',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ca087227-5f61-4701-8986-309cfafad0c8',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 2),
    'DR-P207',
    'lab'::resource_type,
    25,
    'CHEMICAL SCIENCES LAB 1 - School of Consciousness - School of Consciousness',
    'Chairs: 25, Computers: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eca82468-ef8f-4fa2-b8c3-29231edbc36f',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 2),
    'DR-P208',
    'lab'::resource_type,
    5,
    'CHEMICAL SCIENCES LAB 2 - School of Consciousness - School of Consciousness',
    'Chairs: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '82d4bb52-791b-4614-84f0-1d0cbe78c8ea',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P301',
    'lab'::resource_type,
    48,
    'BABBAGE COMPUTER LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 48, Computers: 46',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b38613c4-1d20-4b71-b483-d42cf8f96212',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P302',
    'classroom'::resource_type,
    104,
    'CLASSROOM IV - School of Health Sciences and Technology - Department of Clinical Sciences',
    'Benches: 52',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9df27115-0964-4a27-83f6-246d2ef9a931',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P303',
    'others'::resource_type,
    45,
    'READING ROOM - School of Health Sciences and Technology - School of Health Science & Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '42af1fde-17e1-405c-91fd-8930702bba16',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P304',
    'lab'::resource_type,
    30,
    'QUALITY ASSURANCE TECHNIQUES REASEARCH LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 3, Stools: 25, CCTV: 1, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '255e12f2-ceb8-4d95-836c-dffa0eb9b1ce',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P307',
    'lab'::resource_type,
    18,
    'LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Benches: 3, Stools: 15',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4955c735-8b50-4d38-906a-54dce671ffe3',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P308',
    'classroom'::resource_type,
    22,
    'TUTORIAL ROOM - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 1, Stools: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dc84a041-b361-4ddc-8150-fe7d6fa1f3ff',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 3),
    'DR-P309',
    'lab'::resource_type,
    25,
    'LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 1, Stools: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '60b6b66d-5a32-47c2-835a-08bb00e9622a',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 4),
    'DR-P401',
    'classroom'::resource_type,
    118,
    'CLASSROOM - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Benches: 59, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eb518652-4dd3-47ca-841c-e0ae6caa999c',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 4),
    'DR-P402',
    'lab'::resource_type,
    15,
    'DALE''S PHARMACOLOGY LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 15',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'edc5b07b-1edb-4cae-a9fe-0a34a79da70c',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 4),
    'DR-P405',
    'lab'::resource_type,
    25,
    'LABORATORY - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 25, Stools: 2, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '22558562-5733-4d5f-90cb-d20da330af7c',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 4),
    'DR-P406',
    'classroom'::resource_type,
    10,
    'TUTORIAL ROOM - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eef93058-9062-45f5-be18-d554b7eb94ff',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 4),
    'DR-P407',
    'lab'::resource_type,
    25,
    'ANIMAL HOUSE LAB - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 25, Stools: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd7fdd50a-5c61-4e04-9396-b4873c562eb0',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 5),
    'DR-P501',
    'lab'::resource_type,
    25,
    'LABORATORY 1 - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Stools: 29',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '54549661-ef3e-4dd0-9e79-df095bd797fb',
    '3b67aa87-e11f-4b53-b006-25a022d3770f',
    (SELECT id FROM floors WHERE building_id = '3b67aa87-e11f-4b53-b006-25a022d3770f' AND floor_number = 5),
    'DR-P502',
    'lab'::resource_type,
    29,
    'LABORATORY 2 - School of Health Sciences and Technology - Department of Pharmaceutical Sciences',
    'Chairs: 5, Stools: 25, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '846ad5a8-d905-44f5-a402-8659d0deab13',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 0),
    'DW-009A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM - PLANNING & DEVELOPMENT',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '952049d8-985e-48f5-8a47-fcf9689cf557',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 0),
    'DW-015A',
    'others'::resource_type,
    0,
    'PANTRY',
    'Chairs: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c70961d2-738a-41df-80c4-4aad7280d96d',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 0),
    'DW-016A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0968be86-95d2-436e-be7f-051747a0fa76',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 1),
    'DW-101',
    'hall'::resource_type,
    300,
    'SANT DNYANESHWAR HALL',
    'Chairs: 500, CCTV: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9862b0a0-568b-4d24-8dba-b3b30765324e',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 1),
    'DW-107',
    'others'::resource_type,
    34,
    'PLATO HALL',
    'Chairs: 34, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b0fb3bab-6eb0-438f-ba85-f423e03838bc',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 1),
    'DW-108',
    'others'::resource_type,
    15,
    'PANTRY - TRUSTEE OFFICE',
    'Chairs: 15, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '24d3f94e-31a6-47fe-b4f1-ce965a627e13',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 1),
    'DW-113A',
    'others'::resource_type,
    22,
    'CONFERENCE ROOM - Vice-Chancellor''s office',
    'Chairs: 22',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5c6f2858-62c7-47b8-b637-68131be86291',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 1),
    'DW-117',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e10f4086-ef48-4cd4-a4b0-54d0503e3f03',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 1),
    'DW-120A',
    'others'::resource_type,
    20,
    'CONFERENCE ROOM - Work in Progress',
    'Chairs: 20, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eaae9a86-1ede-4949-831b-d68f7521a12e',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 2),
    'DW-202A',
    'others'::resource_type,
    50,
    'CONFERENCE ROOM - HR & ESTABLISHMENT',
    'Chairs: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1c25dd24-41c1-46e0-b06c-9603837e51ef',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 2),
    'DW-206',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Government - School of Government',
    'Benches: 16, Chairs: 60, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9b5584e1-075e-4b7e-a150-28efbf88fd9b',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 2),
    'DW-207A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '62b1dc6b-0f29-4759-a6a9-7b183bc4dd26',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 2),
    'DW-208',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Government - School of Government',
    'Benches: 30, Chairs: 60, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b8e89e71-298a-43b6-af5c-5edd32920ebc',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 2),
    'DW-211',
    'others'::resource_type,
    150,
    'PEACE & SOG LIBRARY - School of Government - School of Government',
    'Chairs: 50, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '065d2511-96c7-4515-abf3-cadc53c5a5fb',
    '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    (SELECT id FROM floors WHERE building_id = '8169b223-2d9b-4d0d-9f20-fb1f0ff54925' AND floor_number = 2),
    'DW-214',
    'others'::resource_type,
    0,
    'STUDIO - MARKETING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fd1ff209-a7ea-40b6-b9cb-d008d14b2820',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -2),
    'GN-B2-008',
    'others'::resource_type,
    0,
    'PARKING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '510ca3a1-6750-4b4c-9986-0ffe2b8adfd8',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-004',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Liberal Arts - Department of Education',
    'Benches: 21, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f889a07f-284c-49ea-88fc-0984e132de94',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-005',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Liberal Arts - Department of Education',
    'Benches: 21, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fe11c4fa-42cc-4c4f-af85-fe9ff9e7c322',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-006',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Liberal Arts - Department of Education',
    'Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6a62de13-e928-460f-aa76-6531c873aa9c',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-007',
    'classroom'::resource_type,
    36,
    'CLASSROOM - School of Liberal Arts - Department of Education',
    'Benches: 12, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3068402f-9ef3-41c9-a17d-b4f3ddfc4cd3',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-011',
    'others'::resource_type,
    3,
    'VISHWARAJ CLINIC - VISHWARAJ CLINIC',
    'Chairs: 11, CCTV: 1, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8917c409-d5c5-431a-abb3-3be8ff6d2129',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-012',
    'others'::resource_type,
    1,
    'PHARMACY - VISHWARAJ CLINIC',
    'Chairs: 4, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '111da386-b121-4654-963f-8a95a8674826',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = -1),
    'GN-B1-013',
    'others'::resource_type,
    0,
    'PARKING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '40075557-d7d6-4201-86fb-5c5bdc3965ec',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 0),
    'GN-001',
    'others'::resource_type,
    0,
    'BANK OF INDIA',
    'Computers: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '226a954c-0ad0-40e5-9561-67fba74b3dfe',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 0),
    'GN-006',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - School of Business - Department of Business',
    'Chairs: 60, Smart TV: 1, CCTV: 2, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '914c6e97-8be3-4ef7-b70c-0312b5d0bfc6',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 0),
    'GN-007',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - School of Business - Department of Business',
    'Chairs: 60, Smart TV: 1, CCTV: 2, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5762da5d-70b8-48a0-84fe-5a7bcc6f7ead',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 0),
    'GN-008',
    'lab'::resource_type,
    42,
    'COMPUTER LABORATORY - School of Business - Department of Business',
    'Chairs: 44, Smart TV: 1, CCTV: 2, Computers: 42',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '876faeca-98d9-4d25-b7cf-4fb9ada3232e',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 0),
    'GN-011',
    'lab'::resource_type,
    500,
    'COLLABRATION AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8c063698-375a-4e4c-be14-ca9343eaf612',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-101',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 30, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '607d3739-d272-495a-9c43-61f8ed819584',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-102',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '46325305-1505-4c60-96cd-ff2647e2e99f',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-103',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 34, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cb46f7f8-3340-422d-8850-6b139accd8c7',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-104',
    'classroom'::resource_type,
    99,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 46, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3b66635e-6871-4b89-87c7-0337957e402a',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-106',
    'classroom'::resource_type,
    110,
    'CLASSROOM - School of Business - Department of Business',
    'Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '90d42117-f3d1-45eb-b72a-5945404b4c41',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-107',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '28515c42-2651-42fd-b3d4-c286266f4949',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-108',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Business - Department of Business',
    'Stools: 25, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cb45bf20-beae-41b0-b168-d2334b0954e0',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 1),
    'GN-109',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3f93a7f8-cda6-4602-afaa-4d8bfb627b8f',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-201',
    'classroom'::resource_type,
    54,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 18, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '77d56f25-4112-4111-93c1-f698186a2db3',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-202',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c44176e5-5c46-4dcf-85a9-eab8821e5d96',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-203',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0165f8c2-ca27-40d8-8309-61926548865f',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-204',
    'classroom'::resource_type,
    81,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 33, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '071f3e2f-0727-4782-ad33-a87e81adc32a',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-207',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f7e61379-6548-43d4-bdba-ec50f955400f',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-208',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a3c76d6c-ac66-4b72-b77b-98ed64a5ca77',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 2),
    'GN-209',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2410cadb-a812-414d-946e-c5a56e3bbd6c',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-301',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 30, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9886d9d3-645c-4845-aa3c-36bd8fa71a50',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-302',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '99ddc940-f97d-492a-8850-fb14b5036155',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-303',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b0d651e5-51cd-484b-ab7b-d36d93b3a4a3',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-304',
    'classroom'::resource_type,
    99,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 33, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ad727f1f-d4b1-49f9-8b9a-b278169380bc',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-306',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0ef5534b-0214-4e37-81b6-ba369081eac5',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-307',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '949414d7-e6e3-42b3-ba55-431bd494311a',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-308',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 44, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3e5baef2-7d73-4edb-8ba0-a492914862b0',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-309',
    'classroom'::resource_type,
    48,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a1dc7e91-3bb8-4c8b-a9e5-7f3fce95d319',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 3),
    'GN-310',
    'classroom'::resource_type,
    54,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 27, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd22b14c6-4056-4315-9018-a4e2c7521cc6',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-401B',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c6ff1147-4bce-4d6e-9b53-5dcfa4bccc34',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-402',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a0063a81-4fa2-4d20-9b24-f48bb578c29f',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-403',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '77775de9-1000-483b-8037-9fe8bad13c86',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-404',
    'classroom'::resource_type,
    99,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 33, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1bd8533f-8e37-4917-9c22-c7ed1c2f1a5a',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-406',
    'others'::resource_type,
    1,
    'RECORDING STUDIO - School of Liberal Arts - Department of Media and Communication',
    'Chairs: 5, Smartboard: 1, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '529cbe22-6447-429e-a0c2-d3be3454f6d0',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-407',
    'others'::resource_type,
    42,
    'STUDIO - Unallocated - Unallocated',
    'Benches: 42, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd1e65c22-ed2e-4c4a-a845-66b1acbfb994',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 4),
    'GN-408',
    'others'::resource_type,
    20,
    'PHOTOGRAPHY STUDIO - School of Liberal Arts - Department of Photography',
    'Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '34f1e077-6d12-4e8e-b912-6654e27fdaba',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 5),
    'GN-502',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '78986383-f9f6-4d7c-9485-9db105bfb3f4',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 5),
    'GN-503',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 24, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eeb2f6ec-685f-4526-9c7b-8c6ae4418ffe',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 5),
    'GN-504',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 60, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '27858bef-c87e-42dc-8906-9756708f264e',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 5),
    'GN-505-A',
    'lab'::resource_type,
    20,
    'MAC COMPUTER LABORATORY  - Unallocated - Unallocated',
    'Chairs: 18, Computers: 18',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9f60f08f-f498-4b8f-897f-98ec3717a3e0',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 5),
    'GN-506',
    'hall'::resource_type,
    120,
    'SEMINAR HALL - Unallocated - Unallocated',
    'Benches: 120, Chairs: 120, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1faf5c25-742e-4a8f-82ac-9bbd6222b01e',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 5),
    'GN-507',
    'classroom'::resource_type,
    144,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 48, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e5e8ad0-fd20-458a-928e-83bfd0b00e62',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-602',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 32, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ae37059-0499-474a-b2b5-8333414507f5',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-603',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 32, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '411e2836-fb90-491e-bb3d-681361ab33da',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-604',
    'classroom'::resource_type,
    99,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 33, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fe9b2f39-d155-4ae9-af23-78bbab7566cc',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-606',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 60, Chairs: 60, Smartboard: 1, Computers: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f7d26ac9-cb75-4f24-9c58-84328dd89355',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-607',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 60, Chairs: 60, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6ad1e95e-b643-4626-8b0e-1266cf7f5686',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-608',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 70, Chairs: 70, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '65ef847e-d24e-4c84-a68b-fd8b4ea1f85a',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 6),
    'GN-609',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 80, Chairs: 80, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ec8ded3d-992b-49aa-b25e-ea5704ea661d',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 7),
    'GN-702-B',
    'others'::resource_type,
    40,
    'CONFERENCE ROOM - School of Business - Department of Business',
    'Chairs: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fac13680-4b27-4d66-8750-a37e5abe9c7f',
    'e33ca139-eda0-4710-9fcc-72178f32e188',
    (SELECT id FROM floors WHERE building_id = 'e33ca139-eda0-4710-9fcc-72178f32e188' AND floor_number = 7),
    'GN-704',
    'classroom'::resource_type,
    16,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 12, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a2631f5d-fe95-4792-94e2-cff007780e7b',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 0),
    'GG-003',
    'lab'::resource_type,
    20,
    'THERMAL ENGINEERING & NANOFLUIDS RESEARCH LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Stools: 20, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8391da32-64df-4584-97db-0f3962addb1b',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 0),
    'GG-004',
    'others'::resource_type,
    34,
    'ASSO-DEAN, HOS, AHOS, CONFERENCE ROOM - NA  - NA',
    'Chairs: 34, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6273a425-58f9-4b58-a8f7-5eccafb8eb2a',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 0),
    'GG-005A',
    'lab'::resource_type,
    20,
    'HYDRAULICS MACHINERY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Stools: 20, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '09bbcc3b-f494-45c2-be54-d36a91fa4374',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 0),
    'GG-005B',
    'classroom'::resource_type,
    36,
    'TUTORIAL ROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Stools: 36',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '41ebbcc6-e7a8-4538-ba26-98a44fd002c7',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-101',
    'lab'::resource_type,
    38,
    'COMPUTER LABORATORY - School of Liberal Arts - Department of Liberal Arts',
    'Chairs: 38, Computers: 38',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '96688c00-3a13-454e-a597-c5b9f5297676',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-103',
    'classroom'::resource_type,
    48,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 16, Chairs: 17',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '010415d2-f84c-4de1-8ec8-912768b5f407',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-104',
    'classroom'::resource_type,
    82,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 40, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fddf995a-10f3-4f33-8df8-cded70a5a20b',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-105',
    'lab'::resource_type,
    70,
    'COMPUTER LABORATORY - School of Liberal Arts - Department of Liberal Arts',
    'Chairs: 70, Smartboard: 1, CCTV: 4, Computers: 55',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac623b11-339e-4ecf-8933-6761a4a34539',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-106',
    'classroom'::resource_type,
    82,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 40, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a0654cf2-eab2-45d4-98cb-45d2b841ef52',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-107',
    'classroom'::resource_type,
    67,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 28, Chairs: 11, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '71e899fd-37ba-4b10-9d2b-98275ff604f7',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 1),
    'GG-109',
    'others'::resource_type,
    0,
    'CULTURAL ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a93acbed-f941-4d04-9eaf-9f540cf4f19d',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 2),
    'GG-201',
    'lab'::resource_type,
    36,
    'ELECTRONICS LABORATORY - School of Engineering and Technology - FY B.TECH',
    'Benches: 18, Chairs: 45, CCTV: 1, Computers: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6a4cda80-4c09-41be-a1bf-34bd6cf20a35',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 2),
    'GG-203',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 20, Chairs: 5, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '31da3a28-f0dd-4b6c-8b37-4d58395d5b34',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 2),
    'GG-204',
    'classroom'::resource_type,
    88,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 44, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '32674bb9-8387-4b44-9981-b8df4029a968',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 2),
    'GG-205',
    'lab'::resource_type,
    70,
    'COMPUTER LABORATORY - School of Liberal Arts - Department of Liberal Arts',
    'Chairs: 70, Smartboard: 1, CCTV: 4, Computers: 50',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bfbf7466-58d1-414e-af34-1619cbd8a99a',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 2),
    'GG-206',
    'classroom'::resource_type,
    10,
    'COMPUTER CENTRE LAB - School of Liberal Arts - Department of Liberal Arts',
    'Chairs: 10, CCTV: 1, Computers: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '34bb973c-a5b4-447c-a353-5fda854038be',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 2),
    'GG-207',
    'classroom'::resource_type,
    50,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Chairs: 48, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2499c952-27ef-4c61-8487-547543abc550',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 3),
    'GG-301',
    'classroom'::resource_type,
    73,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '853f31ea-2df5-4219-a3b3-814088cd0ce0',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 3),
    'GG-302',
    'classroom'::resource_type,
    0,
    'STORE ROOM - School of Liberal Arts - Department of Liberal Arts',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cb31d558-2376-4358-b38b-bed75e0a07d2',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 3),
    'GG-303',
    'classroom'::resource_type,
    46,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 20, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bf523183-539b-4283-89a4-3fce8de41353',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 3),
    'GG-304',
    'classroom'::resource_type,
    85,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 40, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '666e3403-e468-4538-ad6f-aca3a300697d',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 3),
    'GG-305',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - School of Liberal Arts - Department of Liberal Arts',
    'Chairs: 60, Smartboard: 1, CCTV: 2, Computers: 50',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '47367f84-5ded-46e1-8f91-e6f411465fa6',
    'a452dea8-ac64-44ea-8780-e486682cc24b',
    (SELECT id FROM floors WHERE building_id = 'a452dea8-ac64-44ea-8780-e486682cc24b' AND floor_number = 3),
    'GG-306',
    'classroom'::resource_type,
    73,
    'CLASSROOM - School of Liberal Arts - Department of Liberal Arts',
    'Benches: 31, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f4eb658c-235b-4a50-a745-54eb178ff42d',
    '23e05a9b-668e-41a8-8a92-d093da273bed',
    (SELECT id FROM floors WHERE building_id = '23e05a9b-668e-41a8-8a92-d093da273bed' AND floor_number = 0),
    'GM-001',
    'lab'::resource_type,
    0,
    'ADVANCE MANUFACURING ENGINEERING CENTER - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ae56a649-3b56-43db-b9fd-f5939d7938ea',
    '23e05a9b-668e-41a8-8a92-d093da273bed',
    (SELECT id FROM floors WHERE building_id = '23e05a9b-668e-41a8-8a92-d093da273bed' AND floor_number = 0),
    'GM-004',
    'lab'::resource_type,
    20,
    'ADVANCE WELDING & SIMULATION LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bc5d9796-d150-4152-bacd-145c14bb62e7',
    '23e05a9b-668e-41a8-8a92-d093da273bed',
    (SELECT id FROM floors WHERE building_id = '23e05a9b-668e-41a8-8a92-d093da273bed' AND floor_number = 1),
    'GM-005A',
    'lab'::resource_type,
    1,
    'WELDING SECTION - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4cc633ae-1a79-4ca5-a6af-8b6c289f32fe',
    '23e05a9b-668e-41a8-8a92-d093da273bed',
    (SELECT id FROM floors WHERE building_id = '23e05a9b-668e-41a8-8a92-d093da273bed' AND floor_number = 1),
    'GM-101B',
    'lab'::resource_type,
    25,
    'MATERIAL QUALITY CONTROL LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '539a50de-ad7c-4d33-b10b-cddb9b127133',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-004',
    'lab'::resource_type,
    20,
    'CENTRE OF EXCELLENCE E-MOBILITY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 11, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a9fff3b0-38b0-43af-86d7-c6b8fa11d739',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-005',
    'lab'::resource_type,
    30,
    'CENTRE OF EXCELLENCE E-MOBILITY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 25, CCTV: 1, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7d2a8b62-0163-4e90-9fdf-da2f5c60edf9',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-006',
    'lab'::resource_type,
    30,
    'CONTROL SYSTEM & MEASUREMENT LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 21, CCTV: 1, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '603bfc02-8fb4-4153-8e4a-aeeba4bc482b',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-007A',
    'lab'::resource_type,
    30,
    'ADVANCE MACHINE LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 27, CCTV: 1, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4696c45c-cfcb-4b36-9385-c00d67d0e78e',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-007B',
    'lab'::resource_type,
    30,
    'ELECTRICAL MACHINE LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 28, CCTV: 1, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5cd5a946-7305-4bb6-a66f-ab8aca33754b',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-008',
    'lab'::resource_type,
    30,
    'POWER ELECTRONICS & POWER SYSTEM LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 27, CCTV: 1, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c7e3fb58-a46e-4d90-9ea6-6368aecfac52',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 0),
    'JN-009',
    'lab'::resource_type,
    30,
    'SWITCH GEAR AND RENEWABLE LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 18, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6a231275-ed8a-4461-a879-e279cf923fae',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 1),
    'JN-105',
    'others'::resource_type,
    4,
    'CONFERENCE - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 26, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd23b3d75-2365-439a-8ff0-c576c0acda94',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 1),
    'JN-106',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '49c5ad77-4f8c-4f54-912e-0a14a5e563d8',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 1),
    'JN-107',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '77624501-6647-4c2f-8373-5ba042b7b17f',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 1),
    'JN-108',
    'lab'::resource_type,
    40,
    'COMPUTER AIDED DESIGN LAB - School of Engineering and Technology - Department of Mechanical Engineering
/ E & E (Combine)',
    'Chairs: 43, Stools: 40, Smart TV: 1, Computers: 23',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5092eca3-50cb-4edb-9515-76b195a57164',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 1),
    'JN-110A',
    'lab'::resource_type,
    30,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 55, CCTV: 2, Computers: 53',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f6441d65-84eb-4c9c-94c4-fd83942ad861',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 1),
    'JN-110B',
    'lab'::resource_type,
    0,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 30',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '38eda895-4e76-4443-8409-47009d8371e2',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 2),
    'JN-203',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9345b510-0e0f-4070-9e66-4543461907e8',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 2),
    'JN-204',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '51ac2839-88df-4c8d-9ddc-a03e1998ff62',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 2),
    'JN-205',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '89366c5e-4e5f-4dd8-979d-009b7ec34b19',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 2),
    'JN-206',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '64a2c8ed-0f7c-4825-a848-59264e94129a',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 2),
    'JN-207A',
    'lab'::resource_type,
    40,
    'COMPUTER LAB III - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 94, Stools: 40, Computers: 74',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e6b979b6-8512-4288-ad43-ec4be0f39cd3',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 2),
    'JN-207B',
    'lab'::resource_type,
    40,
    'COMPUTER LAB IV - School of Engineering and Technology - Department of Mechanical Engineering',
    'Stools: 40',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '26012fa5-f621-4a20-b9bd-4c05d800b760',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 3),
    'JN-303',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering
/ Civil / E & E (Combine)',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '36d3c8c8-6c49-4adb-94a3-404a9b789571',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 3),
    'JN-304A',
    'classroom'::resource_type,
    25,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 31, Smartboard: 1, Computers: 18',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '11e75924-c344-4a13-96d3-e64c5d9bed64',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 3),
    'JN-305A',
    'lab'::resource_type,
    25,
    'LINEAR INTEGRATED CIRCUITS LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 26, Computers: 7',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd687d0b2-739e-45fb-8c20-36b354a76a17',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 3),
    'JN-306A',
    'lab'::resource_type,
    52,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 52, Smartboard: 1, Computers: 52',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8dc283bf-7e8f-4753-9878-66fd910e438d',
    '143b2629-557e-4b99-9027-8d3c3dbafd45',
    (SELECT id FROM floors WHERE building_id = '143b2629-557e-4b99-9027-8d3c3dbafd45' AND floor_number = 3),
    'JN-306B',
    'lab'::resource_type,
    3,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '369127b2-da0b-4b02-85f9-f498f71024b3',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-001',
    'others'::resource_type,
    25,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '787a4fd1-5142-4ae2-92d0-1243def8f174',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-002',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '652023d2-43ff-4eff-9b91-5b22c4c1167c',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-003',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bccdf595-ec9c-42f0-a178-7b52ee872368',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-004',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '26dd31dd-fd77-454f-a292-c998ea95b535',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-005',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c44a24ad-4038-402e-96b4-956f32079bf3',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-006',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '73e4138d-0685-44ab-aaaf-36e39740e782',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-007',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '55ef2727-2d59-4d44-ac12-311279d3d1fe',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-008',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3f1d2bf5-481d-40c2-bd61-4587577d2598',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-009',
    'others'::resource_type,
    20,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e286a813-185e-4d17-9d0e-aeb19d4055f2',
    '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    (SELECT id FROM floors WHERE building_id = '252b0f45-fdcd-4a12-963d-7ca482a16e4a' AND floor_number = 0),
    'KR-010',
    'others'::resource_type,
    25,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1b8a231d-4328-498a-a19e-d6e61828b59b',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = -1),
    'KS-B001',
    'others'::resource_type,
    30,
    'CARPENTRY WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 6, Stools: 15, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f5d0c9aa-eb86-4953-ac41-080001faff29',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = -1),
    'KS-B002',
    'others'::resource_type,
    15,
    'TIN SMITHY WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 6, Stools: 8',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9a041912-b63f-40d5-ad50-d44dd0a0b0a8',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = -1),
    'KS-B003',
    'others'::resource_type,
    15,
    'FITTING - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 2, Stools: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '404a0320-a046-451f-a818-c31eb304c501',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 0),
    'KS-002',
    'lab'::resource_type,
    3,
    'TBI INNOVATION LAB - Unallocated - Unallocated',
    'Chairs: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '716dd792-3758-4fbf-aa72-1b766a4cfadd',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 0),
    'KS-006',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Science and Environmental Studies - Department of Environmental Studies',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '91f700b0-6f62-4e64-94ee-cfd8a246abda',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 0),
    'KS-007',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Science and Environmental Studies - Department of Environmental Studies',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1783c7b1-fdeb-40d1-842f-0fc69e023965',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 1),
    'KS-103',
    'classroom'::resource_type,
    70,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ac5daea-6908-4123-b9d9-745ed3a17825',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 1),
    'KS-104',
    'classroom'::resource_type,
    70,
    'CLASSROOM - Ramcharan School of Leadership - Ramcharan School of Leadership',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eef07baf-ee9a-48d2-8b08-3262ca7e8a37',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 1),
    'KS-106',
    'classroom'::resource_type,
    66,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 33, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac0c8746-7717-4fb3-89c8-023b694b258b',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 1),
    'KS-107',
    'classroom'::resource_type,
    68,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2cda4a50-529a-4698-b970-614b29a57cb9',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 2),
    'KS-203',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '24fd56bd-29b3-46a6-83d6-c3c176f21814',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 2),
    'KS-204',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c0852d09-5d59-4e75-b15b-525c6ece1b5b',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 2),
    'KS-205',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e288890e-e858-4380-a64b-62511fffdcd3',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 2),
    'KS-206',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Business - Department of Business',
    'Benches: 35, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fe59db23-65ec-4fc2-8d89-7c94b9744b57',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 2),
    'KS-207',
    'lab'::resource_type,
    30,
    'COMPUTER LABORATORY - Unallocated - Unallocated',
    'Chairs: 35, Computers: 21',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8799e833-298f-4c9a-90e8-d3623aa7ee65',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 3),
    'KS-303',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - Unallocated - Unallocated',
    'Chairs: 60, Smartboard: 1, CCTV: 1, Computers: 54',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3423f73e-8e74-4be0-9a9d-11e6c263c6f9',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 3),
    'KS-304',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - Unallocated - Unallocated',
    'Chairs: 60, Smartboard: 2, CCTV: 1, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3eb82512-d71d-495d-af52-f4379efc9428',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 3),
    'KS-305',
    'lab'::resource_type,
    6,
    'COMPUTER LABORATORY - Unallocated - Unallocated',
    'Chairs: 18, Computers: 8',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cb211e27-e91f-446d-8ea8-056acf93e7e3',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 3),
    'KS-306',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - Unallocated - Unallocated',
    'Chairs: 60, Smartboard: 2, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd7c903c8-0bfc-4a7d-be43-4b15e98b96c1',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 4),
    'KS-403',
    'lab'::resource_type,
    80,
    'MACHINE LEARNING LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 80, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4209897d-25d6-41b2-91d4-04c1e68b2de9',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 4),
    'KS-404',
    'lab'::resource_type,
    20,
    'INDUSTRY TECHNOLOGY LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 20, Stools: 6, Smart TV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '20e88583-0adb-41ce-9877-4a338fbaf0e0',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 4),
    'KS-405',
    'lab'::resource_type,
    64,
    'DIGITAL ELECTRONICS LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0b45f6ca-0717-4294-800a-260f7a810d64',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 4),
    'KS-406',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e8c2546-271e-4a9c-b0d5-572e8df06122',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 4),
    'KS-407',
    'classroom'::resource_type,
    64,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '41559cbc-adcb-4b7e-bdfb-7df535cd5707',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 5),
    'KS-502',
    'lab'::resource_type,
    30,
    'TBI INNOVATION LAB - TBI INNOVATION - TBI INNOVATION',
    'Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ae5bef0f-1034-494d-b9e2-b7c42d9a2591',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 6),
    'KS-603',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - TBI INNOVATION - TBI INNOVATION',
    'Chairs: 60, Smartboard: 1, Smart TV: 1, CCTV: 3, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fb761b1e-3e49-4643-a7d2-aa78760a7c0c',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 6),
    'KS-604',
    'lab'::resource_type,
    30,
    'TBI INNOVATION LAB - TBI INNOVATION - TBI INNOVATION',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '899e57fa-0cb1-45af-b6be-da3e648b55ed',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 6),
    'KS-605',
    'lab'::resource_type,
    30,
    'TBI INNOVATION LAB - TBI INNOVATION - TBI INNOVATION',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bf6b28ad-15c2-4007-90cb-9a8d98993e0d',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 6),
    'KS-606',
    'lab'::resource_type,
    30,
    'TBI INNOVATION LAB - TBI INNOVATION - TBI INNOVATION',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '80c01af4-ebe3-402b-a487-4024f55cf408',
    '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    (SELECT id FROM floors WHERE building_id = '6cff2fd8-bb31-47ab-8498-de5fc474249f' AND floor_number = 7),
    'KS-702',
    'lab'::resource_type,
    30,
    'TBI INNOVATION LAB - TBI INNOVATION',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cbbafb7b-f78f-42c5-87df-113df8b97b1d',
    '50361f54-40e7-4754-90ef-b8990a395484',
    (SELECT id FROM floors WHERE building_id = '50361f54-40e7-4754-90ef-b8990a395484' AND floor_number = 0),
    'MR-001',
    'others'::resource_type,
    10,
    'WORKSHOP - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 6',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '84046505-99fd-494f-89d7-d433a541b444',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 0),
    'MY-001',
    'others'::resource_type,
    0,
    'STUDENT LOUNGE - Student Service Wing',
    'Chairs: 5, Stools: 2, CCTV: 2, Computers: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8bae79ee-5897-4818-a7a8-0aea8e9df0c0',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 0),
    'MY-002',
    'others'::resource_type,
    12,
    'GREEN ROOM',
    'Chairs: 12, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0372da8f-78f8-4d13-8154-f517f5b2254f',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 0),
    'MY-005A',
    'others'::resource_type,
    12,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '202a841e-ddda-416a-bae0-b8d50f75ade0',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 0),
    'MY-005B',
    'others'::resource_type,
    12,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '29c2c303-8b83-4104-9edc-791e3087f47e',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 0),
    'MY-009A',
    'others'::resource_type,
    12,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '78ea2d59-dfff-4448-8e49-16f34a907f50',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-101',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 21, Chairs: 42, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '65cb1fd6-dab8-434c-8d03-2abcb3492b4a',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-102',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 21, Chairs: 42, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9875cc66-81ef-47d6-b6b7-1001b43cea1a',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-105',
    'lab'::resource_type,
    30,
    'ROSALIND FRANKLIN CELL & MOLECULAR BIOLOGY LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Chairs: 3, Stools: 12, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '97d8885b-a0fb-4924-8660-7ca405d7409a',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-106',
    'lab'::resource_type,
    30,
    'ROSS HARRISON ANIMAL CELL CULTURE & TISSUE ENGINEERING LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Chairs: 1, Stools: 15, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3693c59a-e5ba-47fa-a285-c686c4e6cf6c',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-106A',
    'lab'::resource_type,
    20,
    'ANIMAL TISSUE CULTURE LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Stools: 5, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fb25f5e5-86e8-4687-a2c2-c075761a6088',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-107',
    'lab'::resource_type,
    30,
    'MS SWAMINATHAN PLANT BIOTECHNOLOGY LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Chairs: 5, Stools: 37, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c084c5a6-496b-4bd6-96db-ae870dc7434f',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-107A',
    'lab'::resource_type,
    20,
    'PLANT TISSUE CULTURE LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Stools: 5, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9e5e9cb2-9bff-4a31-a83c-6fd0909938db',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-111',
    'lab'::resource_type,
    30,
    'FREDERICK SANGER BIOANALYTICAL TECHNIQUES LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Stools: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c985fb45-52b3-4128-a7a1-1cfda770662a',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-112',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 21, Chairs: 48, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b7a0ff61-73e7-4c27-baaa-b95bd5edd49b',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-113',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 21, Chairs: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6bbafcb0-2352-4453-8655-ded652c1f92d',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-114',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 30, Chairs: 56, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9bd083e6-edb5-431c-8957-d9575a1b0fc9',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 1),
    'MY-115',
    'lab'::resource_type,
    39,
    'MARGARET DAYH OF BIOINFORMATICS COMPUTER LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 12, Chairs: 42, Smartboard: 1, CCTV: 1, Computers: 39',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '651e4fd8-2588-434a-afe0-f35940758db2',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-201',
    'classroom'::resource_type,
    38,
    'CLASSROOM - School of Science and Environmental Studies - Department of Chemistry',
    'Benches: 19, Chairs: 41, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3d0ed74d-28a8-46d0-820f-932606facd3a',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-202',
    'classroom'::resource_type,
    38,
    'CLASSROOM - School of Science and Environmental Studies - Department of Chemistry',
    'Benches: 19, Chairs: 41, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '056bc41c-de12-4020-ac0d-9eb78023f2eb',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-204',
    'lab'::resource_type,
    30,
    'E J COREY ORGANIC CHEMISTRY LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Chairs: 3, Stools: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b358538d-91a4-49c8-b0f9-d5bf8a1ddfec',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-205',
    'lab'::resource_type,
    30,
    'LINUS PAULING INORGANIC CHEMISTRY LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Chairs: 2, Stools: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b4cca5cc-eb93-42bc-9e19-c1daea1bb0f4',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-206',
    'lab'::resource_type,
    30,
    'MICHAEL FARADAY PHYSICAL CHEMISTRY LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Chairs: 2, Stools: 34, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c241f33f-e19e-47fd-a595-2142af426e94',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-207',
    'lab'::resource_type,
    30,
    'LEO BAEKELAND POLYMER CHEMISTRY LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Stools: 29, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6826c630-7dfb-437c-8390-b9e684bb53ab',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-210',
    'lab'::resource_type,
    3,
    'INSTUMENTATION LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Chairs: 5, Stools: 12, CCTV: 1, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ba1cb386-1464-4389-853b-6176f8c7e645',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-211',
    'lab'::resource_type,
    40,
    'SHANTI SWAROOP BHATNAGAR ANALYTICAL LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Benches: 20, Chairs: 38, Stools: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8af1e8ad-027e-41d8-8f70-1ddf06d68523',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-212',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Science and Environmental Studies - Department of Chemistry',
    'Benches: 18, Chairs: 36, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c197b9b5-0967-45fd-ab57-67af03df97c4',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-213',
    'classroom'::resource_type,
    56,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 20, Chairs: 56, Smartboard: 1, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cfa68b28-1672-405b-aef6-d29e3471b267',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-214',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Science and Environmental Studies - Department of Chemistry',
    'Benches: 17, Chairs: 40, Smartboard: 1, Smart TV: 1, CCTV: 1, Computers: 23',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8db7e739-e166-447e-94db-226b667bd5a4',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 2),
    'MY-215',
    'lab'::resource_type,
    42,
    'ERWIN SCHRÖDINGER COMPUTING COMPUTER LAB - School of Science and Environmental Studies - Department of Chemistry',
    'Stools: 42, Smartboard: 1, Smart TV: 1, CCTV: 1, Computers: 40',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'aa953563-47aa-42be-b858-9da7e52269be',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-301',
    'classroom'::resource_type,
    44,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 22, Chairs: 44, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a970abfb-7065-4fa0-b6df-c0957ca79872',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-302',
    'classroom'::resource_type,
    38,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 19, Chairs: 38, Stools: 2, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7010c257-e2b9-41a4-a1ec-00af40122448',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-304',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Chairs: 1, Stools: 8, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '402e41a3-4e9a-443e-9a8e-867e09c11dad',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-305',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 21, Chairs: 42, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6fc5d366-09c6-4594-a973-744a2ff93109',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-306',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 21, Chairs: 38, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '88446c43-8fbe-4db0-8281-49c3e194a9a3',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-307',
    'lab'::resource_type,
    5,
    'EDWARD JENER MICROBIOLOGY LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Chairs: 1, Stools: 7, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '46e22f97-9f95-46e1-bf15-3b9f3e7c6d1d',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-307A',
    'lab'::resource_type,
    20,
    'MICROBIAL CULTURE LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Stools: 2, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5d202e0d-9fdd-468f-921d-33e702273c87',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-308',
    'lab'::resource_type,
    30,
    'ALEXANDER FLEMING MICROBIOLOGY LAB - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Chairs: 2, Stools: 28, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '35abb79c-cf5d-4001-877f-4474683376df',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-312',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 21, Chairs: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f25b262b-8ad6-4987-a5bd-05d925609fbd',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-313',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 21, Chairs: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b75b980b-2119-403b-ae40-be8d815aef77',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-314',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 20, Chairs: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8ba910ab-e0aa-459b-9193-55d26fa6be91',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-315',
    'classroom'::resource_type,
    40,
    'CLASSROOM - School of Science and Environmental Studies - Department of Biosciences and Technology',
    'Benches: 20, Chairs: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '695aeba1-bbb1-4182-882d-c301ecc7146f',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 3),
    'MY-316',
    'lab'::resource_type,
    35,
    'SHAKUNTALA DEVI COMPUTER LAB - School of Science and Environmental Studies - Department of Mathematics and Statistics',
    'Benches: 15, Chairs: 35, Smartboard: 1, CCTV: 1, Computers: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f1f3c418-245b-4b7d-a19c-cdb4e76d5f30',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-401',
    'classroom'::resource_type,
    32,
    'CLASSROOM - School of Science and Environmental Studies - Department of Physics',
    'Benches: 16, Chairs: 32, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ecd7dea5-4fec-446d-836a-405de911cff2',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-402',
    'classroom'::resource_type,
    36,
    'CLASSROOM - School of Science and Environmental Studies - Department of Physics',
    'Benches: 18, Chairs: 39, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4984d0a8-a55d-40ce-afbb-b427b23250ff',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-404',
    'lab'::resource_type,
    30,
    'ALBERT EINSTEIN LAB - School of Science and Environmental Studies - Department of Physics',
    'Chairs: 3, Stools: 38, CCTV: 1, Computers: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c9845d99-95dc-4055-9271-f77007817401',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-405',
    'lab'::resource_type,
    30,
    'LUDWIG BOLTZMANN LAB - School of Science and Environmental Studies - Department of Physics',
    'Chairs: 5, Stools: 20, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9d434321-d538-4685-963b-70eac052d52c',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-406',
    'lab'::resource_type,
    30,
    'ISAAC NEWTON LAB - School of Science and Environmental Studies - Department of Physics',
    'Stools: 34, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7676940a-2d9a-46b7-8f56-0dc68a2fbeff',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-407',
    'lab'::resource_type,
    30,
    'C V RAMAN LAB - School of Science and Environmental Studies - Department of Physics',
    'Chairs: 4, Stools: 36, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1b7f1ce9-f77c-4756-b1d4-c15c5a9828ae',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-411',
    'lab'::resource_type,
    30,
    'RICHARD FEYNMAN LAB - School of Science and Environmental Studies - Department of Physics',
    'Chairs: 4, Stools: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '18ad0567-d859-41db-ae48-6fdb175afb91',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-412',
    'classroom'::resource_type,
    42,
    'CLASSROOM - School of Science and Environmental Studies - Department of Physics',
    'Benches: 21, Chairs: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '53c850ef-d903-4191-ac06-f2e9b9184b04',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-413',
    'classroom'::resource_type,
    32,
    'CLASSROOM - School of Science and Environmental Studies - Department of Physics',
    'Benches: 15, Chairs: 25, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9599b49e-91a9-45d4-9220-88c2f6a4435d',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-414',
    'classroom'::resource_type,
    36,
    'CLASSROOM - School of Science and Environmental Studies - Department of Physics',
    'Benches: 18, Chairs: 39, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3fc047a1-a9ab-4aaf-8de5-ad3dccb2df93',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 4),
    'MY-415',
    'lab'::resource_type,
    42,
    'MAX PLANCK COMPUTER LAB - School of Science and Environmental Studies - Department of Physics',
    'Benches: 18, Chairs: 34, Stools: 42, Smartboard: 1, CCTV: 1, Computers: 29',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9d922d9a-d75d-4aeb-ba61-1815acfaf828',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 5),
    'MY-501',
    'lab'::resource_type,
    NULL,
    'GENOME INTELLECT LAB - Department of Research and Development - Department of Research and Development',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '15ab9468-f7bc-4d08-ada6-606ba93faece',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 5),
    'MY-502',
    'lab'::resource_type,
    NULL,
    'CHARACTERIZATION LAB - Department of Research and Development - Department of Research and Development',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '622b1631-a8e6-48e5-8a1a-0c1d565eb484',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 5),
    'MY-503',
    'lab'::resource_type,
    NULL,
    'APPLICATION LAB - Department of Research and Development - Department of Research and Development',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cac07e0a-5271-44f7-8837-5824a8fbf031',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 5),
    'MY-504',
    'lab'::resource_type,
    NULL,
    'CLEAN ROOM/ SAMPLE PREP. LAB - Department of Research and Development - Department of Research and Development',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b5076424-3714-416f-82c7-d6de16785591',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 5),
    'MY-508',
    'lab'::resource_type,
    NULL,
    'BATTERY FABRICATION LAB - Department of Research and Development - Department of Research and Development',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1f813629-a797-4331-b49b-eac9d418c5e6',
    '306d2996-3a61-4b76-9392-aff2c2c58715',
    (SELECT id FROM floors WHERE building_id = '306d2996-3a61-4b76-9392-aff2c2c58715' AND floor_number = 5),
    'MY-510',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM - Department of Research and Development - Department of Research and Development',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dceafaf1-077b-4d5a-b5b0-89d814fd1331',
    '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4',
    (SELECT id FROM floors WHERE building_id = '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4' AND floor_number = 1),
    'NK-107',
    'others'::resource_type,
    0,
    'GUEST ROOM - Unallocated - Unallocated',
    'Chairs: 2, LED TV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b13a488d-c52d-4ee6-a294-68255903f30e',
    '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4',
    (SELECT id FROM floors WHERE building_id = '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4' AND floor_number = 1),
    'NK-112',
    'others'::resource_type,
    0,
    'RECEPTION AREA',
    'Chairs: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '11d96c83-e2a6-49de-9891-afdf8bd52f13',
    '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4',
    (SELECT id FROM floors WHERE building_id = '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4' AND floor_number = 2),
    'NK-206',
    'lab'::resource_type,
    90,
    'COLLABRATION AREA - OPERATIONS',
    'Chairs: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5bb7a3ec-21e1-4b14-b1bd-ec0ab8ad1ef3',
    '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4',
    (SELECT id FROM floors WHERE building_id = '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4' AND floor_number = 2),
    'NK-207',
    'classroom'::resource_type,
    27,
    'CLASSROOM - Unallocated - Unallocated',
    'Chairs: 27, Smartboard: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b6423a42-9771-44e4-b31c-9e6750699ce9',
    '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4',
    (SELECT id FROM floors WHERE building_id = '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4' AND floor_number = 2),
    'NK-210',
    'classroom'::resource_type,
    39,
    'PG CLASSROOM - Unallocated - Unallocated',
    'Chairs: 41, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd68f5baf-f997-4a8d-88fa-3c527f06e9b2',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 0),
    'PG-001',
    'lab'::resource_type,
    0,
    'EXPERIMENTAL SETUP LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1e79d364-b33a-40d7-83f9-c6827429db47',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 1),
    'PG-101',
    'others'::resource_type,
    26,
    'RECEPTION AREA - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 25, Smartboard: 1, CCTV: 3, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2ebe92cd-108e-4fda-b2dd-5aa459cdea75',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 1),
    'PG-104',
    'others'::resource_type,
    10,
    'EXHIBITORY - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 10, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9622a030-a5e4-471f-a028-c5d3ebbd0e4c',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 2),
    'PG-201',
    'lab'::resource_type,
    5,
    'DRILLING SIMULATION LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 5, CCTV: 2, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6fa34fc3-4621-4d2d-b548-e9144838023d',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 2),
    'PG-202',
    'lab'::resource_type,
    10,
    'ROV DEMONSTRATION LAB - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 10, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7152d934-7e9f-447d-87d9-18ce53537c5f',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 4),
    'PG-401',
    'hall'::resource_type,
    60,
    'SEMINAR HALL - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 60, Smartboard: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '31ec208a-4c11-4865-a815-550c3e996676',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 4),
    'PG-404',
    'others'::resource_type,
    8,
    'CONFERENCE ROOM - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 8, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '46a24e34-a64a-454a-8bc9-1fb5b875ce9e',
    '63b8917d-ddd1-49a6-8b91-493a39c72990',
    (SELECT id FROM floors WHERE building_id = '63b8917d-ddd1-49a6-8b91-493a39c72990' AND floor_number = 4),
    'PG-405',
    'others'::resource_type,
    2,
    'VESSEL ROOM - School of Engineering and Technology - Department of Petroleum Engineering',
    'Chairs: 2, CCTV: 3, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dabf91d5-3199-4fd0-83de-b2d8724ca536',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = -1),
    'ST-B1-001',
    'others'::resource_type,
    0,
    'PARKING',
    'CCTV: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3f49cfc8-215e-4c97-b724-9a9836172523',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-001',
    'others'::resource_type,
    NULL,
    'LEGAL AID CLINIC - School of Law - School of Law',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '61da6d57-6a98-4c72-9418-0f3b33ee18a6',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-002',
    'classroom'::resource_type,
    NULL,
    'CLASSROOM - School of Design - Department of Visual Arts',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6c590afc-c987-4cfa-8533-912445bba0df',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-004',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9e364d7e-a510-447c-93e1-b31d473127e6',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-005',
    'classroom'::resource_type,
    NULL,
    'CLASSROOM - School of Design - Department of Visual Arts',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fb8a4690-3850-4e54-8d04-988634fa0c44',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-006',
    'classroom'::resource_type,
    NULL,
    'CLASSROOM - School of Design - Department of Visual Arts',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'de998afd-b58b-4feb-b33c-c50a5712148a',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-007',
    'lab'::resource_type,
    NULL,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ee73fa9f-970c-4ff4-9cc9-ea699fd0beef',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-008',
    'classroom'::resource_type,
    NULL,
    'CLASSROOM - School of Design - Department of Visual Arts',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '45e6b571-24a6-459a-94a3-575e076553eb',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-009',
    'others'::resource_type,
    NULL,
    'MAC LAB - School of Liberal Arts - Department of Media and Communication',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '25f12168-974f-497c-94cf-974228e29608',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-010',
    'classroom'::resource_type,
    NULL,
    'CLASSROOM - School of Design - Department of Visual Arts',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9c3b69e2-c44e-43af-a44b-4efd900f6949',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 0),
    'ST-013',
    'others'::resource_type,
    NULL,
    'CAFFE - ENCAVE',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '544b313c-d7c5-4488-b011-e5152e0689d0',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-101A',
    'others'::resource_type,
    1,
    'LEGEL AID CLINIC - School of Liberal Arts - Department of Media and Communication',
    'Chairs: 10, CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8e8921f4-2c01-4d19-9bb4-b13e4f6d9239',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-102',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7817d904-d804-435d-a7dc-5e3ed0a3fa58',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-103',
    'lab'::resource_type,
    72,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 24, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f03a90bf-7a95-4169-b2ae-381948d4c970',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-104',
    'lab'::resource_type,
    90,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 30, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e369318-0c04-44bb-96da-07ed7f13fd16',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-106',
    'classroom'::resource_type,
    69,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 23, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5b8866f6-392f-408e-be40-bc3820cfa914',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-107',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8300765f-230b-441b-b06c-a8ff177be6ec',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 1),
    'ST-108',
    'lab'::resource_type,
    99,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '80860c71-4e17-4383-8bcb-f7d42fc9731f',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-201',
    'classroom'::resource_type,
    57,
    'CLASSROOM - School of Liberal Arts - Department of Photography',
    'Benches: 19, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9b315472-9e53-4bd8-a12f-5aaa9d595406',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-202',
    'classroom'::resource_type,
    84,
    'CLASSROOM - School of Liberal Arts - Department of Photography',
    'Benches: 42, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a1ad58e9-5ce7-4a8d-b0d3-48c5f9c1b50b',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-203',
    'lab'::resource_type,
    84,
    'CLASSROOM - School of Liberal Arts - Department of Photography',
    'Benches: 42, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9444696f-0551-4c60-91de-cf07474813f9',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-204',
    'classroom'::resource_type,
    90,
    'CLASSROOM - School of Liberal Arts - Department of Photography',
    'Benches: 30, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e7c7f67b-6104-4ce0-960d-791d91ba698b',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-206',
    'lab'::resource_type,
    72,
    'CLASSROOM - School of Liberal Arts - Department of Media and Communication',
    'Benches: 25, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e4a2d981-ba4d-4764-a3b1-7976cdf99469',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-207',
    'lab'::resource_type,
    72,
    'CLASSROOM - School of Design - Department of Visual Arts',
    'Benches: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e71a3c6f-fd43-4746-be4e-a7d843051ade',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 2),
    'ST-208',
    'classroom'::resource_type,
    102,
    'CLASSROOM - School of Design - Department of Visual Arts',
    'Benches: 34, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '501ffe5d-2a2e-44da-8db7-57c2e2afe477',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 3),
    'ST-302',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8c4d7999-b931-49ad-ac80-0aa0487c37b0',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 3),
    'ST-303',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '104fb785-e6b5-4372-8aab-0b45fbab4109',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 3),
    'ST-304',
    'classroom'::resource_type,
    93,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 31, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '06222132-fbad-4795-a8f8-8df8a5fc9eca',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 3),
    'ST-307',
    'others'::resource_type,
    10,
    'CONFERENCE ROOM - Unallocated - Unallocated',
    'Chairs: 11',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '913adf6c-5c78-4bb2-89f1-95e53fb745b0',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 3),
    'ST-308',
    'others'::resource_type,
    16,
    'LIBRARY ROOM - School of Law - School of Law',
    'Chairs: 16, CCTV: 2, Computers: 6',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '83967f49-c885-4fc0-b67c-e13ff62e4c75',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 4),
    'ST-401',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'de70dc56-4312-4b9e-9c91-e20ee74c183b',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 4),
    'ST-402',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1dbe1fc5-61c6-4573-903c-c76a26413ab9',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 4),
    'ST-403',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 40, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b259023b-2e75-4b65-8a24-c6a1fce1018d',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 4),
    'ST-404',
    'classroom'::resource_type,
    90,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 30, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f0008cb4-3a89-4747-8491-94bda46d9d9f',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 4),
    'ST-405',
    'classroom'::resource_type,
    72,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9b10ba54-8c3c-42fb-b9ef-b0a50d15ce44',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 4),
    'ST-408',
    'others'::resource_type,
    63,
    'READING ROOM - School of Law - School of Law',
    'Benches: 6, Chairs: 32, Smartboard: 1, CCTV: 1, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e7d0fbda-1423-4e86-96ce-18d4c0b4047c',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 5),
    'ST-503',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 40, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0360c027-f7a1-44e9-8c9a-83bc2bb79641',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 5),
    'ST-504',
    'classroom'::resource_type,
    90,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 30, Chairs: 1, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'db9034a4-e491-481a-b21e-d89eaac7bbc4',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 5),
    'ST-505',
    'hall'::resource_type,
    120,
    'SEMINAR HALL - School of Law - School of Law',
    'Chairs: 120, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1a2d7f7e-a022-4241-acd3-c033dd76b1af',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 5),
    'ST-506',
    'hall'::resource_type,
    120,
    'SEMINAR HALL - School of Law - School of Law',
    'Chairs: 119, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '817b8b8d-236a-4288-a20a-b670de25e2c5',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 5),
    'ST-507',
    'others'::resource_type,
    20,
    'BOYS COMMON ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e3c950bc-d17f-403c-a77d-b296d1c368bc',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 6),
    'ST-603',
    'classroom'::resource_type,
    80,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '22f46737-4c64-4194-abdc-72a9e0e3538d',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 6),
    'ST-604',
    'classroom'::resource_type,
    99,
    'CLASSROOM - School of Law - School of Law',
    'Benches: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '54a3b61d-a709-418f-af42-a6714c45beb9',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 6),
    'ST-605 A',
    'lab'::resource_type,
    57,
    'COMPUTER LABORATORY - School of Law - School of Law',
    'Chairs: 57, Smartboard: 1, CCTV: 3, Computers: 57',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '12158a0f-dc79-4c11-b897-b79eed5b2e1b',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 6),
    'ST-605 B',
    'lab'::resource_type,
    60,
    'COMPUTER LABORATORY - School of Liberal Arts - Department of Photography',
    'Chairs: 60, Smartboard: 1, CCTV: 3, Computers: 19',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '95b43959-86c6-4bbc-a6b5-fd809930e65c',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 6),
    'ST-606',
    'hall'::resource_type,
    120,
    'SEMINAR HALL - School of Law - School of Law',
    'Chairs: 120, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dd43d490-ff07-4590-9d00-f096773e6291',
    'db25c05d-9ec3-460c-812a-5970d855a023',
    (SELECT id FROM floors WHERE building_id = 'db25c05d-9ec3-460c-812a-5970d855a023' AND floor_number = 7),
    'ST-701',
    'others'::resource_type,
    50,
    'MOOT COURT - School of Law - School of Law',
    'Chairs: 57, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '503b0fe0-002a-420c-bd25-e5eb85250a01',
    'af623ded-eade-4d00-a927-9d23e1da1c4f',
    (SELECT id FROM floors WHERE building_id = 'af623ded-eade-4d00-a927-9d23e1da1c4f' AND floor_number = 0),
    'B',
    'others'::resource_type,
    0,
    'SECURITY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ece11636-93d1-4bc2-b2b9-fd2d4a7162c4',
    '43b02b9f-9167-41c1-9d27-006b60fcdb76',
    (SELECT id FROM floors WHERE building_id = '43b02b9f-9167-41c1-9d27-006b60fcdb76' AND floor_number = 0),
    'SJ-006',
    'others'::resource_type,
    0,
    'KITCHEN',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '749fbe75-f249-4d7a-8d3d-874b60c8109e',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 0),
    'VT-001',
    'lab'::resource_type,
    20,
    'E VEHICLE & ELECTRICAL MOBILITY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 17, Smart TV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd4f574e4-38fd-4bf9-83f0-0829916afc3b',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 0),
    'VT-002',
    'lab'::resource_type,
    20,
    'HEAT TRANSFER LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 17, Smart TV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '47d50ceb-824a-4162-a2bf-6d9841a06719',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 0),
    'VT-003',
    'lab'::resource_type,
    20,
    'RAC & CRYOGENICS LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 2, Stools: 17, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5df19707-e839-4fad-a282-74046a40dc66',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 0),
    'VT-004A',
    'lab'::resource_type,
    10,
    'LABORATORY - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 10, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1201ed2a-7808-40a0-bd44-9f468a641635',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 0),
    'VT-004B',
    'lab'::resource_type,
    10,
    'LABORATORY - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '45c5dcdf-ae23-474d-9c1d-6e3a192f0fab',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-101A',
    'lab'::resource_type,
    0,
    'ROBOTICS LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '93b2fa55-88f1-4b0a-9b44-6c792f7e879f',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-101B',
    'lab'::resource_type,
    20,
    'AUTOMATION LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 16, Stools: 16, Smartboard: 1, Computers: 8',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f3f68d5d-944f-47ad-89c0-5f340b52aca8',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-102',
    'lab'::resource_type,
    20,
    'PG RESEARCH LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 18, Smartboard: 1, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '89c50572-4f38-43da-ae39-48d1e29b6c25',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-103',
    'lab'::resource_type,
    20,
    'ADVANCED MATERIAL CHARACTERIZATION & METROLOGY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 24, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '916cc2d5-13f0-45e7-b43e-a60c8100695a',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-104',
    'lab'::resource_type,
    20,
    'THEORY OF MACHINES & DYNAMICS OF MACHINERY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 20, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '710bc028-4726-40a0-a24b-fd34f560fb59',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-105',
    'lab'::resource_type,
    20,
    'ENGINEERING METTALURGY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 20, Smart TV: 1, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '865ff926-2b95-425b-8cc9-a2abc3d8c518',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 1),
    'VT-106',
    'lab'::resource_type,
    20,
    'NOISE VIBRATION AND HARSHNESS (NVH) LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 3, Stools: 20, Smartboard: 1, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0e851155-f3bc-479c-a3e7-760486a0a9a8',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 2),
    'VT-201A',
    'lab'::resource_type,
    32,
    'CENTRE OF EXCELLENCE TECHNOLOGY & VISUALISATION LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 35, Stools: 4, Smartboard: 1, Smart TV: 1, CCTV: 3, Computers: 23',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8f424a25-304f-42fe-9870-f6d2b42e5516',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 2),
    'VT-202',
    'lab'::resource_type,
    20,
    'MECHATRONICS & SENSOR TECHNOLOGY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 2, Stools: 20, Smartboard: 1, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3c719b85-0abe-4e48-bbb7-30f1889aa428',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 2),
    'VT-204',
    'lab'::resource_type,
    36,
    'COMPUTER LAB I - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 36, CCTV: 2, Computers: 36',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4ebeb1cb-a545-4aae-8937-cb3a3dd72906',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 2),
    'VT-205',
    'lab'::resource_type,
    36,
    'COMPUTER LAB II - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 36, CCTV: 2, Computers: 36',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1ca68446-ff7e-452e-99e6-2e45b359a886',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 2),
    'VT-207',
    'others'::resource_type,
    NULL,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1b3df5d1-71b8-46f3-ada3-8142bd90867b',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 2),
    'VT-208',
    'others'::resource_type,
    20,
    'CONFERENCE ROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 10, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd6e81b93-bbb6-4cee-8bcd-b9b9a8609567',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 3),
    'VT-301A',
    'classroom'::resource_type,
    60,
    'DRAWING HALL - School of Engineering and Technology - Department of Bioengineering',
    'Benches: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dd127988-83db-4d6d-a381-c14790948393',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 3),
    'VT-302',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'da3b7a3c-f286-4730-a65c-aecb99059817',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 3),
    'VT-303',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Chairs: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1a329ded-7bcc-4a32-8602-9fd955261f13',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 3),
    'VT-304C',
    'others'::resource_type,
    15,
    'CONFERENCE ROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 16, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '691ee864-394d-4376-bbfc-cf5716137d03',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 3),
    'VT-401',
    'lab'::resource_type,
    60,
    'RENEWABLE ENERGY LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '135a0374-b289-4dc1-abba-dc6e5a21e1ae',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 4),
    'VT-402A',
    'classroom'::resource_type,
    50,
    'CLASSROOM - School of Engineering and Technology - Department of Bioengineering',
    'Chairs: 42, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ab9797f6-5190-47a7-8d52-2680ec81f86c',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 4),
    'VT-404',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4cd3c53b-6204-454d-88e6-38f7b70df50c',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 4),
    'VT-405',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4bf74cdd-32b2-440e-ada2-0a9d4c014049',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 4),
    'VT-406',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'Benches: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd47e8c8b-d303-49ae-9d9e-4e505dcb56ed',
    'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d',
    (SELECT id FROM floors WHERE building_id = 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d' AND floor_number = 4),
    'VT-407A',
    'lab'::resource_type,
    20,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Mechanical Engineering',
    'Chairs: 20, Smartboard: 1, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '56bcdf0e-f0f6-43db-b155-cd904b7b6ac6',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = -1),
    'VM-B-001',
    'others'::resource_type,
    0,
    'PARKING',
    'CCTV: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0f523b7c-4db8-4631-8403-5ac00f4ab56f',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 0),
    'VM-001',
    'others'::resource_type,
    0,
    'PARKING',
    'CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6651c51d-6a40-40dd-821e-cf4c093575f7',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 1),
    'VM-101',
    'others'::resource_type,
    40,
    'WOOD WORKSHOP STUDIO - School of Design - Department of Design',
    'Chairs: 4, Stools: 62, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '186d17aa-e576-4791-8350-111fd7706bc5',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 1),
    'VM-102',
    'others'::resource_type,
    0,
    'PLASTIC STUDIO - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c8981824-952b-4edc-84b1-d85b24920281',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 1),
    'VM-103',
    'others'::resource_type,
    0,
    'TOOLS & MATERIAL STORE - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '831e9362-c63a-4b2a-8c52-91b39de3d902',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 1),
    'VM-107',
    'others'::resource_type,
    0,
    'PAINTING STUDIO - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'be6c47c9-f9c0-437a-8bb3-1f4a0276fdbc',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 1),
    'VM-108',
    'others'::resource_type,
    40,
    'SHEET METAL & FABRICATION - School of Design - Department of Design',
    'Stools: 134, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '212738a9-e0ce-4329-9e81-414f6b20e440',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 1),
    'VM-109',
    'others'::resource_type,
    0,
    'STUDIO - School of Design - Department of Design',
    'CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '81c84d07-8fa7-4027-a5b2-751b12d0a647',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 2),
    'VM-201A',
    'lab'::resource_type,
    4,
    '3D PRINTING LAB - School of Design - Department of Design',
    'Chairs: 2, Stools: 5, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '92eec876-a98e-4757-8032-4547f555a2e4',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 2),
    'VM-201B',
    'lab'::resource_type,
    1,
    'MACHING LAB - School of Design - Department of Design',
    'Chairs: 2, Stools: 5, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b81807d3-753a-4fea-8107-f12215642470',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 2),
    'VM-202',
    'others'::resource_type,
    54,
    'CLAY STUDIO - School of Design - Department of Design',
    'Benches: 54, Chairs: 54, Smart TV: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '36e098e8-69ec-48d2-88bd-f534551dc20c',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 2),
    'VM-203',
    'lab'::resource_type,
    30,
    'ERGONOMIC LAB - School of Design - Department of Design',
    'Chairs: 1, Stools: 30, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '897cee70-8f14-494a-bf91-e5bbeb961ac9',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 2),
    'VM-207',
    'others'::resource_type,
    40,
    'CLAY & CERAMIC STUDIO - School of Design - Department of Design',
    'Chairs: 5, Stools: 34, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6e06e98d-1213-405c-aaf9-e2315277280c',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 2),
    'VM-208',
    'hall'::resource_type,
    72,
    'SEMINAR HALL - School of Design - Department of Design',
    'Benches: 72, Chairs: 72, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '46e1fbde-4b66-43b0-88a9-a86d8ace8f87',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-301',
    'others'::resource_type,
    33,
    'STUDIO D1-A - School of Design - Department of Design',
    'Benches: 33, Chairs: 33, Stools: 21, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '76ef29e4-4544-43b0-b7f0-71d7fc2cd243',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-302',
    'others'::resource_type,
    31,
    'STUDIO PD-1-B-CLASSROOM - School of Design - Department of Design',
    'Benches: 31, Chairs: 0, Stools: 27, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8b8174e7-9348-4d7a-8fcf-3b23550aeeb9',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-303',
    'lab'::resource_type,
    60,
    'CAID LAB - School of Design - Department of Design',
    'Chairs: 60, Smartboard: 1, CCTV: 2, Computers: 39',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a49c3a01-cdc8-46d8-9331-4e0f0a1e0fdb',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-305',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a3920b72-052d-4a8a-9aac-b49d94bf4dc3',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-308',
    'others'::resource_type,
    40,
    'STUDIO PD-3 - School of Design - Department of Design',
    'Benches: 16, Chairs: 43, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7330e478-9f53-4028-b9bd-73daf6549ae9',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-309',
    'others'::resource_type,
    40,
    'STUDIO PD2-B - School of Design - Department of Design',
    'Benches: 16, Chairs: 14, Stools: 14, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ca2c37c1-c302-4e31-be47-ad7db932e5d8',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-310',
    'others'::resource_type,
    33,
    'STUDIO PD2-A - School of Design - Department of Design',
    'Benches: 33, Chairs: 20, Stools: 8, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e6968e7-49ba-4876-88ca-5fba40c44082',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 3),
    'VM-311',
    'lab'::resource_type,
    60,
    'COLLABRATION AREA - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a26fc434-71a6-4384-8ea3-ed3a3f75ee87',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-401',
    'others'::resource_type,
    33,
    'STUDIO ROOM - School of Design - Department of Design',
    'Benches: 33, Chairs: 32, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3c20e187-343a-4fe5-88d7-c535052cd613',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-402',
    'others'::resource_type,
    31,
    'STUDIO-ISD-2 - School of Design - Department of Design',
    'Benches: 31, Chairs: 3, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '09883bc1-76c8-42bb-b51c-593ed80245d9',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-403',
    'classroom'::resource_type,
    21,
    'CLASSROOM - School of Design - Department of Design',
    'Benches: 7, Chairs: 14, Stools: 29, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ff523996-a251-415a-b4b2-27fcb2d8cb24',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-406',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a561df51-6736-4cd6-88e1-f338b8ee33b4',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-409',
    'classroom'::resource_type,
    21,
    'M. DES CLASSROOM ID-2 - School of Design - Department of Design',
    'Benches: 7, Chairs: 3, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9b357e7d-352f-4bee-9d46-ea775d98f400',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-410',
    'lab'::resource_type,
    35,
    'CINTIQ LAB - School of Design - Department of Design',
    'Chairs: 35, Stools: 4, Smartboard: 1, CCTV: 2, Computers: 10',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '93f60ac6-9890-46d4-9d97-e770483a226b',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 4),
    'VM-411',
    'others'::resource_type,
    33,
    'STUDIO ROOM - School of Design - Department of Design',
    'Benches: 33, Chairs: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0e5cd762-56f8-4035-aba3-ccb69af1a4a4',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-501',
    'others'::resource_type,
    33,
    'STUDIO VCD1-A - School of Design - Department of Design',
    'Benches: 33, Chairs: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd8cfb2cd-b204-4231-ba42-f13ec75ba490',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-502',
    'others'::resource_type,
    31,
    'STUDIO VCD1-B - School of Design - Department of Design',
    'Benches: 31, Chairs: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b606d2a2-d328-453f-b74b-ba6bf5d90135',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-503',
    'others'::resource_type,
    48,
    'STUDIO VCD-3 - School of Design - Department of Design',
    'Benches: 16, Chairs: 4, Stools: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6a0b6003-79eb-4d2c-b9ab-990537be3f85',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-504',
    'classroom'::resource_type,
    48,
    'VCD-4-CLASSROOM - School of Design - Department of Design',
    'Benches: 16, Chairs: 47, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '03a4b2a4-46f0-42a7-af34-d71933c5b997',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-506',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f431c3ef-b02f-4eb5-b52c-670a2f05f7ad',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-508',
    'lab'::resource_type,
    60,
    'GRAPHIC DESIGN IMAC LAB - School of Design - Department of Design',
    'Chairs: 79, Smartboard: 1, CCTV: 2, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fdd9ec80-670b-4680-9a51-a370853ad493',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-509',
    'classroom'::resource_type,
    32,
    'STUDIO VCD2-A-CLASSROOM - School of Design - Department of Design',
    'Benches: 32, Chairs: 29, Stools: 3, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '26fe6630-e256-4394-9824-4967e991807c',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-510',
    'classroom'::resource_type,
    33,
    'STUDIO VCD2-B-CLASSROOM - School of Design - Department of Design',
    'Benches: 33, Chairs: 31, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2bd726c6-d0f3-4b17-bf6b-eb024a8932e1',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 5),
    'VM-511',
    'lab'::resource_type,
    60,
    'COLLABRATION AREA - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a1ec646c-57f7-4e82-b52b-732b4e18c6e9',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 6),
    'VM-601',
    'others'::resource_type,
    50,
    'STUDIO - School of Design - Department of Design',
    'Chairs: 8, Stools: 13, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8b610318-d7e1-4bea-9bbd-ed4c5103b764',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 6),
    'VM-602',
    'others'::resource_type,
    50,
    'PHOTOGRAPHY - School of Design - Department of Design',
    'Stools: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b6a14991-48db-40f3-b266-f7b7c4a35959',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 6),
    'VM-603',
    'others'::resource_type,
    5,
    'GRAPHIC DESIGN STUDIO - School of Design - Department of Design',
    'Stools: 5, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'abfee0c3-9d1e-4520-a255-830a09bc8195',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 6),
    'VM-604',
    'lab'::resource_type,
    24,
    'M. DES UXD 1 - School of Design - Department of Design',
    'Chairs: 24, Stools: 0, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '55dea1ba-24a9-4b86-b5c1-11785da21149',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 6),
    'VM-606',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '89764116-1099-4f40-845a-230a61abcab9',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 6),
    'VM-609',
    'lab'::resource_type,
    70,
    'ANIMATION & VFX  COMPUTER LAB - School of Design - Department of Design',
    'Benches: 0, Chairs: 69, Stools: 1, CCTV: 2, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9b46cfc6-2330-4637-b5a2-25e9192631fb',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-701',
    'others'::resource_type,
    40,
    'AVFD STUDIO - School of Design - Department of Design',
    'Benches: 40, Chairs: 20, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bd269b2b-400d-4ddc-9db7-2965360c0f5d',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-702',
    'lab'::resource_type,
    20,
    'M. DES ID 1 - School of Design - Department of Design',
    'Benches: 20, Chairs: 20, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e4b3a6fd-8219-4d56-9d99-1f39fd4044d8',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-703',
    'others'::resource_type,
    33,
    'STUDIO FAD-4 - School of Design - Department of Design',
    'Benches: 33, Chairs: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3386459f-d2ad-4cbb-9376-5d28cf2dd8d5',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-705',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '60bb21a2-80a9-4844-b4d8-edd45351e9d4',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-707',
    'others'::resource_type,
    33,
    'STUDIO FAD-3 - School of Design - Department of Design',
    'Benches: 33, Chairs: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8dd20880-1f1a-4534-9e25-240a4167fe44',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-708',
    'lab'::resource_type,
    20,
    'FASHION CAD LAB - School of Design - Department of Design',
    'Benches: 20, Chairs: 20, Stools: 2, Smartboard: 1, CCTV: 1, Computers: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7d4eb7bb-a2e3-4e6c-ad77-f54c2bcaaa98',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-709',
    'others'::resource_type,
    25,
    'SOUND STUDIO - School of Design - Department of Design',
    'Chairs: 1, Stools: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a2e34cbd-5dd1-4057-aede-bdd1c8a39a53',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-710',
    'others'::resource_type,
    15,
    'ANIMATION STUDIO - School of Design - Department of Design',
    'Chairs: 13, Stools: 2, Computers: 5',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2a9d0001-7f3a-4964-91ec-8be5be826730',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 7),
    'VM-711',
    'lab'::resource_type,
    60,
    'COLLABRATION AREA - School of Design - Department of Design',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '27b8e522-dfc4-4a4b-a5d0-0646a1bb8a85',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-801',
    'others'::resource_type,
    33,
    'STUDIO ROOM-UXD-2A - School of Design - Department of Design',
    'Benches: 33, Chairs: 5, Stools: 35, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd1fea370-e5fa-4bbe-8ad9-b26838b33f9c',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-802',
    'others'::resource_type,
    31,
    'STUDIO ROOM-UXD-2B - School of Design - Department of Design',
    'Benches: 31, Chairs: 13, Stools: 1, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '80674d5c-da42-47b4-b12a-cea7c022312e',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-803',
    'others'::resource_type,
    35,
    'STUDIO ROOM-UXD-1-A - School of Design - Department of Design',
    'Benches: 35, Chairs: 16, Stools: 15, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '74af2f26-1f68-4b24-ac7c-094d9fb330a1',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-804',
    'others'::resource_type,
    35,
    'STUDIO ROOM-UXD-1-B - School of Design - Department of Design',
    'Benches: 35, Chairs: 35',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '38a345c0-e9d5-4aa4-8227-8bd7329c506e',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-808',
    'lab'::resource_type,
    60,
    'UX PROTOTYPING  MAC LAB - School of Design - Department of Design',
    'Chairs: 62, Smartboard: 1, CCTV: 2, Computers: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '168d9321-c9a2-4de9-b92c-243227d6bdd4',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-809',
    'others'::resource_type,
    32,
    'STUDIO ROOM UXD-3 - School of Design - Department of Design',
    'Benches: 32, Chairs: 18, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cf779799-853f-429c-92c4-0204b121d43b',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 8),
    'VM-810',
    'others'::resource_type,
    33,
    'STUDIO ROOM UXD-4 - School of Design - Department of Design',
    'Benches: 33, Chairs: 33, Stools: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '55c70630-ac0c-44dc-8b1f-d9d32b452a4a',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-901',
    'classroom'::resource_type,
    27,
    'DESIGN LIBRARY READING ROOM - School of Design - Department of Design',
    'Benches: 9, Chairs: 11, Stools: 7, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f178ae7e-7bf4-43fe-a1d0-bd1c9f4d91c1',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-902',
    'lab'::resource_type,
    25,
    'PATTERN MAKING AND DRAPING LAB - School of Design - Department of Design',
    'Chairs: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3ad6208b-0192-4ea7-ae17-53d2731eed0c',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-904',
    'others'::resource_type,
    18,
    'CONFERENCE ROOM - School of Design - Department of Design',
    'Chairs: 18, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'aa813e18-3596-4069-811b-ff1e759ccf78',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-907',
    'others'::resource_type,
    0,
    'PANTRY - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9d45eeb5-dd71-4ff6-8cad-ff6ba052e9aa',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-909',
    'lab'::resource_type,
    27,
    'TEXTILE PRINTING AND DYEING LAB - School of Design - Department of Design',
    'Benches: 27, Chairs: 37, Smartboard: 1, CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '32d63416-de6e-4f0e-813f-912ef34d44f5',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-910',
    'others'::resource_type,
    0,
    'STUDIO FAD - School of Design - Department of Design',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8474d41b-af88-47f5-a37e-cdfcce84be83',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-911',
    'lab'::resource_type,
    37,
    'GARMENT CONSTRUCTION SEWING LAB - School of Design - Department of Design',
    'Chairs: 1, Stools: 39, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4c88930a-5370-43d8-b3b7-1964ab8e2797',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 9),
    'VM-912',
    'others'::resource_type,
    32,
    'STUDIO FAD - School of Design - Department of Design',
    'Benches: 32, Chairs: 32, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ab9c0cf1-f1b5-4c8e-b50e-66ae3d762ced',
    '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    (SELECT id FROM floors WHERE building_id = '497ee87e-246b-43ad-8f52-4b2d73d6d563' AND floor_number = 10),
    'VM-1001',
    'lab'::resource_type,
    700,
    'COLLABRATION AREA - School of Design - Department of Design',
    'Chairs: 700',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '44cf6112-184b-45ae-84cc-de9b58a28886',
    '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    (SELECT id FROM floors WHERE building_id = '0af6bc0f-7e31-49d8-88a9-2ff414018fe5' AND floor_number = 0),
    'VR-002A',
    'lab'::resource_type,
    20,
    'ADVANCED MANUFACTURING ENGINEERING CENTRE - School of Engineering and Technology - Department of Mechanical Engineering',
    'CCTV: 2, Computers: 3',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eba81ec7-62d5-46b4-b605-e3237d432920',
    '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    (SELECT id FROM floors WHERE building_id = '0af6bc0f-7e31-49d8-88a9-2ff414018fe5' AND floor_number = 0),
    'VR-003',
    'others'::resource_type,
    10,
    'FOUNDRY - School of Engineering and Technology - Department of Mechanical Engineering',
    'Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '45beea9f-4675-44ab-b0ae-347218f7e132',
    '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    (SELECT id FROM floors WHERE building_id = '0af6bc0f-7e31-49d8-88a9-2ff414018fe5' AND floor_number = 0),
    'VR-004',
    'lab'::resource_type,
    NULL,
    'CAD CAM LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'Smart TV: 1, CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '82b199ac-1fb1-4aa2-bd38-eb2169ba786c',
    '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    (SELECT id FROM floors WHERE building_id = '0af6bc0f-7e31-49d8-88a9-2ff414018fe5' AND floor_number = 0),
    'VR-005',
    'lab'::resource_type,
    NULL,
    'ADDICTIVE & DIGITAL MANUFACTURING LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'CCTV: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3fa6fe37-60cc-4f8d-bf4f-77c0111e07a8',
    '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    (SELECT id FROM floors WHERE building_id = '0af6bc0f-7e31-49d8-88a9-2ff414018fe5' AND floor_number = 1),
    'VR-102',
    'lab'::resource_type,
    30,
    'MATERIAL QUALITY CONTROL LAB - School of Engineering and Technology - Department of Mechanical Engineering',
    'CCTV: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'db11ebc2-85d1-487e-8b52-02b67bf50a00',
    '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    (SELECT id FROM floors WHERE building_id = '0af6bc0f-7e31-49d8-88a9-2ff414018fe5' AND floor_number = 1),
    'VR-103',
    'classroom'::resource_type,
    NULL,
    'CLASSROOM - School of Engineering and Technology - Department of Mechanical Engineering',
    'CCTV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2376a119-02a3-4a51-8b95-d42c018471d6',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'EC-001',
    'others'::resource_type,
    60,
    'CAFFE - ENCAVE',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7235f665-1c32-4e3c-9b4f-b13df5541e5c',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'EC-002',
    'others'::resource_type,
    60,
    'CAFFE - ENCAVE',
    'Chairs: 60',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '198d0844-a9b2-4414-989c-9b207ac351c3',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-001',
    'lab'::resource_type,
    10,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 10, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7f3da37b-54e5-4d66-b43d-62a716d83c97',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-002',
    'classroom'::resource_type,
    25,
    'PG CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 15, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a5b62a03-d57f-41bd-af71-29db94a07276',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-003',
    'lab'::resource_type,
    24,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 12, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0aa46f52-7dd3-4390-b882-b995065b97af',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-004',
    'classroom'::resource_type,
    25,
    'PG CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 25, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e87a6107-d699-4ab2-bdf3-2b7708785cd4',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-010',
    'others'::resource_type,
    20,
    'CULTURAL ROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 20',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ee92f18-cfb3-4251-8789-075b4c84c34f',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-011',
    'lab'::resource_type,
    25,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 3, Stools: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '688cd5c1-3dfb-48be-8fe9-b3e493e8945d',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-012',
    'lab'::resource_type,
    25,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 3, Stools: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'aa84e0a0-0c90-4757-af49-17f5d4538f75',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-013',
    'lab'::resource_type,
    25,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 3, Stools: 25',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd3cfe5cc-7715-4159-a3a3-00d559357fa2',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-018',
    'others'::resource_type,
    1,
    'GD ROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 3, Computers: 2',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd9b92082-df99-462c-9242-c77dd65e5859',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-020',
    'classroom'::resource_type,
    23,
    'PG CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 23, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '67f97dfc-9735-43f2-9af0-dcd1e0523c47',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-021',
    'classroom'::resource_type,
    25,
    'PG CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 25, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '24e44cd2-023f-4d72-ab7a-b52433a8de9f',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-022',
    'lab'::resource_type,
    50,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 50, Computers: 50',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '29f871a8-9def-4393-a638-a323b66232e5',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-023',
    'lab'::resource_type,
    50,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 50, Computers: 50',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cf40707d-d50d-4591-a2ee-ec66bf837e73',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 0),
    'VK-024',
    'hall'::resource_type,
    30,
    'DRAWING HALL - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 30',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '00a70356-f2ec-48e4-a5f3-41cc11acd117',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-101',
    'lab'::resource_type,
    20,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 3, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd48902c2-a05c-4d36-82eb-2fa09fca3969',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-102',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 39, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e79744fe-327f-41a1-9253-edd934a617a3',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-103',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 36, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6c77c90f-aada-428a-a75c-6d9daecddcad',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-104',
    'lab'::resource_type,
    20,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 3, Smartboard: 1, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eba22c71-d223-4125-9f1e-6f7e96ea9dcb',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-110A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e2df8dd-4f41-4773-a236-4cd7aa979a5f',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-112A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0eb80978-abc8-425e-a7eb-66046131c8b9',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-114 A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b4c1e3f5-44a7-49e5-93dd-c3a132e00153',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-114 B',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8090e0be-2b82-4b24-9671-4c1bc4bd9fa6',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-115',
    'hall'::resource_type,
    762,
    'SWAMI VIVEKANAND AUDITORIUM',
    'Chairs: 700',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a8805d37-64a4-4d75-9770-0e32b1eeed05',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 1),
    'VK-115B',
    'others'::resource_type,
    0,
    'GREEN ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd99e1c73-526e-4dbd-a710-77c10c526615',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-201',
    'classroom'::resource_type,
    48,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 24, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd0f654ee-dbc5-4cb5-bb8e-e24499985de2',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-202',
    'classroom'::resource_type,
    66,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 30, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e4b8d103-b454-42df-a89f-eb2d4e08a06e',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-203',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 33, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '67e4af46-324e-4872-9abf-451bc4f7eabd',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-204',
    'classroom'::resource_type,
    70,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 37, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '47e29001-c153-4afc-ae00-374e851610fc',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-205',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Civil Engineering',
    'Benches: 56, Computers: 6',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '750265b6-36ea-4d2b-a393-f384925525e6',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-206A',
    'lab'::resource_type,
    14,
    'AUTOMATION LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 36, Computers: 14',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3608187a-7968-471d-b8bd-a4df0c541425',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-207',
    'lab'::resource_type,
    24,
    'COMPUTER LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 26, Computers: 24',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd5ab05e3-3d8b-4766-a084-b998e75e9157',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-211',
    'lab'::resource_type,
    35,
    'LABORATORY - School of Engineering and Technology - Department of Civil Engineering',
    'Chairs: 30',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '548c3997-14b9-48cb-8a8e-6b5d07209783',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 2),
    'VK-218',
    'others'::resource_type,
    20,
    'CAFFE - JUICE CENTER',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '89cc9171-2ae3-49f1-ba07-0279164c0e65',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-301',
    'lab'::resource_type,
    15,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 32, Smartboard: 1, Computers: 19',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8f9478fe-d6fb-4ea0-a7b8-f279c9749c5a',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-302',
    'lab'::resource_type,
    20,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 37, Computers: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1e0ddbea-7aee-47e7-a266-f46a31c692e8',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-303',
    'classroom'::resource_type,
    10,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 35, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3c576761-6e37-48d1-9266-0a6d23876c82',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-304',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 40, Chairs: 2, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1bebfd72-6139-47c1-9121-bc08beaa9d60',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-305',
    'lab'::resource_type,
    20,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 32, Computers: 22',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1c6bf9ef-9d6e-46de-8ff1-b5c2f5ca44b1',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-306',
    'lab'::resource_type,
    3,
    'COMMUNICATION LAB - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 33, Computers: 8',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '73037a78-1463-40ed-9155-be7e2b513d51',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-307',
    'lab'::resource_type,
    12,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 22, Computers: 12',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3d69ac31-8deb-4114-91f8-39ad57f7c67e',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-312',
    'lab'::resource_type,
    40,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 45, Computers: 4',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c12e5aad-1b5d-465c-ae07-1376550941e4',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-312A',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '995f3842-9674-4804-818c-44f58f685762',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 3),
    'VK-320A',
    'others'::resource_type,
    1,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7f5bbbc2-1867-4b72-a8e3-84875d2ba766',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-401A',
    'others'::resource_type,
    NULL,
    'CONFERENCE ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '287ad25e-91dd-4b34-8920-757d190240e3',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-403',
    'classroom'::resource_type,
    16,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 39, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f924c1da-faab-4e8d-ab73-ad93d87e00b4',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-404',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 40, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '633207c9-fe48-41f1-bb14-031007cd4a15',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-405',
    'classroom'::resource_type,
    60,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Benches: 25, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c3bc04e8-9f6e-48e2-b1cf-8ccc0c61a2e2',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-407',
    'classroom'::resource_type,
    8,
    'CLASSROOM - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 20, Smartboard: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fce6fff2-2429-4ce5-8a4d-278bbcc4893b',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-411',
    'lab'::resource_type,
    120,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 23, Stools: 80, Computers: 28',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd34e16fe-e3cd-4a8c-b62e-22efd24b64c4',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-411A',
    'lab'::resource_type,
    28,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 23, Computers: 28',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e49919f6-4755-411b-ac32-7bdd2b61bec0',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-411B',
    'lab'::resource_type,
    28,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 27, Computers: 32',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'fd899fa5-f8b7-4cdf-b207-3d319504355a',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-411C',
    'lab'::resource_type,
    32,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 31, Computers: 32',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a0c59e17-c9f5-4376-aa5a-3ad86b400e3c',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-411D',
    'lab'::resource_type,
    32,
    'LABORATORY - School of Engineering and Technology - Department of Electrical and Electronics Engineering',
    'Chairs: 32',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '02407aad-0e3b-467c-9654-4b21bb153ec7',
    '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    (SELECT id FROM floors WHERE building_id = '1ec1f415-0a6f-4c35-a342-f7856c2e4341' AND floor_number = 4),
    'VK-415',
    'others'::resource_type,
    0,
    'CONFERENCE ROOM - IT  ',
    'Smart TV: 1',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '13fc8cc9-30f2-451a-9e0c-768499643ade',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = -3),
    'VY-B3-001',
    'others'::resource_type,
    0,
    'FOUR WHEELER PARKING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f3248313-3c94-4bb9-b61d-69c154a8ea84',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = -2),
    'VY-B2-001',
    'others'::resource_type,
    0,
    'FOUR WHEELER PARKING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6bd9ff56-00cd-4867-979a-fd60a01b26fc',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = -1),
    'VY-B1-001',
    'others'::resource_type,
    0,
    'FOUR WHEELER PARKING',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '32868d0f-2337-4a09-a52d-ea60e7bfa319',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = -1),
    'VY-B1-003',
    'others'::resource_type,
    0,
    'DROP OFF',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e75114dd-5cd1-4201-a108-aaf2436bde8e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-001',
    'others'::resource_type,
    20,
    'CONFERENCE ROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '22792bbe-9c00-45b8-bc4a-09ed5a66a108',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-002',
    'classroom'::resource_type,
    61,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '910ed3f2-6849-4524-86a2-984265a363e7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-003',
    'classroom'::resource_type,
    61,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '59d8e3ea-9eda-4b86-b048-2debd159773d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-004',
    'classroom'::resource_type,
    61,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6486dceb-0b87-42b7-aefe-3e3ab392fed4',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-006',
    'others'::resource_type,
    0,
    'LOUNGE - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bdbd4040-3848-4c1b-85da-8ab07e7ca071',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-007',
    'others'::resource_type,
    0,
    'STUDENT ACTIVITY CENTRE',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f596b228-7815-4a00-93f5-65fff5d689a7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-012',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ce4e9d61-a74c-4cd1-b769-8296cc85dcea',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-014',
    'others'::resource_type,
    48,
    'STUDENT ACTIVITY CENTRE - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6c1c9e16-3897-423e-9db6-f4fb13b7d089',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-015',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bfc4847e-9804-4fc5-9bf5-8b682fad12f2',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-016',
    'classroom'::resource_type,
    63,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c8a60352-8668-43c4-b2b0-d3d26fb50532',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-025D',
    'others'::resource_type,
    5,
    'MEETING ROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f2c62a76-34b1-49b8-abe6-8584a9c0fd1b',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-027',
    'lab'::resource_type,
    65,
    'LABORATORY - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'bdcd4bcc-0f15-4a1f-b9e1-5a0aee43b92f',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-028',
    'lab'::resource_type,
    65,
    'OBJECT ORIENTED PROGRAMMING LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '56a70d96-172d-475b-bc6d-07b1fea20617',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-029',
    'lab'::resource_type,
    65,
    'DATA STRUCTURES & FILES - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '13c40e6c-1ceb-4fa0-a54b-caf3e209f0ce',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 0),
    'VY-030',
    'lab'::resource_type,
    65,
    'I-MAC LAB 2 - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4a45b26b-eac6-49e4-aae5-52134b0eafb3',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-101',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e794bf4-d4da-42de-9c85-c2726900f7bf',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-102',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f5014a50-0589-462f-a016-c0182b1a2fd4',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-103',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b83bb299-fad8-40fa-9468-8d45e40f0845',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-104',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1bff9a78-b4e4-4574-a05c-54649c55fa8f',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-106',
    'others'::resource_type,
    0,
    'LOUNGE - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'af470e8f-aff0-4b2b-95f2-513b90bc20ea',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-107',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1fc721f0-a363-4ab2-a626-a28b916a7933',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-111',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ba9fae1-b878-471a-92da-81e643360956',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-112',
    'lab'::resource_type,
    30,
    'DIGITAL ELECTRONICS LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '82605ba4-acda-4506-a22b-50d73617f0b4',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-113',
    'lab'::resource_type,
    36,
    'MICROPRCESSOR LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1ed8406c-43ca-4bc7-9f33-c1d6496350e3',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-114',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3380a3d2-4517-4714-a7fb-06af4be21593',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-115',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3b3e8a88-0e10-43e4-af91-0e9f1f9db9c9',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-122',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '582fa667-7408-4a03-947d-dadf3eeae7c5',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-123',
    'lab'::resource_type,
    30,
    'EMBEDDED SYSTEM LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '19e340b8-4a92-4dd0-96b8-d0a461c7b175',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-124',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b0041fd6-5bcd-4788-8830-8293055b922e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-125',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '21248c0f-3cd4-4677-a316-4ce73f94befb',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-126',
    'lab'::resource_type,
    65,
    'SOFTWARE DEVELOPMENT LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '329861a5-faed-4bf5-96da-b2e3e2b2f473',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-127',
    'lab'::resource_type,
    65,
    'CLOUD COMPUTING LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '74e828ad-2c38-4390-81cc-f129fa710dbc',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-128',
    'lab'::resource_type,
    65,
    'BIG DATA LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7cf5882d-f260-4b04-8e7a-204323348f1d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 1),
    'VY-129',
    'lab'::resource_type,
    65,
    'SYSTEM SOFTWARE LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '09d5ddd0-60dd-4fe9-abaa-1201195eaadb',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-201',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '56aff594-7b78-4e55-9e9d-e0d0aea52b78',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-202',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e772e24e-cee4-449b-b3e9-e69c3d5d3545',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-203',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dd598f33-a01a-414d-b1c1-e1d63d4fb71a',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-204',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '01844d4b-83eb-4849-96ae-81663eaab2fd',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-206',
    'lab'::resource_type,
    40,
    'LABORATORY - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2187a93f-be49-4207-93c0-0d31fa416ead',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-210',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a4016ffa-54ff-4aa5-8799-c35f5199a003',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-211',
    'others'::resource_type,
    0,
    'GIRLS COMMON ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5c366676-533a-4412-8513-43e44e68189b',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-212',
    'lab'::resource_type,
    36,
    'DATA SCIENCE LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b5289904-dea0-4689-bd68-14b90ed8430c',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-213',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dfa9dd88-ffda-4331-be44-0733a2843170',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-214',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'affe7174-ca6c-4a76-b1b1-c54842711313',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-221',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c911dc60-319f-437e-988c-a93f9849b27b',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-222',
    'lab'::resource_type,
    30,
    'ROBOTIC AUTOMATION LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2e846932-efff-4357-8ea5-5fb3f8034890',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-223',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3d547090-0641-4ba5-b131-d96f2d852aba',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-224',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e5de9399-04d6-44d9-8885-68b8fdefa267',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-225',
    'lab'::resource_type,
    65,
    'WEB TECHNOLOGY LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'abb52740-2835-47fa-9ad6-e9b9e867b058',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-226',
    'lab'::resource_type,
    65,
    'HUMAN COMPUTER INTERACTION LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a0d93cf8-326f-4ec2-aad4-ddf69da4441d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-227',
    'lab'::resource_type,
    65,
    'DATABASE LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0c265cf1-3481-44fd-8dda-dcf55e794e01',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 2),
    'VY-228',
    'lab'::resource_type,
    65,
    'OPERATING SYSTEM LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b728dee3-b9a2-44cf-bcb5-b3a1d7471e15',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-301',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '513dfcb3-2893-4439-9dcf-17b7f7b76b85',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-302',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1d0c2c5f-408b-4371-a14f-98c1fdd8bf37',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-303',
    'classroom'::resource_type,
    54,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '62d2abee-25a0-4862-be20-78cc51513a1e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-304',
    'classroom'::resource_type,
    54,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b3f98d18-25be-4b23-b5eb-1f6523893662',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-306',
    'others'::resource_type,
    0,
    'LOUNGE - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ac594a2a-f812-4614-80e6-6c701f9272de',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-312',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6262f04e-0a0d-40aa-9d5b-20247bb7589a',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-313',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '52bc5740-8b8d-43ba-bfdc-ce173824a3b4',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-314',
    'lab'::resource_type,
    36,
    'HIGH PERFORMANCE COMPUTING LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'cc5cdce2-35b2-43dc-8511-fcef50346150',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-315',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'dc196f1a-0ad1-491c-ad78-edca1eaefdbd',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-316',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4249d0e5-cefc-4bc1-aa6e-67815fe59831',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-323',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a18ca7f5-927b-4a63-b89d-02135a155568',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-324',
    'lab'::resource_type,
    30,
    'ARVR LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '15b0cba0-28a3-4cd6-ae1f-f0a5b5779870',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-325',
    'classroom'::resource_type,
    61,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '315ca307-7c69-4549-881f-6da6335f6ff8',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-326',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9dc34f06-38bc-4a08-86ae-5107645016cc',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-327',
    'lab'::resource_type,
    65,
    'WIRELESS NETWORK LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2751270a-1d47-430c-b602-d3dca0b46c8d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-328',
    'lab'::resource_type,
    65,
    'DIGITAL FORENSICS LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '71095e75-5b31-48d9-9ad3-f4b6e44fd31b',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-329',
    'lab'::resource_type,
    65,
    'IMAGE PROCESSING LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eb0a59df-0b07-4757-88c5-b6f573d033d1',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 3),
    'VY-330',
    'lab'::resource_type,
    65,
    'RESEARCH LAB - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b1d7e720-71f9-4bc2-81a9-a15cea117d2d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-401',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6da0ac4c-3c0d-4163-bb29-a7064370494c',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-402',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '99c117a5-6b2b-4e4d-843b-ac00855591e8',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-403',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4103ad1b-ed41-439f-9f36-5de98dc1a2b6',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-404',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c3cf8e4e-b392-43a9-9b17-a033efe4cafe',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-406',
    'lab'::resource_type,
    40,
    'INDUSTRIAL - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4ca3f39c-539d-4a4a-8220-193bee796782',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-410',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '9c6b1197-6df0-4d9a-b379-60290cf559d9',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-411',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '66f9b557-80bf-448e-9c98-e6f70ab5ebec',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-412',
    'lab'::resource_type,
    36,
    'BLOCK CHAIN LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f934361b-4134-4365-919c-5994dca91ff7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-413',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5a56955e-ba05-476b-9d1e-c35c64465e38',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-414',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e6790d9d-bb1c-4c0d-8ed4-928ca57cbea0',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-421',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '52ae0591-dfc8-4748-a17c-c76dac4142cb',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-422',
    'lab'::resource_type,
    30,
    'EMERGING TECHNOLOGIES LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b421f3cd-4116-4f6f-962a-f52017a420c7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-423',
    'others'::resource_type,
    0,
    'LOUNGE - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '195ac359-90ca-409e-890d-3d2f93f89b9a',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-424',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'de07867b-9ce4-4b3f-a5d8-ce472d9ff100',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-425',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7b80bc47-46a5-4a04-b190-1b4c0aa9e147',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-426',
    'lab'::resource_type,
    65,
    'LINUX PROGRAMMING LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '0630bfd8-8828-4d9e-92bb-fa9c5b09524c',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-427',
    'lab'::resource_type,
    65,
    'DEVELOPERS LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'f25f3d5e-8741-43b3-9c70-ed4ddc2774ac',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-428',
    'lab'::resource_type,
    65,
    'M TECH DATA SCIENCE LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd77eb95e-2b72-45ed-83b7-0f40339c42f7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 4),
    'VY-429',
    'lab'::resource_type,
    65,
    'M TECH NMCS LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '488c375b-8af8-42e7-b249-607c1df1f9ae',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-501',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e66d593a-077e-4368-a0d4-f4b681e86914',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-502',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '2bf31761-0b61-41ff-9126-eb4f137c01dc',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-503',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '59791c36-6682-475b-8468-88b2331304c9',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-504',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd0415660-80d2-425f-a3a9-f7d71fe58e2d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-506',
    'others'::resource_type,
    0,
    'LOUNGE - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e6085864-ee24-4d7a-806c-9ceef766fe4a',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-507',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7bf97dac-0efc-4781-a454-7547d449be7e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-511',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ae4ac7b-b65c-4163-86ce-b049e1f72336',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-512',
    'lab'::resource_type,
    30,
    'COMPUTER NETWORK - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '77b2458b-59aa-4354-a149-3b572f31e4ae',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-513',
    'lab'::resource_type,
    36,
    'CYBER SECURITY LAB - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '34a46cdb-db90-476b-84f1-8113eba94281',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-514',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '09083649-4a32-4f4c-9ab4-033122d9f982',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-515',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a6adc909-603f-4553-b5d1-299405b90277',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-522',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd5cf340f-765a-41c0-8e71-12aaa4c6165c',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-523',
    'others'::resource_type,
    19,
    'CONFERENCE ROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b3637fa5-c1d8-4865-bfc8-b38483521b08',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-524',
    'classroom'::resource_type,
    62,
    'CLASSROOM - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '66d247fc-eed3-412e-b201-5177fd67a324',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-525',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '97ad8a66-bddd-4460-9a49-47fd77bc7717',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-526',
    'lab'::resource_type,
    65,
    'LABORATORY - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '76cc66d5-3cb6-42d5-80e7-f4742104e20e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-527',
    'lab'::resource_type,
    65,
    'LABORATORY - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'caf5953e-8260-44fe-948c-6d7a1c010bfa',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-528',
    'lab'::resource_type,
    65,
    'LABORATORY - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4951552c-71dc-430f-8f18-3ee655d95ff0',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 5),
    'VY-529',
    'lab'::resource_type,
    65,
    'LABORATORY - School of Computer Science and Engineering - Department of Computer Science and Applications',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '58357fcd-a13b-43a5-9455-4e1ecf904674',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-602',
    'others'::resource_type,
    15,
    'CONFERENCE ROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '03dbc65b-6262-4b8a-8f52-4ca3e927ad9e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603',
    'others'::resource_type,
    92,
    'MEETING AREA - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c2c02320-d476-4127-b638-3264c959d749',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-004',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '098af8a3-4bd5-4612-b16b-8abd3ecae11e',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-005',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '973e6ef3-046b-4831-ab75-71ff0b499193',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-006',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '6d93fae8-a428-4ee3-ba93-5fa87bea217c',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-007',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'd3485a77-8727-41b5-a567-3762abce75d7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-009',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '3d89333a-1ff9-4fbb-a60a-6dfa9a9886ef',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-011',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '1ec3ab78-b241-465c-bcad-4f936c01a79c',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-012',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '34d1f5db-5cd2-4d12-ac82-ad3a1146cc26',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-013',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '01450a72-e1e5-4c1e-85cc-2ca88ea03bb2',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-014',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4998b0e2-8208-421b-b8ac-78e1e214326b',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-603CBN-015',
    'others'::resource_type,
    6,
    'MEETING ROOM',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'b1cc03de-6f05-4bdc-867a-7c9a7e037405',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-609',
    'others'::resource_type,
    0,
    'PANTRY',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '622084b9-ef78-4cfe-b0c0-bd98848f858d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-610',
    'others'::resource_type,
    19,
    'CONFERENCE ROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e879f036-ba92-42bd-8eaf-591b73424854',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-613',
    'others'::resource_type,
    18,
    'CONFERENCE ROOM - School of Computer Science and Engineering - Department of Computer Engineering and Technology',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'ce142934-a64b-4dfb-89c4-9d49f514b6aa',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 6),
    'VY-619',
    'others'::resource_type,
    0,
    'REFUGE AREA',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4e8d8051-16ae-4112-a8ca-3f72c42b7b2d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-701',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Liberal Arts - Dadasaheb Phalke International Film Institute',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'e0ad11f0-5298-46b2-88d8-06130586d8b3',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-702',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Liberal Arts - Dadasaheb Phalke International Film Institute',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c8342c9c-a478-48f9-9a56-5e1480b8aeb5',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-703',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Liberal Arts - Dadasaheb Phalke International Film Institute',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '84b22626-b7fe-4206-b2ef-637679f57a09',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-704',
    'classroom'::resource_type,
    0,
    'CLASSROOM - Unallocated - Unallocated',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'c4d77fe1-7f8b-435f-87b8-1bf9aa7acde6',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-706',
    'others'::resource_type,
    0,
    'HOTEL MANAGEMENT - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4acd56c8-6dd9-4e6e-8d42-a0f7bdaa27d5',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-711',
    'others'::resource_type,
    0,
    'WASHING AREA - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'eb861a9c-109f-4cb5-9417-7f7d5d8918af',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-712',
    'others'::resource_type,
    0,
    'ADVANCED KITCHEN - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '5d50b74d-32a4-4fff-b21a-e319e658470f',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-713',
    'others'::resource_type,
    0,
    'BAKERY KITCHEN - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '09f8c757-7207-4eb0-9439-ac4e79a967e8',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-714',
    'others'::resource_type,
    0,
    'BASIC KITCHEN - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    'a3557988-9a53-4a6f-825e-6ee0a1c7038d',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-715',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '4eba2e2e-d586-4a97-92ad-25249b8d1461',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-716',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '8bad36bf-b8e7-43bc-ae8b-47e60d18f633',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-717',
    'classroom'::resource_type,
    0,
    'CLASSROOM - School of Business - Department of Hospitality Management',
    '',
    true
);

INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '7ea3d7f3-f63e-4624-8708-59b8fa9a05f7',
    '8c606b87-4104-49bb-b20d-468c3eb17923',
    (SELECT id FROM floors WHERE building_id = '8c606b87-4104-49bb-b20d-468c3eb17923' AND floor_number = 7),
    'VY-724',
    'others'::resource_type,
    0,
    'BREAKOUT AREA',
    '',
    true
);
