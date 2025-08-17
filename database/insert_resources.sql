-- SQL script to insert resources from MITWPU Infrastructure Data
-- This script maps the CSV data to the resources table schema

-- First, let's create a temporary mapping view for buildings and floors
WITH building_mapping AS (
    SELECT 
        CASE 
            WHEN name = 'ABRAHAM' THEN '6d12ade9-3a84-42d3-bca6-4ac8c03af07c'
            WHEN name = 'AGASTYA' THEN '3713d3a7-49c4-466b-9b5d-2820a77ed123'
            WHEN name = 'ARYABHAT' THEN 'c9d8ab2a-d543-4e56-b83a-d667da55b399'
            WHEN name = 'CHANAKYA' THEN '07aaf60d-c6f5-4d0d-98f4-cefed8e99515'
            WHEN name = 'VISHWAMITRA' THEN '0af6bc0f-7e31-49d8-88a9-2ff414018fe5'
            WHEN name = 'DHRUV - A' THEN '0f4a93e5-0553-465e-89cc-2c09ec552b3a'
            WHEN name = 'JAMADAGNI' THEN '143b2629-557e-4b99-9027-8d3c3dbafd45'
            WHEN name = 'AIR MONITORING STATION' THEN '1543960e-98d6-403a-ad56-f46a6a2caeb2'
            WHEN name = 'VIVEKANANDA' THEN '1ec1f415-0a6f-4c35-a342-f7856c2e4341'
            WHEN name = 'GAUTAM' THEN '23e05a9b-668e-41a8-8a92-d093da273bed'
            WHEN name = 'KABIR' THEN '252b0f45-fdcd-4a12-963d-7ca482a16e4a'
            WHEN name = 'MAITREYI' THEN '306d2996-3a61-4b76-9392-aff2c2c58715'
            WHEN name = 'DHRUV - PHARMACY' THEN '3b67aa87-e11f-4b53-b006-25a022d3770f'
            WHEN name = 'SHRIRAJ' THEN '43b02b9f-9167-41c1-9d27-006b60fcdb76'
            WHEN name = 'VISHWAKARMA' THEN '497ee87e-246b-43ad-8f52-4b2d73d6d563'
            WHEN name = 'MAHAVEER' THEN '50361f54-40e7-4754-90ef-b8990a395484'
            WHEN name = 'PRAYAG' THEN '63b8917d-ddd1-49a6-8b91-493a39c72990'
            WHEN name = 'KASHYAP' THEN '6cff2fd8-bb31-47ab-8498-de5fc474249f'
            WHEN name = 'DNYANESHWAR' THEN '8169b223-2d9b-4d0d-9f20-fb1f0ff54925'
            WHEN name = 'VYAS' THEN '8c606b87-4104-49bb-b20d-468c3eb17923'
            WHEN name = 'NANAK' THEN '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4'
            WHEN name = 'ATRI' THEN '9df2f6de-5404-4974-9331-8a5d79ec93af'
            WHEN name = 'GARGI' THEN 'a452dea8-ac64-44ea-8780-e486682cc24b'
            WHEN name = 'SECURITY VIGILANCE' THEN 'af623ded-eade-4d00-a927-9d23e1da1c4f'
            WHEN name = 'AVANTI' THEN 'c2cd0170-9b2e-4354-984a-01309b084b55'
            WHEN name = 'AKHADA' THEN 'c786553d-fe99-4c42-b42d-fcef939476d3'
            WHEN name = 'SARASWATI' THEN 'db25c05d-9ec3-460c-812a-5970d855a023'
            WHEN name = 'GANGA' THEN 'e33ca139-eda0-4710-9fcc-72178f32e188'
            WHEN name = 'BHARDWAJ' THEN 'eb2405c3-f57b-4f84-a588-314e895d8166'
            WHEN name = 'VASHISHTA' THEN 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d'
        END as building_id,
        name as building_name
    FROM buildings
),
floor_mapping AS (
    SELECT 
        f.id as floor_id,
        f.building_id,
        f.floor_number,
        b.code as building_code
    FROM floors f
    JOIN buildings b ON f.building_id = b.id
)

-- Now insert resources based on the CSV data patterns
-- Note: This is a template - you'll need to process the actual CSV data

-- Sample inserts for different resource types based on Category_New field:

-- 1. CLASSROOM resources
INSERT INTO resources (building_id, floor_id, name, type, capacity, description, equipment, is_active)
SELECT 
    bm.building_id,
    fm.floor_id,
    'Room AB-002', -- This would come from "Room No." column
    'classroom'::resource_type,
    80, -- This would come from "Capacity" column
    'CLASSROOM - School of Engineering and Technology, FY B.TECH', -- Combination of Category and department info
    'Smartboard: 1, CCTV: 0', -- Equipment details from relevant columns
    true
FROM building_mapping bm
JOIN floor_mapping fm ON bm.building_id = fm.building_id
WHERE bm.building_name = 'ARYABHAT' AND fm.floor_number = 0; -- GF

-- 2. LABORATORY resources
INSERT INTO resources (building_id, floor_id, name, type, capacity, description, equipment, is_active)
SELECT 
    bm.building_id,
    fm.floor_id,
    'Room AT-B003',
    'lab'::resource_type,
    19,
    'PHOTOGRAPHY LAB - School of Liberal Arts, Department of Photography',
    'Computers: 18, Benches: 14, Chairs: 18',
    true
FROM building_mapping bm
JOIN floor_mapping fm ON bm.building_id = fm.building_id
WHERE bm.building_name = 'AGASTYA' AND fm.floor_number = -1; -- B1

-- 3. HALL/AUDITORIUM resources  
INSERT INTO resources (building_id, floor_id, name, type, capacity, description, equipment, is_active)
SELECT 
    bm.building_id,
    fm.floor_id,
    'Room AT-301',
    'hall'::resource_type,
    350,
    'READING HALL - Central Library',
    'Benches: 125, Chairs: 282, Stools: 35, CCTV: 10',
    true
FROM building_mapping bm
JOIN floor_mapping fm ON bm.building_id = fm.building_id
WHERE bm.building_name = 'AGASTYA' AND fm.floor_number = 3;

-- 4. OTHER resources (for rooms that don't fit standard categories)
INSERT INTO resources (building_id, floor_id, name, type, capacity, description, equipment, is_active)
SELECT 
    bm.building_id,
    fm.floor_id,
    'Room AT-004',
    'others'::resource_type,
    28,
    'CONFERENCE ROOM - Central Library',
    'Chairs: 28, Smartboard: 1, CCTV: 1',
    true
FROM building_mapping bm
JOIN floor_mapping fm ON bm.building_id = fm.building_id
WHERE bm.building_name = 'AGASTYA' AND fm.floor_number = 0;

-- Note: The above are sample inserts. To process the full CSV, you would need to:
-- 1. Clean the CSV data (handle special characters, empty values)
-- 2. Map floor numbers (1F->1, 2F->2, GF->0, B1->-1, etc.)
-- 3. Categorize resources based on Category_New field:
--    - CLASSROOM -> 'classroom'
--    - LABORATORY -> 'lab' 
--    - LIBRARY, READING HALL, BOOK RACK HALL -> 'hall'
--    - AUDITORIUM -> 'auditorium'
--    - Others -> 'others'
-- 4. Extract capacity from the "Capacity" column
-- 5. Build description from Category, School, Department
-- 6. Build equipment string from various equipment columns
