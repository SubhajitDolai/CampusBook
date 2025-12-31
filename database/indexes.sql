-- CampusBook Database Indexes
-- Run after schema.sql

-- Enable trigram extension for text search
CREATE EXTENSION IF NOT EXISTS pg_trgm;


-- BOOKINGS TABLE
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_resource_id ON bookings(resource_id);
CREATE INDEX IF NOT EXISTS idx_bookings_status ON bookings(status);
CREATE INDEX IF NOT EXISTS idx_bookings_dates ON bookings(start_date, end_date);
CREATE INDEX IF NOT EXISTS idx_bookings_resource_status_dates ON bookings(resource_id, status, start_date, end_date);
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON bookings(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_bookings_faculty_name ON bookings(faculty_name) WHERE faculty_name IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_bookings_class_name ON bookings(class_name);
CREATE INDEX IF NOT EXISTS idx_bookings_approved_by ON bookings(approved_by) WHERE approved_by IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_bookings_active ON bookings(resource_id, status, end_date) WHERE status IN ('pending', 'approved');


-- RESOURCES TABLE
CREATE INDEX IF NOT EXISTS idx_resources_building_id ON resources(building_id);
CREATE INDEX IF NOT EXISTS idx_resources_floor_id ON resources(floor_id);
CREATE INDEX IF NOT EXISTS idx_resources_type ON resources(type);
CREATE INDEX IF NOT EXISTS idx_resources_is_active ON resources(is_active);
CREATE INDEX IF NOT EXISTS idx_resources_status ON resources(status);
CREATE INDEX IF NOT EXISTS idx_resources_floor_active ON resources(floor_id, is_active);
CREATE INDEX IF NOT EXISTS idx_resources_building_type ON resources(building_id, type, is_active);
CREATE INDEX IF NOT EXISTS idx_resources_name_trgm ON resources USING gin(name gin_trgm_ops);


-- PROFILES TABLE
CREATE INDEX IF NOT EXISTS idx_profiles_role ON profiles(role);
CREATE INDEX IF NOT EXISTS idx_profiles_approved ON profiles(approved);
CREATE INDEX IF NOT EXISTS idx_profiles_email ON profiles(email);
CREATE INDEX IF NOT EXISTS idx_profiles_department ON profiles(department);
CREATE INDEX IF NOT EXISTS idx_profiles_role_approved ON profiles(role, approved);
CREATE INDEX IF NOT EXISTS idx_profiles_approved_by ON profiles(approved_by) WHERE approved_by IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_profiles_name_trgm ON profiles USING gin(name gin_trgm_ops);


-- FLOORS TABLE
CREATE INDEX IF NOT EXISTS idx_floors_building_id ON floors(building_id);
CREATE INDEX IF NOT EXISTS idx_floors_is_active ON floors(is_active);
CREATE INDEX IF NOT EXISTS idx_floors_building_active ON floors(building_id, is_active);


-- BUILDINGS TABLE
CREATE INDEX IF NOT EXISTS idx_buildings_is_active ON buildings(is_active);
CREATE INDEX IF NOT EXISTS idx_buildings_name_trgm ON buildings USING gin(name gin_trgm_ops);


-- PARTIAL INDEXES
CREATE INDEX IF NOT EXISTS idx_bookings_pending ON bookings(created_at DESC) WHERE status = 'pending';
CREATE INDEX IF NOT EXISTS idx_bookings_approved_current ON bookings(resource_id, start_date, end_date, start_time, end_time, weekdays) WHERE status = 'approved';
CREATE INDEX IF NOT EXISTS idx_profiles_pending_approval ON profiles(created_at DESC) WHERE approved = false;
