import csv

# Read CSV and generate SQL
with open('user details.csv', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    rows = list(reader)

# Generate SQL file
sql_lines = []
sql_lines.append("-- SQL Script to create profiles for ALL faculty users")
sql_lines.append("-- Run this AFTER create_users.sql has been executed")
sql_lines.append("-- Total profiles: {}".format(len(rows)))
sql_lines.append("")
sql_lines.append("-- Insert profiles one by one, linking to auth.users by email")
sql_lines.append("")

count = 0
for row in rows:
    name = row['name'].replace("'", "''")  # Escape single quotes
    email = row['email'].strip()
    university_id = row['university_id']
    gender = row['gender'].lower()  # Convert to lowercase for enum
    designation = row['designation'].replace("'", "''")
    department = row['department'].replace("'", "''")
    
    # Skip if email is empty
    if not email:
        continue
    
    count += 1
    sql = f"""INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, '{name}', '{email}', '{university_id}', '{gender}'::"gender", '{designation}', '{department}'
FROM auth.users WHERE LOWER(email) = LOWER('{email}')
ON CONFLICT (id) DO NOTHING;"""
    
    sql_lines.append(sql)
    sql_lines.append("")

sql_lines.append("-- Check total count")
sql_lines.append("SELECT 'Total profiles created:' as status, COUNT(*) as count FROM profiles;")

# Write to file
with open('create_profiles.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_lines))

print(f"Generated SQL for {count} profiles")
print("File saved: create_profiles.sql")
