# CampusBook 📚

<div align="center">

![CampusBook Logo](/public/logo-light.webp)

**A modern university resource booking platform for educational institutions**

[![Original Project](https://img.shields.io/badge/Original-By%20Subhajit%20Dolai-purple.svg)](https://github.com/SubhajitDolai)
[![Next.js](https://img.shields.io/badge/Next.js-16-black)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.x-blue)](https://www.typescriptlang.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Database-darkgreen)](https://supabase.com/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-CSS-blue)](https://tailwindcss.com/)
[![React](https://img.shields.io/badge/React-19-61DAFB)](https://reactjs.org/)
[![Real-time](https://img.shields.io/badge/Real--time-Supabase%20Realtime-green)](https://supabase.com/realtime)
[![License](https://img.shields.io/badge/License-Proprietary-red.svg)](./LICENSE)

</div>

## 📋 Overview

CampusBook is a comprehensive full-stack web application designed to streamline the booking of campus resources such as classrooms, laboratories, seminar halls, auditoriums, and other facilities. Built specifically for educational institutions, CampusBook emphasizes:

- **User-friendly experience** with intuitive booking flows
- **Real-time availability** updates using Supabase Realtime
- **Role-based access control** for faculty and administrators
- **Multi-day & recurring bookings** with flexible weekday scheduling
- **Comprehensive admin dashboard** for resource and user management
- **Approval workflows** for booking requests
- **Personal calendar view** for faculty to track assigned classes

## ✨ Features

### For Faculty
- 🔐 **Secure Authentication** - Sign up & login with Supabase Auth
- 👤 **Profile Management** - Comprehensive onboarding flow with department, designation, and seating location
- 🎟️ **Intuitive Booking** - Book resources with date, time, subject, and class selection
- ⚡ **Live Updates** - Instant availability updates using Supabase Realtime
- 📅 **My Schedule** - Personal calendar view of all assigned classes and bookings
- 📋 **Booking History** - View past and current bookings with detailed status tracking
- ❌ **Easy Cancellation** - Cancel bookings with automatic status updates
- 📱 **Modern UI/UX** - Responsive design with dark/light mode support
- 🏢 **Building Explorer** - Browse resources by building, floor, and type
- 🔍 **Advanced Search** - Filter resources by type, building, capacity, and availability
- 📊 **Personal Dashboard** - View booking statistics and upcoming reservations

### For Administrators
- 🔑 **Role-based Access** - Admin panel with elevated privileges
- 📊 **Booking Management** - View and manage all bookings with comprehensive filters
- ✅ **Approval Workflow** - Approve or reject booking requests with one click
- 🏗️ **Resource Management** - Full CRUD operations for buildings, floors, and resources
- 👥 **User Management** - Approve faculty accounts, manage roles, ban users
- 📈 **Dashboard Analytics** - System overview with key metrics and recent activity
- 🔧 **Bulk Operations** - Create multiple bookings at once for class schedules
- 🏢 **Building Management** - Add, edit, and organize campus buildings
- 🏠 **Floor Management** - Manage floors within each building
- 📦 **Resource Configuration** - Set capacity, equipment, and availability status

### 📅 My Schedule Calendar
- **Personal Calendar View** - See all your assigned classes in a beautiful calendar interface
- **Multiple Views** - Switch between month, week, and day views
- **Color-coded Events** - Different colors for different booking statuses
- **Event Details** - Click on any booking to see full details
- **Real-time Sync** - Calendar updates automatically when new classes are assigned
- **IST Timezone Support** - All times displayed in Indian Standard Time

### 🔄 Recurring Booking System
- **Multi-day Bookings** - Book resources for date ranges
- **Weekly Recurrence** - Set bookings to repeat on specific weekdays
- **Flexible Scheduling** - Choose any combination of days (Mon-Sun)
- **Conflict Detection** - Automatic checking for overlapping bookings
- **Bulk Creation** - Create entire semester schedules at once

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| **Frontend** | Next.js 16 (App Router) with React 19 |
| **Language** | TypeScript 5.x with strict type checking |
| **Backend** | Supabase (PostgreSQL + Auth + Realtime) |
| **Styling** | Tailwind CSS 4 + shadcn/ui + tw-animate-css |
| **State Management** | React Hooks + Context API |
| **Icons** | Lucide React (consistent icon system) |
| **Authentication** | Supabase Auth with SSR support |
| **Database** | Supabase PostgreSQL with custom enums |
| **Real-time Updates** | Supabase Realtime subscriptions |
| **Toast Notifications** | Sonner for user feedback |
| **Animations** | Framer Motion + tw-animate-css |
| **Theme** | next-themes (dark/light mode with system detection) |
| **Charts** | Recharts for analytics visualization |
| **Calendar** | react-big-calendar with moment-timezone |
| **Forms** | React Hook Form + Zod validation |
| **Date Handling** | date-fns + moment-timezone (IST support) |
| **Carousel** | Embla Carousel + Swiper.js |

## 🗂️ Project Structure

```
/app
  /(auth)                    # Authentication pages
    /login                   # Sign in with email validation
    /signup                  # Registration with university email
    /forgot-password         # Password recovery flow
    /reset-password          # Password reset with token
    /set-password            # New password setup
    /onboarding              # Comprehensive profile setup
    /error                   # Authentication error handling
  /(main)                    # User-facing pages (protected)
    /dashboard               # Personal dashboard with stats
    /bookings                # Booking management
      /[bookingId]           # Individual booking details
    /buildings               # Building explorer
      /[buildingId]          # Building details
        /floors/[floorId]    # Floor resources
        /resources/[resourceId] # Resource booking form
    /resources               # Resource catalog with filters
    /my-schedule             # Personal calendar view
    /users                   # Faculty directory
    /profile                 # User profile management
      /edit                  # Profile editing
    /components              # Shared layout components
      /app-sidebar.tsx       # Navigation sidebar
  /admin                     # Admin dashboard (protected)
    /bookings                # Manage all bookings
    /bulk-bookings           # Bulk booking operations
    /buildings               # Building management
    /floors                  # Floor management
    /resources               # Resource management
    /users                   # User management
    /components              # Admin-specific components
  /api                       # API routes
    /check-user-exists       # User validation endpoint
  /auth                      # Auth callback handling
    /confirm                 # Email confirmation
  /banned                    # Restricted access page
/components                  # Reusable UI components
  /ui                        # shadcn/ui components (40+)
  /providers                 # Context providers
    /LoadingBarProvider      # Global loading state
  /logos                     # Brand logos
/hooks                       # Custom React hooks
  /use-debounce.ts           # Debounce hook
  /use-mobile.ts             # Mobile detection
/lib                         # Utility functions
  /utils.ts                  # General utilities (cn, etc.)
  /ist.ts                    # IST timezone helpers
  /status-utils.ts           # Booking status utilities
  /dynamic-status.ts         # Real-time status calculation
/utils/supabase              # Supabase client utilities
  /client.ts                 # Browser client
  /server.ts                 # Server client with SSR
  /middleware.ts             # Auth middleware
/database                    # Database schemas and scripts
  /schema.sql                # Main database schema
  /create_profiles.sql       # Profile creation scripts
  /create_users.sql          # User management scripts
/public                      # Static assets
  /logo-dark.webp            # Dark theme logo
  /logo-light.webp           # Light theme logo
  /team/                     # Team member photos
```

## 🧮 Database Schema

### Custom Enums

```sql
CREATE TYPE user_role AS ENUM ('faculty', 'admin', 'super_admin');
CREATE TYPE resource_type AS ENUM ('classroom', 'lab', 'hall', 'auditorium', 'others');
CREATE TYPE booking_status AS ENUM ('pending', 'approved', 'rejected', 'cancelled');
CREATE TYPE gender AS ENUM ('male', 'female', 'other');
CREATE TYPE resource_status AS ENUM ('Available', 'In Use', 'Maintenance', 'Unavailable');
```

### Core Tables

#### `profiles`
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Matches auth.users id |
| `name` | VARCHAR(255) | Full name |
| `email` | VARCHAR(255) | University email |
| `university_id` | VARCHAR(20) | Unique employee/student ID |
| `phone` | VARCHAR(15) | Contact number |
| `gender` | ENUM | male, female, other |
| `designation` | VARCHAR(100) | Job title |
| `department` | VARCHAR(100) | Department name |
| `role` | ENUM | faculty, admin, super_admin |
| `seating_location` | VARCHAR(255) | Office location details |
| `building_name` | VARCHAR(255) | Building where user sits |
| `floor_number` | INTEGER | Floor number |
| `room_number` | INTEGER | Room number |
| `cabin` | VARCHAR(50) | Cabin identifier |
| `cubicle` | VARCHAR(50) | Cubicle identifier |
| `workstation` | VARCHAR(50) | Workstation identifier |
| `approved` | BOOLEAN | Account approval status |
| `approved_by` | UUID (FK) | Admin who approved |
| `approved_at` | TIMESTAMPTZ | Approval timestamp |
| `created_at` | TIMESTAMPTZ | Account creation time |

#### `buildings`
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Building identifier |
| `name` | VARCHAR(255) | Building name |
| `code` | VARCHAR(10) | Unique building code |
| `description` | TEXT | Building description |
| `is_active` | BOOLEAN | Active status |
| `created_at` | TIMESTAMPTZ | Creation timestamp |

#### `floors`
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Floor identifier |
| `building_id` | UUID (FK) | Parent building |
| `floor_number` | INTEGER | Floor number |
| `name` | VARCHAR(100) | Floor name/label |
| `is_active` | BOOLEAN | Active status |
| `created_at` | TIMESTAMPTZ | Creation timestamp |

#### `resources`
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Resource identifier |
| `building_id` | UUID (FK) | Parent building |
| `floor_id` | UUID (FK) | Parent floor |
| `name` | VARCHAR(255) | Resource name |
| `type` | ENUM | classroom, lab, hall, auditorium, others |
| `capacity` | INTEGER | Seating capacity |
| `description` | TEXT | Resource description |
| `equipment` | TEXT | Available equipment |
| `is_active` | BOOLEAN | Active status |
| `status` | ENUM | Available, In Use, Maintenance, Unavailable |
| `created_at` | TIMESTAMPTZ | Creation timestamp |

#### `bookings`
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Booking identifier |
| `resource_id` | UUID (FK) | Booked resource |
| `user_id` | UUID (FK) | Booking owner |
| `start_date` | DATE | Booking start date |
| `end_date` | DATE | Booking end date |
| `start_time` | TIME | Daily start time |
| `end_time` | TIME | Daily end time |
| `reason` | TEXT | Booking purpose |
| `faculty_name` | VARCHAR(255) | Assigned faculty |
| `subject` | VARCHAR(255) | Subject/Course name |
| `class_name` | VARCHAR(255) | Class/Batch name |
| `status` | ENUM | pending, approved, rejected, cancelled |
| `weekdays` | INTEGER[] | Days of week (1-7) |
| `approved_by` | UUID (FK) | Approving admin |
| `approved_at` | TIMESTAMPTZ | Approval timestamp |
| `created_at` | TIMESTAMPTZ | Creation timestamp |

### User Roles & Permissions

| Role | Permissions |
|------|-------------|
| **Faculty** | Book resources, view personal bookings, view my schedule, browse resources |
| **Admin** | All faculty permissions + manage users, approve bookings, manage resources |
| **Super Admin** | Full system access including role management |

## 🚀 Getting Started

### Prerequisites
- Node.js (v18+)
- npm or pnpm
- Supabase account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/SubhajitDolai/campusbook.git
   cd campusbook
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Configure environment variables**
   
   Create a `.env.local` file in the project root:
   ```env
   # Supabase Configuration
   NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
   ```

4. **Set up the database**
   
   Run the SQL scripts in your Supabase SQL editor:
   ```bash
   # Execute in order:
   database/schema.sql
   database/create_profiles.sql
   ```

5. **Run the development server**
   ```bash
   npm run dev
   # Uses Turbopack for faster development
   ```

6. **Open your browser**
   
   Navigate to [http://localhost:3000](http://localhost:3000)

### Build for Production

```bash
npm run build
npm run start
```

## 🎨 UI Components

CampusBook uses **40+ shadcn/ui components** including:

- **Layout**: Sidebar, Navigation Menu, Breadcrumb, Separator
- **Forms**: Input, Select, Checkbox, Radio Group, Calendar, Date Picker
- **Feedback**: Alert, Alert Dialog, Toast (Sonner), Progress
- **Data Display**: Table, Card, Avatar, Badge, Chart
- **Overlay**: Dialog, Drawer, Popover, Tooltip, Hover Card
- **Navigation**: Tabs, Accordion, Collapsible, Pagination

## 📱 Responsive Design

- **Mobile-First**: Optimized for all device sizes
- **Dark Mode**: Full dark/light mode support with system detection
- **Animations**: Smooth transitions with Framer Motion
- **Accessibility**: WCAG compliant with Radix UI primitives

## 🔒 Security Features

- **Row Level Security (RLS)**: Database-level access control
- **Middleware Protection**: Route-level authentication checks
- **Session Management**: Secure cookie-based authentication
- **Role-based Access**: Granular permission system
- **User Approval Workflow**: Admin approval required for new accounts

## 📄 License

This software is under **Proprietary License**. All rights reserved by [Subhajit Dolai](https://github.com/SubhajitDolai).

See the [LICENSE](./LICENSE) file for complete terms.

---

<div align="center">
  <p><strong>Simplify your campus resource management</strong></p>
  <p>🏫 Built with ❤️ by <a href="https://github.com/SubhajitDolai">Subhajit Dolai</a></p>
</div>
