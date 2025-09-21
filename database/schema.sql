-- University Infrastructure Management/Booking System Schema
-- Foundation tables and types only

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create enums
CREATE TYPE user_role AS ENUM ('faculty', 'admin', 'super_admin');
CREATE TYPE resource_type AS ENUM ('classroom', 'lab', 'hall', 'auditorium', 'others');
CREATE TYPE booking_status AS ENUM ('pending', 'approved', 'rejected', 'cancelled');
CREATE TYPE gender AS ENUM ('male', 'female', 'other');

-- Resource status enum
CREATE TYPE resource_status AS ENUM ('Available', 'In Use', 'Maintenance', 'Unavailable');

-- Users table (extends auth.users)
CREATE TABLE profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  university_id VARCHAR(20) UNIQUE NOT NULL,
  phone VARCHAR(15),
  gender gender,
  designation VARCHAR(100),
  department VARCHAR(100) NOT NULL,
  role user_role NOT NULL DEFAULT 'faculty',
  seating_location VARCHAR(255),
  building_name VARCHAR(255),
  floor_number INTEGER,
  room_number INTEGER,
  cabin VARCHAR(50),
  cubicle VARCHAR(50),
  workstation VARCHAR(50),
  -- Approval workflow fields
  approved BOOLEAN NOT NULL DEFAULT false,
  approved_by UUID,
  approved_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Buildings table
CREATE TABLE buildings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  code VARCHAR(10) UNIQUE NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Floors table
CREATE TABLE floors (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  building_id UUID REFERENCES buildings(id) ON DELETE CASCADE,
  floor_number INTEGER NOT NULL,
  name VARCHAR(100),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(building_id, floor_number)
);

-- Resources table
CREATE TABLE resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  building_id UUID REFERENCES buildings(id) ON DELETE CASCADE,
  floor_id UUID REFERENCES floors(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  type resource_type NOT NULL,
  capacity INTEGER,
  description TEXT,
  equipment TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  status resource_status NOT NULL DEFAULT 'Available'
);

-- Bookings table
CREATE TABLE bookings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  reason TEXT NOT NULL,
  faculty_name VARCHAR(255),
  subject VARCHAR(255) NOT NULL,
  class_name VARCHAR(255) NOT NULL,
  status booking_status NOT NULL DEFAULT 'pending',
  weekdays INTEGER[] NOT NULL DEFAULT '{1,2,3,4,5,6,7}',
  approved_by UUID REFERENCES profiles(id),
  approved_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  CONSTRAINT check_weekdays CHECK (array_length(weekdays, 1) > 0 AND array_length(weekdays, 1) <= 7)
); 