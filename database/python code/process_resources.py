#!/usr/bin/env python3
"""
Script to process MITWPU Infrastructure CSV data and generate SQL inserts for resources table.
"""

import csv
import re
import uuid
from typing import Dict, Optional, Tuple

# Building name to UUID mapping from the buildings table
BUILDING_MAPPING = {
    'ABRAHAM': '6d12ade9-3a84-42d3-bca6-4ac8c03af07c',
    'AGASTYA': '3713d3a7-49c4-466b-9b5d-2820a77ed123', 
    'ARYABHAT': 'c9d8ab2a-d543-4e56-b83a-d667da55b399',
    'CHANAKYA': '07aaf60d-c6f5-4d0d-98f4-cefed8e99515',
    'VISHWAMITRA': '0af6bc0f-7e31-49d8-88a9-2ff414018fe5',
    'DHRUV - A': '0f4a93e5-0553-465e-89cc-2c09ec552b3a',
    'DHRUV A': '0f4a93e5-0553-465e-89cc-2c09ec552b3a',  # Alternative name
    'JAMADAGNI': '143b2629-557e-4b99-9027-8d3c3dbafd45',
    'AIR MONITORING STATION': '1543960e-98d6-403a-ad56-f46a6a2caeb2',
    'VIVEKANANDA': '1ec1f415-0a6f-4c35-a342-f7856c2e4341',
    'GAUTAM': '23e05a9b-668e-41a8-8a92-d093da273bed',
    'KABIR': '252b0f45-fdcd-4a12-963d-7ca482a16e4a',
    'MAITREYI': '306d2996-3a61-4b76-9392-aff2c2c58715',
    'DHRUV - PHARMACY': '3b67aa87-e11f-4b53-b006-25a022d3770f',
    'DHRUV-PHARMACY': '3b67aa87-e11f-4b53-b006-25a022d3770f',  # Alternative name
    'SHRIRAJ': '43b02b9f-9167-41c1-9d27-006b60fcdb76',
    'VISHWAKARMA': '497ee87e-246b-43ad-8f52-4b2d73d6d563',
    'MAHAVEER': '50361f54-40e7-4754-90ef-b8990a395484',
    'PRAYAG': '63b8917d-ddd1-49a6-8b91-493a39c72990',
    'KASHYAP': '6cff2fd8-bb31-47ab-8498-de5fc474249f',
    'DNYANESHWAR': '8169b223-2d9b-4d0d-9f20-fb1f0ff54925',
    'VYAS': '8c606b87-4104-49bb-b20d-468c3eb17923',
    'NANAK': '9a3a4999-9b0f-4519-a38d-3f87ab5e3fc4',
    'ATRI': '9df2f6de-5404-4974-9331-8a5d79ec93af',
    'GARGI': 'a452dea8-ac64-44ea-8780-e486682cc24b',
    'SECURITY VIGILANCE': 'af623ded-eade-4d00-a927-9d23e1da1c4f',
    'AVANTI': 'c2cd0170-9b2e-4354-984a-01309b084b55',
    'AKHADA': 'c786553d-fe99-4c42-b42d-fcef939476d3',
    'SARASWATI': 'db25c05d-9ec3-460c-812a-5970d855a023',
    'GANGA': 'e33ca139-eda0-4710-9fcc-72178f32e188',
    'BHARDWAJ': 'eb2405c3-f57b-4f84-a588-314e895d8166',
    'VASHISHTA': 'fa1893b7-b130-4a8d-a85c-9ec9a3d53f6d'
}

def parse_floor_number(floor_str: str) -> int:
    """Convert floor string to integer."""
    floor_str = floor_str.upper().strip()
    if floor_str in ['GF', 'G']:
        return 0
    elif floor_str.startswith('B'):
        # B1 -> -1, B2 -> -2, etc.
        num = re.search(r'(\d+)', floor_str)
        return -int(num.group(1)) if num else 0
    elif floor_str.endswith('F'):
        # 1F -> 1, 2F -> 2, etc.
        num = re.search(r'(\d+)', floor_str)
        return int(num.group(1)) if num else 0
    else:
        # Try to extract number directly
        num = re.search(r'(\d+)', floor_str)
        return int(num.group(1)) if num else 0

def categorize_resource_type(category_new: str) -> str:
    """Map Category_New to resource_type enum."""
    category_new = category_new.upper().strip()
    
    if 'CLASSROOM' in category_new:
        return 'classroom'
    elif any(keyword in category_new for keyword in ['LABORATORY', 'LAB']):
        return 'lab'
    elif any(keyword in category_new for keyword in ['SEMINAR HALL', 'DRAWING HALL', 'AUDITORIUM']):
        return 'hall'
    elif 'AUDITORIUM' in category_new:
        return 'auditorium'
    else:
        return 'others'

def clean_value(value: str) -> str:
    """Clean CSV values."""
    if not value or value.strip() in ['-', '']:
        return ''
    return value.strip().replace("'", "''")  # Escape single quotes for SQL

def extract_capacity(capacity_str: str) -> Optional[int]:
    """Extract numeric capacity."""
    if not capacity_str or capacity_str.strip() in ['-', '']:
        return None
    try:
        return int(capacity_str.strip())
    except ValueError:
        return None

