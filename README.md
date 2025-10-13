# CampusBook 📚

<div align="center">

![CampusBook Logo](/public/logo-light.webp)

**A Modern University Resource Booking System**

[![Next.js](https://img.shields.io/badge/Next.js-15.5.2-black?style=flat-square&logo=next.js)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?style=flat-square&logo=typescript)](https://www.typescriptlang.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Backend-green?style=flat-square&logo=supabase)](https://supabase.com/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-4-06B6D4?style=flat-square&logo=tailwindcss)](https://tailwindcss.com/)
[![React](https://img.shields.io/badge/React-19.1.0-61DAFB?style=flat-square&logo=react)](https://reactjs.org/)

*Streamline campus resource management with instant booking, real-time availability, approval workflows, and comprehensive admin tools*

</div>

---

## 🌟 Overview

CampusBook is a comprehensive university resource booking system designed for educational institutions of all sizes. Built with cutting-edge web technologies, it provides an intuitive platform for faculty members to reserve classrooms, laboratories, halls, and other campus facilities, while offering administrators powerful tools to manage users, approve bookings, and optimize resource utilization.

### ✨ Key Features

#### 🎯 Core Booking Features
- **🚀 Instant Booking** - Reserve any campus space with a streamlined form
- **⏰ Real-Time Availability** - Dynamic status calculation based on approved bookings
- **📅 Multi-Day & Recurring Bookings** - Support for single-day, multi-day, and weekly recurring bookings
- **🔄 Flexible Scheduling** - Custom weekday selection for recurring bookings
- **� IST Time Zone Support** - Accurate time handling for Indian Standard Time

#### 👥 User Management & Security  
- **🔐 Role-Based Access Control** - Faculty, Admin, and Super Admin roles
- **✅ User Approval Workflow** - Admin approval required for new faculty accounts
- **🎓 University Email Validation** - Configurable domain restrictions for institutional emails
- **📝 Comprehensive Onboarding** - Detailed profile setup with seating location tracking

#### 🏢 Resource Management
- **🏗️ Multi-Building Architecture** - Support for multiple buildings and floors
- **� Advanced Filtering** - Filter by resource type, building, status, and search terms
- **📊 Dynamic Status Display** - Real-time availability based on current bookings
- **📋 Rich Resource Details** - Capacity, equipment, and location information
- **� Resource Analytics** - Usage statistics and booking patterns

#### 🛠️ Administrative Tools
- **👨‍💼 User Management** - Approve/unapprove users, promote to admin roles
- **📊 Admin Dashboard** - System overview with key metrics and recent activity
- **🔧 Bulk Operations** - Bulk booking management and administrative actions
- **📋 Comprehensive Reporting** - Detailed booking reports and system analytics

#### 💻 Technical Features
- **📱 Mobile-First Design** - Fully responsive interface optimized for all devices
- **🎨 Modern UI/UX** - Built with shadcn/ui components and Tailwind CSS
- **⚡ Performance Optimized** - Next.js 15 with Turbopack for lightning-fast development
- **🔄 Real-Time Updates** - Supabase real-time subscriptions for live data
- **🌙 Dark Mode Support** - System, light, and dark theme options

---

## 🏗️ Architecture

### Tech Stack

#### Frontend
- **Framework**: Next.js 15.5.2 with App Router and Server Components
- **Language**: TypeScript 5 with strict mode configuration
- **Styling**: Tailwind CSS 4 with CSS Variables and PostCSS
- **UI Components**: shadcn/ui (Radix UI primitives) with New York style
- **Animations**: Framer Motion 12.23.9 and Swiper.js for carousels
- **Forms**: React Hook Form 7.61.1 with Zod 4.0.10 validation
- **State Management**: React 19.1.0 hooks with server actions
- **Icons**: Lucide React 0.526.0
- **Charts**: Recharts 2.15.4 for analytics visualization

#### Backend & Database
- **Backend-as-a-Service**: Supabase with SSR support (@supabase/ssr)
- **Database**: PostgreSQL with comprehensive schema and enums
- **Authentication**: Supabase Auth with email/password and middleware protection
- **Real-time**: Supabase Realtime for live booking updates
- **Time Zone**: Custom IST (Indian Standard Time) helpers for accurate scheduling
- **Dynamic Status**: Real-time resource availability calculation

#### Development & Deployment
- **Package Manager**: npm with package-lock.json
- **Linting**: ESLint 9 with Next.js TypeScript configuration
- **Type Checking**: TypeScript with path aliases and strict configuration
- **Development Server**: Next.js Dev with Turbopack support
- **Build Tool**: Next.js optimized build system
- **Code Quality**: Prettier-compatible setup with shadcn/ui standards

#### Key Dependencies
- **Date Handling**: date-fns 4.1.0 and moment-timezone 0.6.0
- **Calendar**: react-big-calendar 1.19.4 and react-day-picker 9.8.1
- **Notifications**: Sonner 2.0.6 for toast messages  
- **Carousel**: embla-carousel-react 8.6.0
- **Theming**: next-themes 0.4.6 for dark mode support
- **Utility**: class-variance-authority 0.7.1 and clsx 2.1.1

### Project Structure

```
campusbook/
├── app/                              # Next.js App Router
│   ├── layout.tsx                   # Root layout with providers
│   ├── page.tsx                     # Landing page (HomeShell)
│   ├── globals.css                  # Global styles and CSS variables
│   ├── (auth)/                      # Authentication route group
│   │   ├── layout.tsx              # Auth layout with theme toggle
│   │   ├── login/                  # Sign in with email validation
│   │   │   ├── actions.ts          # Login/signup/logout actions
│   │   │   ├── page.tsx            # Login page with form
│   │   │   └── components/         # LoginForm component
│   │   ├── signup/                 # User registration (university domain)
│   │   ├── forgot-password/        # Password recovery flow
│   │   ├── reset-password/         # Password reset with token
│   │   ├── set-password/           # New password setup
│   │   ├── onboarding/             # Comprehensive user profile setup
│   │   │   ├── actions.ts          # Profile creation logic
│   │   │   ├── page.tsx            # Onboarding form
│   │   │   └── components/         # OnboardingForm with validation
│   │   └── error/                  # Authentication error pages
│   ├── (main)/                     # Protected main application
│   │   ├── components/             # Shared components (app-sidebar)
│   │   ├── dashboard/              # Personal dashboard with analytics
│   │   │   ├── actions.ts          # Dashboard data fetching
│   │   │   ├── page.tsx            # Dashboard layout
│   │   │   └── components/         # Stats, recent bookings, charts
│   │   ├── bookings/               # Personal booking management
│   │   │   ├── actions.ts          # User booking operations
│   │   │   ├── page.tsx            # Booking list with tabs
│   │   │   ├── utils.ts            # Booking utility functions
│   │   │   ├── [bookingId]/        # Individual booking details
│   │   │   └── components/         # BookingCard, filters, spinners
│   │   ├── buildings/              # Building and resource exploration
│   │   │   ├── actions.ts          # Building data fetching
│   │   │   ├── page.tsx            # Building listing
│   │   │   └── [buildingId]/       # Individual building pages
│   │   │       ├── page.tsx        # Building overview
│   │   │       ├── floors/         # Floor-based navigation
│   │   │       │   └── [floorId]/  # Floor resources and booking
│   │   │       └── resources/      # Resource-based navigation
│   │   │           └── [resourceId]/ # Resource details and booking
│   │   ├── resources/              # Resource catalog with filtering
│   │   │   ├── actions.ts          # Resource search and filtering
│   │   │   ├── page.tsx            # Resource grid with pagination
│   │   │   └── components/         # ResourceCard, filters, skeletons
│   │   ├── users/                  # Faculty directory
│   │   │   ├── actions.ts          # User search functionality
│   │   │   ├── page.tsx            # User listing with search
│   │   │   ├── [userId]/           # Individual user profiles
│   │   │   └── components/         # UserCard, search filters
│   │   └── profile/                # Personal profile management
│   │       ├── actions.ts          # Profile update operations
│   │       ├── page.tsx            # Profile view
│   │       ├── edit/               # Profile editing
│   │       └── components/         # Profile forms and displays
│   ├── admin/                      # Administrative interface
│   │   ├── layout.tsx              # Admin layout with sidebar
│   │   ├── page.tsx                # Admin dashboard with metrics
│   │   ├── actions.ts              # Admin dashboard data
│   │   ├── components/             # Admin-specific components
│   │   ├── users/                  # User management and approval
│   │   ├── buildings/              # Building administration
│   │   ├── floors/                 # Floor management
│   │   ├── resources/              # Resource administration
│   │   ├── bookings/               # Booking oversight and approval
│   │   └── bulk-bookings/          # Bulk booking operations
│   ├── api/                        # API routes
│   │   └── check-user-exists/      # User existence validation
│   └── auth/                       # Supabase auth callbacks
│       └── confirm/                # Email confirmation handling
├── components/                      # Reusable UI components
│   ├── ui/                         # shadcn/ui base components (50+ components)
│   ├── providers/                  # Context providers (LoadingBar, Theme)
│   ├── logos/                      # Brand and integration logos
│   ├── home-shell.tsx              # Landing page composition
│   ├── hero-section.tsx            # Interactive hero with carousel
│   ├── features-4.tsx              # Feature showcase sections
│   ├── team.tsx                    # Team member profiles
│   ├── faqs-3.tsx                  # Frequently asked questions
│   └── ...                         # Additional landing page components
├── database/                        # Database management
│   ├── schema.sql                  # Complete PostgreSQL schema with enums
│   ├── process_resources.py        # CSV import processing script
│   ├── generated_resources_insert.sql # Sample university resources data
│   ├── resources_import_summary.md # Detailed import documentation
│   └── *.csv                       # Source data files
├── hooks/                          # Custom React hooks
│   ├── use-debounce.ts            # Input debouncing for search
│   └── use-mobile.ts              # Responsive design utilities
├── lib/                            # Core utility functions
│   ├── utils.ts                   # Tailwind class merging (cn function)
│   ├── ist.ts                     # IST timezone handling utilities
│   ├── dynamic-status.ts          # Real-time resource status calculation
│   └── status-utils.ts            # Booking status utilities
├── utils/supabase/                 # Supabase client configuration
│   ├── client.ts                  # Browser client setup
│   ├── server.ts                  # Server-side client with cookies
│   └── middleware.ts              # Authentication middleware
├── middleware.ts                   # Next.js middleware for auth protection
├── public/                         # Static assets
│   ├── logo-*.webp               # Brand logos (light/dark variants)
│   ├── team/                     # Team member photos
│   └── building.webp             # Hero background image
├── components.json                 # shadcn/ui configuration
├── package.json                    # Dependencies and scripts
├── tsconfig.json                   # TypeScript configuration
├── postcss.config.mjs             # PostCSS with Tailwind
├── eslint.config.mjs              # ESLint configuration
└── next.config.ts                 # Next.js configuration
```

---

## 🚀 Quick Start

### Prerequisites

- **Node.js** 18.17 or later
- **npm** or **yarn** package manager
- **Supabase** account and project
- **Git** for version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/SubhajitDolai/CampusBook.git
   cd CampusBook
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Environment Setup**
   
   Create a `.env.local` file in the root directory:
   ```env
   # Supabase Configuration
   NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
   
   # Next.js Configuration
   NEXTAUTH_URL=http://localhost:3000
   NEXTAUTH_SECRET=your_nextauth_secret
   ```

4. **Database Setup**
   
   Run the SQL schema in your Supabase dashboard:
   ```bash
   # Import the schema from database/schema.sql
   # Set up Row Level Security policies
   # Insert initial data if needed
   ```

5. **Start Development Server**
   ```bash
   npm run dev
   # or
   yarn dev
   ```

6. **Open in Browser**
   
   Navigate to [http://localhost:3000](http://localhost:3000)

---

## 📖 Documentation

### User Roles & Permissions

#### 👨‍🏫 Faculty Members (Default Role)
- **Account Setup**: Complete onboarding with university ID and seating location
- **Booking Creation**: Create single-day, multi-day, and recurring bookings  
- **Booking Management**: View, cancel own bookings (pending/approved only)
- **Resource Discovery**: Browse and filter available campus resources
- **Dashboard Access**: Personal analytics, booking history, and quick stats
- **Profile Management**: Update personal information and seating details
- **Directory Access**: View other faculty members and their information
- **Status**: Requires admin approval before creating bookings

#### 👨‍💼 Administrators  
- **User Management**: Approve/unapprove faculty accounts and view user directory
- **Booking Oversight**: View all system bookings with detailed information
- **Resource Administration**: Manage campus resources (view-only interface)  
- **Admin Dashboard**: System-wide metrics and recent booking activity
- **Bulk Operations**: Perform administrative actions on multiple records
- **Faculty Directory**: Access to comprehensive user information and statistics
- **Approval Workflow**: Approve or reject pending faculty registrations

#### 🔑 Super Administrators
- **Full User Control**: All admin capabilities plus user role promotion/demotion
- **System Configuration**: Manage buildings, floors, and resource infrastructure  
- **Role Management**: Promote faculty to admin status and demote admins
- **Data Administration**: Database operations and system maintenance
- **Advanced Analytics**: Comprehensive system reporting and usage statistics
- **Import/Export**: Bulk data operations and system migrations
- **Security Oversight**: Monitor system access and user activity

#### 🔒 Security Model
- **University Email Restriction**: Configurable domain restrictions for institutional emails
- **Approval Workflow**: New faculty require admin approval before booking
- **Server-Side Validation**: All booking operations validated on server
- **Role-Based UI**: Interface adapts based on user permissions
- **Session Management**: Secure authentication with Supabase middleware

### Core Features Deep Dive

#### 🏢 Resource Infrastructure Management
- **Hierarchical Organization**: Buildings → Floors → Resources with UUID relationships
- **Resource Categories**: Classroom, Laboratory, Hall, Auditorium, Others (enum-based)
- **Comprehensive Details**: Capacity, equipment lists, descriptions, and specifications
- **Status Management**: Available, In Use, Maintenance, Unavailable with dynamic calculation
- **Search & Filter**: Multi-criteria filtering by type, building, status, and text search
- **Equipment Tracking**: Comma-separated equipment lists with parsing and display

#### 📅 Advanced Booking System
- **Flexible Scheduling**: Single-day, multi-day, and weekly recurring bookings
- **Weekday Selection**: Custom weekday arrays (1=Sunday, 2=Monday, etc.)
- **Time Zone Accuracy**: IST (Indian Standard Time) handling with custom utilities
- **Booking Details**: Faculty name, subject, class name, and reason tracking
- **Status Workflow**: Pending → Approved/Rejected → Cancelled state management
- **Conflict Prevention**: Real-time availability checking based on approved bookings only
- **Dynamic Status**: Live calculation of resource availability during booking periods

#### 👥 User Management & Onboarding
- **Comprehensive Profiles**: University ID, department, designation, seating location
- **Seating Tracking**: Building, floor, room, cabin/cubicle/workstation details
- **Approval Workflow**: Admin approval required for new faculty before booking
- **Role Management**: Faculty → Admin → Super Admin promotion/demotion system
- **Email Validation**: Configurable university email domain restrictions
- **Profile Completion**: Required onboarding step with validation

#### 🔄 Real-Time Features
- **Dynamic Status Calculation**: Resource availability based on current IST time and bookings
- **Live Updates**: Real-time booking status changes and resource availability
- **Instant Feedback**: Immediate validation and conflict detection
- **Session Management**: Secure authentication state across all pages
- **Responsive Data**: Automatic updates when bookings are created/modified

---

## 🛠️ Development Guide

### Key Implementation Details

#### Authentication & Authorization Flow
```typescript
// Middleware protection for all routes
// Files: middleware.ts, utils/supabase/middleware.ts

// 1. Route-based protection
- Authenticated users: Redirect away from auth pages  
- Unauthenticated users: Redirect to /login
- Special handling for password reset tokens

// 2. Role-based redirects after login
- Faculty → Dashboard (/)  
- Admin/Super Admin → Admin Panel (/admin)
- Incomplete profiles → Onboarding (/onboarding)

// 3. Server action protection
export async function createBooking(formData: FormData) {
  // Verify user authentication
  const { data: { user } } = await supabase.auth.getUser()
  
  // Check approval status
  const { data: profile } = await supabase
    .from('profiles')
    .select('approved')
    .eq('id', user.id)
    .single()
    
  if (!profile?.approved) {
    return { error: 'Account pending approval' }
  }
  // ... proceed with booking creation
}
```

#### IST Time Zone Handling
```typescript
// Files: lib/ist.ts, lib/dynamic-status.ts

// Deterministic IST conversion avoiding locale parsing
export function getISTDateString(d = new Date()): string {
  const parts = getISTParts(d)
  return `${parts.year}-${String(parts.month).padStart(2, '0')}-${String(parts.day).padStart(2, '0')}`
}

// Dynamic resource status calculation
export function calculateDynamicStatus(
  manualStatus: string | null,
  bookings: Booking[] = []
): string {
  const currentDate = getISTDateString() // IST date
  const currentTime = getISTTimeString() // IST time  
  const currentDayOfWeek = getISTDayOfWeek() // 1=Sun, 2=Mon, etc.
  
  // Check if resource is currently in use based on APPROVED bookings only
  const isCurrentlyInUse = bookings.some(booking => {
    return booking.status === 'approved' && 
           isWithinDateRange && 
           isCurrentDaySelected && 
           isWithinTimeRange
  })
  
  return isCurrentlyInUse ? 'In Use' : 'Available'
}
```

#### Database Integration Patterns
```typescript
// Optimized data fetching with single queries
export async function getAllDashboardData() {
  // Single auth check
  const { data: { user } } = await supabase.auth.getUser()
  
  // Parallel queries for better performance
  const [bookingsResult, resourcesCountResult] = await Promise.all([
    supabase.from('bookings').select(`...`).eq('user_id', user.id),
    supabase.from('resources').select('*', { count: 'exact', head: true })
  ])
  
  // Transform data once, calculate multiple metrics
  const stats = calculateDashboardStats(bookings)
  const recentBookings = bookings.slice(0, 5)
  return { stats, recentBookings }
}
```

### Development Workflow

#### 1. Feature Development
- **Server Actions**: All data mutations use server actions (not API routes)
- **Error Handling**: Comprehensive try-catch with user-friendly messages  
- **Loading States**: Skeleton components and loading spinners
- **Validation**: Zod schemas for form validation and type safety

#### 2. Database Operations
- **Approved Bookings Only**: Resource status based only on approved bookings
- **UUID Relations**: All foreign keys use UUIDs for better security
- **Enum Consistency**: Use database enums for type safety
- **IST Timestamps**: Always use IST helpers for date/time operations

#### 3. UI/UX Standards
- **shadcn/ui Components**: Consistent design system usage
- **Responsive Design**: Mobile-first approach with Tailwind CSS
- **Dark Mode**: Support for system, light, and dark themes
- **Error Boundaries**: Graceful error handling with fallback UI

### Recommended Enhancements

#### Security Improvements
1. **Row Level Security (RLS)**
   ```sql
   -- Add RLS policies to prevent unauthorized access
   ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
   
   CREATE POLICY "Users can view own bookings" ON bookings
     FOR SELECT USING (auth.uid() = user_id);
     
   CREATE POLICY "Approved users can create bookings" ON bookings
     FOR INSERT WITH CHECK (
       auth.uid() = user_id AND 
       EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND approved = true)
     );
   ```

2. **API Rate Limiting**: Add rate limiting for server actions
3. **Input Sanitization**: Enhanced XSS protection for user inputs
4. **Audit Logging**: Track all administrative actions

#### Performance Optimizations  
1. **Database Indexing**: Add indexes for frequently queried columns
2. **Caching**: Implement Redis caching for resource data
3. **Image Optimization**: Use Next.js Image component with proper sizing
4. **Bundle Analysis**: Regular bundle size monitoring and optimization

#### Feature Additions
1. **Email Notifications**: Booking confirmations and reminders
2. **Calendar Integration**: Export to Google Calendar/Outlook
3. **Bulk Booking**: Multi-resource booking in single transaction
4. **Resource Templates**: Predefined booking templates for common use cases
5. **Mobile App**: React Native app with push notifications


#### 📊 Analytics & Reporting
- **Personal Dashboard**: Booking statistics, quick stats, and activity overview
- **Admin Analytics**: System-wide metrics, user statistics, and resource utilization  
- **Real-Time Metrics**: Live counts of bookings, users, buildings, and resources
- **Historical Data**: Past booking analysis and usage patterns
- **Quick Stats**: Today/week/month booking counts and average durations
- **Favorite Analysis**: Most-used buildings and resources per user

#### 🔐 Security & Data Protection
- **Supabase Authentication**: Email/password with secure session management
- **Role-Based Access Control**: Granular permissions based on user roles
- **Server-Side Validation**: All critical operations validated on server
- **Middleware Protection**: Route-level authentication and authorization
- **Input Validation**: Comprehensive validation using Zod schemas
- **University Email Only**: Configurable domain restrictions for institutional emails
- **Approval Gates**: Admin approval required for critical operations

#### 🎨 User Experience & Interface
- **Modern Design System**: shadcn/ui components with consistent styling
- **Responsive Layout**: Mobile-first design that works on all devices
- **Dark Mode Support**: System, light, and dark theme options
- **Loading States**: Skeleton loaders and progress indicators
- **Error Handling**: Comprehensive error boundaries and user feedback
- **Toast Notifications**: Real-time feedback for user actions
- **Intuitive Navigation**: Sidebar navigation with breadcrumbs and clear hierarchy

### Database Schema

#### Core Tables

```sql
-- User profiles (extends Supabase auth.users)
CREATE TABLE profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  university_id VARCHAR(20) UNIQUE NOT NULL,
  phone VARCHAR(15),
  gender gender,  -- ENUM: male, female, other
  designation VARCHAR(100),
  department VARCHAR(100) NOT NULL,
  role user_role NOT NULL DEFAULT 'faculty',  -- ENUM: faculty, admin, super_admin
  seating_location VARCHAR(255),
  building_name VARCHAR(255),
  floor_number INTEGER,
  room_number INTEGER,
  cabin VARCHAR(50),
  cubicle VARCHAR(50),
  workstation VARCHAR(50),
  approved BOOLEAN NOT NULL DEFAULT false,
  approved_by UUID,
  approved_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Building infrastructure
CREATE TABLE buildings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  code VARCHAR(10) UNIQUE NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE floors (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  building_id UUID REFERENCES buildings(id) ON DELETE CASCADE,
  floor_number INTEGER NOT NULL,
  name VARCHAR(100),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(building_id, floor_number)
);

-- Resources (with sample university data)
CREATE TABLE resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  building_id UUID REFERENCES buildings(id) ON DELETE CASCADE,
  floor_id UUID REFERENCES floors(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  type resource_type NOT NULL,  -- ENUM: classroom, lab, hall, auditorium, others
  capacity INTEGER,
  description TEXT,
  equipment TEXT,  -- Comma-separated list
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  status resource_status NOT NULL DEFAULT 'Available'  -- ENUM: Available, In Use, Maintenance, Unavailable
);

-- Bookings with approval workflow
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
  status booking_status NOT NULL DEFAULT 'pending',  -- ENUM: pending, approved, rejected, cancelled
  weekdays INTEGER[] NOT NULL DEFAULT '{1,2,3,4,5,6,7}',  -- 1=Sunday, 2=Monday, etc.
  approved_by UUID REFERENCES profiles(id),
  approved_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

#### Key Features of Schema
- **UUID Primary Keys**: All tables use UUIDs for better security and distribution
- **Enum Types**: Strongly typed enums for roles, resource types, and statuses
- **Approval Workflow**: Built-in approval tracking with approver and timestamp
- **Flexible Weekdays**: Array support for recurring booking patterns
- **Seating Location**: Detailed workspace tracking for faculty
- **Cascading Deletes**: Proper foreign key relationships with cleanup
- **IST Timestamps**: All timestamps use PostgreSQL TIMESTAMP WITH TIME ZONE

---

## 🚀 Deployment

### Production Deployment

#### Vercel Deployment (Recommended)

1. **Repository Setup**
   ```bash
   # Fork the repository to your GitHub account
   # Or push your local repository to GitHub
   git remote add origin https://github.com/your-username/campusbook.git
   git push -u origin main
   ```

2. **Vercel Configuration**
   - Visit [vercel.com](https://vercel.com) and import your repository
   - Configure environment variables in Vercel dashboard:
   ```bash
   NEXT_PUBLIC_SUPABASE_URL=your-production-supabase-url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-production-supabase-anon-key
   NEXT_PUBLIC_APP_ENV=production
   ```

3. **Build Settings**
   - Framework Preset: Next.js
   - Build Command: `npm run build`
   - Output Directory: `.next`
   - Install Command: `npm install`

#### Alternative Deployment Options

**Docker Deployment**
```dockerfile
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:18-alpine AS builder  
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN npm run build

FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV production
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD ["npm", "start"]
```

**Manual Server Deployment**
```bash
# On your server
git clone https://github.com/your-username/campusbook.git
cd campusbook
npm install
npm run build

# Set up environment variables
echo "NEXT_PUBLIC_SUPABASE_URL=your-url" > .env.local
echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=your-key" >> .env.local

# Start with PM2 (recommended)
npm install -g pm2
pm2 start npm --name "campusbook" -- start
pm2 save
pm2 startup
```

#### Production Database Setup

   - Create a new project at [supabase.com](https://supabase.com)
   - Choose a production-appropriate region (e.g., Asia-Southeast-1 for India)
   - Note down the project URL and anon key

2. **Execute Database Schema**
   ```sql
   -- In Supabase SQL Editor, execute:
   -- 1. Complete schema from database/schema.sql
   -- 2. Resource data from database/generated_resources_insert.sql (optional)
   -- 3. Create initial super admin user
   ```

3. **Configure Authentication**
   - Enable email/password authentication
   - Set up email templates (optional)
   - Configure redirect URLs for your domain

4. **Set Up Row Level Security (Recommended)**
   ```sql
   -- Enable RLS on sensitive tables
   ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
   ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
   
   -- Add appropriate policies
   CREATE POLICY "Users can view own profile" ON profiles
     FOR SELECT USING (auth.uid() = id);
   ```

#### Post-Deployment Checklist

- [ ] Verify all environment variables are set correctly
- [ ] Test authentication flow (signup, login, logout)
- [ ] Create initial super admin account
- [ ] Configure email domain for your institution
- [ ] Import your institution's buildings and resources
- [ ] Test booking creation and approval workflow  
- [ ] Verify email restrictions work with your domain
- [ ] Configure timezone for your location
- [ ] Update branding (logos, colors, institution name)
- [ ] Check responsive design on various devices
- [ ] Test dark mode functionality
- [ ] Verify timezone calculations for your region
- [ ] Set up institutional user accounts
- [ ] Configure admin approval workflows
- [ ] Monitor application performance and errors
- [ ] Set up monitoring and alerting (optional)

---

## 🤝 Contributing

We welcome contributions from the community! CampusBook is built for educational institutions and benefits from diverse perspectives.

### Contributing Guidelines

#### 1. Setting Up Development Environment
```bash
# Fork and clone the repository
git clone https://github.com/your-username/CampusBook.git  
cd CampusBook

# Install dependencies
npm install

# Set up environment variables (see Installation section)
cp .env.example .env.local

# Start development server
npm run dev
```

#### 2. Development Standards
- **Code Style**: Follow existing TypeScript and React patterns
- **Components**: Use shadcn/ui components for consistency
- **Server Actions**: Prefer server actions over API routes for mutations
- **Error Handling**: Always implement comprehensive error handling
- **Type Safety**: Maintain strict TypeScript compliance
- **Responsive Design**: Mobile-first approach with Tailwind CSS

#### 3. Testing Your Changes
```bash
# Type checking and linting
npm run lint
npm run build

# Manual testing checklist
- [ ] Authentication flow (login/signup/logout)
- [ ] Booking creation and cancellation
- [ ] Admin approval workflow
- [ ] Responsive design on mobile/tablet/desktop
- [ ] Dark mode functionality
- [ ] IST timezone accuracy
```

#### 4. Submitting Contributions
```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make your changes with clear, descriptive commits
git commit -m "feat: add recurring booking patterns"

# Push to your fork
git push origin feature/your-feature-name

# Create Pull Request with:
# - Clear description of changes
# - Screenshots/videos for UI changes  
# - Test cases covered
# - Breaking changes (if any)
```

### Areas for Contribution

#### 🐛 Bug Reports & Fixes
- Authentication edge cases and timezone handling issues
- UI/UX improvements and accessibility enhancements
- Performance optimization and code quality improvements

#### ✨ Feature Requests
- Email notification system and calendar integration
- Mobile app development (React Native)
- Advanced analytics, reporting, and bulk operations
- Resource recommendation engine and multi-campus support

### Code Style Guidelines

- **TypeScript**: Use strict typing, avoid `any`
- **Components**: Prefer functional components with hooks
- **Styling**: Use Tailwind CSS classes, avoid inline styles
- **Naming**: Use descriptive names for variables and functions
- **Comments**: Add JSDoc comments for complex functions

### Bug Reports

When reporting bugs, please include:
- **Environment**: OS, browser, Node.js version
- **Steps to Reproduce**: Clear, numbered steps
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **Screenshots**: If applicable

---

## 📋 Roadmap

### 🎯 Current Release (v1.0) - Production Ready
- ✅ **Complete Booking System**: Single-day, multi-day, and recurring bookings
- ✅ **User Management**: Role-based access with approval workflow
- ✅ **Resource Management**: Comprehensive resource catalog with real-time availability
- ✅ **Admin Dashboard**: Comprehensive analytics and user management  
- ✅ **IST Time Zone**: Accurate Indian Standard Time handling
- ✅ **Modern UI/UX**: shadcn/ui components with dark mode support
- ✅ **Mobile Responsive**: Optimized for all device sizes
- ✅ **Type Safe**: Full TypeScript implementation with strict mode

### 🚀 Version 1.5 (Next Release)
- 🔄 **Email Notifications**: Booking confirmations and approval alerts
- 🔄 **Enhanced Analytics**: Resource utilization insights and trends
- 🔄 **Bulk Operations**: Administrative bulk booking management
- 🔄 **Calendar Export**: Export bookings to Google Calendar/Outlook
- 🔄 **Advanced Search**: Elasticsearch integration for better search
- 🔄 **Performance**: Database query optimization and caching

### 📋 Future Roadmap (v2.0+)
- 📱 **Mobile App**: React Native app with offline capabilities
- 🔗 **Integration Hub**: Microsoft Teams, Slack, and LMS integration
- 🤖 **Smart Recommendations**: AI-powered resource suggestions
- 🏢 **Multi-Campus**: Support for university systems and branch campuses
- 📊 **Advanced Analytics**: Predictive analytics and usage forecasting  
- 🌐 **API Gateway**: GraphQL API for third-party integrations
- 🔐 **SSO Integration**: LDAP/SAML for enterprise authentication
- 🌍 **Multi-Language**: Internationalization support

### 💡 Community Ideas
- **QR Code Check-in**: Physical resource check-in via QR codes
- **Resource Maintenance**: Maintenance scheduling and tracking
- **Equipment Booking**: Individual equipment reservation system
- **Room Templates**: Predefined room setups for different event types
- **Feedback System**: Post-booking feedback and rating system

---

## � Team

CampusBook was developed by a dedicated team of developers as an open-source solution to solve real-world campus resource management challenges for educational institutions.

### Core Team
- **[Subhajit Dolai](https://github.com/SubhajitDolai)** - Lead Developer & Project Architect
- **Ganesh** - Backend Development & Database Design
- **Nilesh** - UI/UX Design & Frontend Development  
- **Ranjeet** - System Integration & Testing
- **Kunal** - DevOps & Deployment
- **Swaraj** - Quality Assurance & Documentation

### Acknowledgments
- **Educational Institutions** - For providing insights into campus resource management needs
- **Supabase** - For the excellent Backend-as-a-Service platform
- **Vercel** - For seamless deployment and hosting capabilities  
- **shadcn/ui** - For the beautiful and accessible UI component library
- **Open Source Community** - For the amazing tools and libraries that made this project possible

---

## 🎯 Impact & Usage

### Real-World Implementation
CampusBook is designed for deployment at educational institutions with:
- **Scalable Architecture**: Support for institutions of any size
- **Multiple Buildings**: Flexible building and floor management system
- **Faculty Adoption**: Intuitive interface designed for academic environments
- **Admin Efficiency**: Streamlined resource management and approval workflows

### Technical Achievements
- **100% TypeScript**: Type-safe development with comprehensive error handling
- **Mobile-First**: Responsive design working seamlessly across all devices
- **Performance**: Fast loading with Next.js 15 and optimized database queries
- **Accessibility**: WCAG compliant design for inclusive user experience
- **Security**: Role-based access control with approval workflows

---

## �📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Subhajit Dolai & CampusBook Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🌟 Getting Started

Ready to streamline your campus resource management? 

1. **⭐ Star this repository** to show your support
2. **🔧 Follow the [Installation Guide](#installation--setup)** to set up your instance
3. **🤝 [Contribute](#-contributing)** to help make CampusBook even better
4. **📧 Reach out** if you need help implementing CampusBook at your institution

### Quick Links
- 📖 [Full Documentation](#-documentation)
- 🚀 [Deployment Guide](#-deployment)  
- 🐛 [Report Issues](https://github.com/SubhajitDolai/CampusBook/issues)
- 💬 [Join Discussions](https://github.com/SubhajitDolai/CampusBook/discussions)

---

<div align="center">

**Built with ❤️ for Educational Institutions**

*Empowering educational institutions with modern technology*

[⬆ Back to Top](#campusbook-)

</div>

---

## 🆘 Support

### Getting Help

- **📖 Documentation**: Check our [documentation](#documentation) first
- **💬 Discussions**: Join our [GitHub Discussions](https://github.com/SubhajitDolai/CampusBook/discussions)
- **🐛 Issues**: Report bugs on [GitHub Issues](https://github.com/SubhajitDolai/CampusBook/issues)
- **📧 Contact**: Reach out directly at [your-email@example.com]

### FAQ

**Q: Can I customize the booking approval workflow?**
A: Yes, the booking approval system is configurable. Check the admin settings for workflow customization options.

**Q: How do I add new resource types?**
A: Resource types are defined in the database enum. Contact your super admin to add new types.

**Q: Is there a mobile app available?**
A: Currently, CampusBook is a responsive web application. A dedicated mobile app is planned for v2.0.

**Q: Can I integrate with our existing university systems?**
A: Yes, CampusBook provides APIs for integration. Check our API documentation for details.

---

<div align="center">

**Made with ❤️ for educational institutions worldwide**

*If CampusBook has helped your institution, please consider giving us a ⭐ on GitHub!*

[⬆ Back to Top](#campusbook-)

</div>