def build_equipment_description(row: Dict[str, str]) -> str:
    """Build equipment description from various columns."""
    equipment = []
    
    # Add furniture info
    if row.get('Number of benches') and row['Number of benches'] not in ['-', '']:
        equipment.append(f"Benches: {row['Number of benches']}")
    if row.get('Chair') and row['Chair'] not in ['-', '']:
        equipment.append(f"Chairs: {row['Chair']}")
    if row.get('Number of Stools') and row['Number of Stools'] not in ['-', '']:
        equipment.append(f"Stools: {row['Number of Stools']}")
    
    # Add technology info
    if row.get('Smartboard') and row['Smartboard'] not in ['-', '', '0']:
        equipment.append(f"Smartboard: {row['Smartboard']}")
    if row.get('Smart TV') and row['Smart TV'] not in ['-', '', '0']:
        equipment.append(f"Smart TV: {row['Smart TV']}")
    if row.get('LED TV') and row['LED TV'] not in ['-', '', '0']:
        equipment.append(f"LED TV: {row['LED TV']}")
    if row.get('CCTV') and row['CCTV'] not in ['-', '', '0']:
        equipment.append(f"CCTV: {row['CCTV']}")
    if row.get('Computer/Laptop') and row['Computer/Laptop'] not in ['-', '', '0']:
        equipment.append(f"Computers: {row['Computer/Laptop']}")
    
    return ', '.join(equipment) if equipment else ''

def build_description(row: Dict[str, str]) -> str:
    """Build resource description."""
    parts = []
    
    # Add category info
    if row.get('Category'):
        parts.append(row['Category'])
    
    # Add school info
    if row.get('Name of School') and row['Name of School'] not in ['-', '']:
        parts.append(row['Name of School'])
    
    # Add department info  
    if row.get('Name of Department') and row['Name of Department'] not in ['-', '']:
        parts.append(row['Name of Department'])
    
    return ' - '.join(parts) if parts else ''

def get_floor_id_query(building_id: str, floor_number: int) -> str:
    """Generate subquery to get floor_id."""
    return f"""(SELECT id FROM floors WHERE building_id = '{building_id}' AND floor_number = {floor_number})"""

def process_csv_to_sql(csv_file_path: str, output_file_path: str):
    """Process CSV and generate SQL insert statements."""
    
    with open(csv_file_path, 'r', encoding='utf-8-sig') as csvfile:  # Use utf-8-sig to handle BOM
        # Read CSV with proper handling
        reader = csv.DictReader(csvfile)
        
        sql_statements = []
        sql_statements.append("-- Generated SQL for inserting resources from MITWPU Infrastructure Data")
        sql_statements.append("-- Run this script against your database")
        sql_statements.append("")
        
        processed_count = 0
        skipped_count = 0
        
        for row in reader:
            try:
                # Extract basic info
                room_no = clean_value(row.get('Room No.', ''))
                building_name = clean_value(row.get('Building Name', ''))
                floor_str = clean_value(row.get('Floor No.', ''))
                category_new = clean_value(row.get('Category_New', ''))
                
                # Skip if missing essential data
                if not room_no or not building_name or not category_new:
                    skipped_count += 1
                    continue
                
                # Skip non-academic spaces (washrooms, hostels, etc.)
                skip_categories = ['WASHROOM', 'HOSTEL', 'UTILITY ROOM', 'STORE', 'OFFICE', 'DINING HALL', 'CANTEEN', 'GUEST HOUSE']
                if any(skip_cat in category_new.upper() for skip_cat in skip_categories):
                    skipped_count += 1
                    continue
                
                # Also skip empty category_new
                if not category_new or category_new.strip() in ['-', '']:
                    skipped_count += 1
                    continue
                
                # Get building ID
                building_id = BUILDING_MAPPING.get(building_name)
                if not building_id:
                    print(f"Warning: Unknown building '{building_name}' for room {room_no}")
                    skipped_count += 1
                    continue
                
                # Parse floor number
                floor_number = parse_floor_number(floor_str)
                
                # Determine resource type
                resource_type = categorize_resource_type(category_new)
                
                # Extract capacity
                capacity = extract_capacity(row.get('Capacity', ''))
                
                # Build description and equipment
                description = build_description(row).replace("'", "''")  # Escape quotes
                equipment = build_equipment_description(row).replace("'", "''")  # Escape quotes
                
                # Generate SQL
                resource_id = str(uuid.uuid4())
                floor_id_query = get_floor_id_query(building_id, floor_number)
                
                sql = f"""INSERT INTO resources (id, building_id, floor_id, name, type, capacity, description, equipment, is_active) 
VALUES (
    '{resource_id}',
    '{building_id}',
    {floor_id_query},
    '{room_no}',
    '{resource_type}'::resource_type,
    {capacity if capacity is not None else 'NULL'},
    '{description}',
    '{equipment}',
    true
);"""
                
                sql_statements.append(sql)
                sql_statements.append("")
                processed_count += 1
                
            except Exception as e:
                print(f"Error processing row {row.get('Room No.', 'Unknown')}: {e}")
                skipped_count += 1
                continue
        
        # Write to output file
        with open(output_file_path, 'w', encoding='utf-8') as outfile:
            outfile.write('\n'.join(sql_statements))
        
        print(f"Generated SQL file: {output_file_path}")
        print(f"Processed: {processed_count} resources")
        print(f"Skipped: {skipped_count} records")

if __name__ == "__main__":
    csv_file = "/Users/subhajitdolai/Developer/Learning/campusbook/database/MITWPU Infra Space Data (23).csv"
    output_file = "/Users/subhajitdolai/Developer/Learning/campusbook/database/generated_resources_insert.sql"
    
    process_csv_to_sql(csv_file, output_file)
