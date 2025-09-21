# CampusBook 📚

<div align="center">

![CampusBook Logo](/public/logo-light.webp)

**A Modern University Resource Booking System**

[![Next.js](https://img.shields.io/badge/Next.js-15.4.4-black?style=flat-square&logo=next.js)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?style=flat-square&logo=typescript)](https://www.typescriptlang.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Backend-green?style=flat-square&logo=supabase)](https://supabase.com/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-4-06B6D4?style=flat-square&logo=tailwindcss)](https://tailwindcss.com/)
[![React](https://img.shields.io/badge/React-19.1.0-61DAFB?style=flat-square&logo=react)](https://reactjs.org/)

*Streamline campus resource management with instant booking, real-time availability, and intuitive faculty workflows*

[Live Demo](https://your-demo-url.com) • [Documentation](#documentation) • [Report Bug](https://github.com/SubhajitDolai/CampusBook/issues) • [Request Feature](https://github.com/SubhajitDolai/CampusBook/issues)

</div>

---

## 🌟 Overview

CampusBook is a comprehensive university resource booking system designed to revolutionize how educational institutions manage their physical spaces. Built with modern web technologies, it provides an intuitive platform for faculty members to quickly reserve classrooms, laboratories, halls, and other campus facilities while giving administrators powerful tools to oversee and optimize resource utilization.

### ✨ Key Features

- **🚀 Instant Booking** - Reserve any campus space in just a few clicks
- **⏰ Real-Time Availability** - See up-to-date schedules and avoid double bookings
- **🔔 Smart Notifications** - Automated reminders before your bookings start
- **📱 Mobile-First Design** - Fully responsive interface for all devices
- **🔐 Secure Authentication** - Role-based access control with Supabase Auth
- **📊 Analytics Dashboard** - Track booking patterns and resource utilization
- **🏢 Multi-Building Support** - Manage resources across multiple campus buildings
- **⚡ Performance Optimized** - Lightning-fast loading with Next.js 15 and Turbopack

---

## 🏗️ Architecture

### Tech Stack

#### Frontend
- **Framework**: Next.js 15.4.4 with App Router
- **Language**: TypeScript 5
- **Styling**: Tailwind CSS 4 with CSS Variables
- **UI Components**: Radix UI primitives with custom design system
- **Animations**: Framer Motion for smooth interactions
- **Forms**: React Hook Form with Zod validation
- **State Management**: React hooks with server-side data fetching

#### Backend & Database
- **Backend-as-a-Service**: Supabase
- **Database**: PostgreSQL with Row Level Security (RLS)
- **Authentication**: Supabase Auth with email/password
- **Real-time**: Supabase Realtime for live updates
- **File Storage**: Supabase Storage (if applicable)

#### Development & Deployment
- **Package Manager**: npm/yarn
- **Linting**: ESLint with Next.js configuration
- **Type Checking**: TypeScript strict mode
- **Development Server**: Next.js Dev with Turbopack
- **Build Tool**: Next.js build system

### Project Structure

```
campusbook/
├── app/                          # Next.js App Router
│   ├── (auth)/                   # Authentication routes
│   │   ├── login/               # Sign in functionality
│   │   ├── signup/              # User registration
│   │   ├── forgot-password/     # Password recovery
│   │   └── onboarding/          # New user setup
│   ├── (main)/                  # Protected main application
│   │   ├── dashboard/           # User dashboard
│   │   ├── bookings/            # Booking management
│   │   ├── buildings/           # Building directory
│   │   ├── resources/           # Resource catalog
│   │   └── profile/             # User profile management
│   ├── admin/                   # Administrative interface
│   │   ├── users/               # User management
│   │   ├── buildings/           # Building administration
│   │   ├── resources/           # Resource management
│   │   └── bookings/            # Booking oversight
│   └── api/                     # API routes
├── components/                   # Reusable UI components
│   ├── ui/                      # Base UI components (shadcn/ui)
│   ├── providers/               # Context providers
│   └── ...                      # Feature-specific components
├── database/                     # Database schema and migrations
├── hooks/                        # Custom React hooks
├── lib/                         # Utility functions
├── utils/                       # Supabase client configuration
└── public/                      # Static assets
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

#### Faculty Members
- **Booking Management**: Create, view, edit, and cancel personal bookings
- **Resource Discovery**: Browse available rooms, labs, and facilities
- **Dashboard Access**: Personal analytics and upcoming bookings
- **Profile Management**: Update personal information and preferences

#### Administrators
- **User Management**: Manage faculty accounts and permissions
- **Resource Administration**: Add, edit, and deactivate campus resources
- **Booking Oversight**: Approve/reject bookings and resolve conflicts
- **Analytics**: System-wide usage statistics and reports

#### Super Administrators
- **System Configuration**: Manage buildings, floors, and resource types
- **User Roles**: Promote users to admin status
- **Data Management**: Import/export functionality
- **System Maintenance**: Database operations and backup management

### Core Features

#### 🏢 Building & Resource Management
- Hierarchical organization: Buildings → Floors → Resources
- Resource categorization (classrooms, labs, halls, auditoriums)
- Capacity management and equipment tracking
- Real-time availability status

#### 📅 Booking System
- Date and time-based reservations
- Conflict detection and prevention
- Multi-day booking support
- Recurring booking patterns
- Approval workflows for sensitive resources

---

## 🛠️ Developer notes

These notes summarize recent implementation details and recommended next steps for developers working on CampusBook.

- Approval workflow
   - `profiles` table now includes `approved BOOLEAN`, `approved_by UUID`, and `approved_at TIMESTAMPTZ` fields.
   - Admin actions: `approveUser` / `unapproveUser` are implemented in `app/admin/actions.ts` and are role-protected (only `admin` / `super_admin`).
   - Client gating: booking forms check the user's `profiles.approved` flag and show a friendly "Account pending approval" UI if false.
   - Server guard: resource `createBooking` server actions verify `profiles.approved === true` before inserting bookings (defense-in-depth).

- Timezone & dynamic status
   - All dynamic resource status calculations use IST helpers (`lib/ist`) and `lib/dynamic-status` to compute whether a resource is `Available` or `In Use` based on APPROVED bookings only.
   - Overnight bookings and weekday selections are handled correctly by numeric time comparisons and weekday checks.

- Database
   - See `database/schema.sql` for the current schema. The `bookings` table includes `approved_by` and `approved_at` fields for tracking approvals.
   - Ensure migrations are applied to your Supabase instance when deploying (schema changes must be run manually or via your migration tooling).

- Security & recommendations
   - Server-side checks are implemented but we strongly recommend adding Supabase Row Level Security (RLS) policies to prevent unapproved users from inserting into `bookings` at the DB layer.
   - Add integration tests for: (1) unapproved user cannot create a booking, (2) admin can approve a user and booking creation succeeds afterward.

- Developer tasks (suggested)
   1. Add RLS policy SQL and test it in staging.
   2. Add 2-3 integration tests around the approval/booking flow.
   3. Optional: surface approver name and timestamp more places (booking details, audit logs).


#### 📊 Dashboard & Analytics
- Personal booking history and statistics
- Resource utilization metrics
- Favorite locations and usage patterns
- Upcoming booking reminders

#### 🔐 Security & Authentication
- Supabase Auth integration
- Role-based access control (RBAC)
- Row Level Security (RLS) policies
- Secure API endpoints

### API Reference

#### Authentication Endpoints
```typescript
// Login
POST /api/auth/login
Body: { email: string, password: string }

// Signup
POST /api/auth/signup
Body: { email: string, password: string, name: string, department: string }

// Password Reset
POST /api/auth/reset-password
Body: { email: string }
```

#### Booking Endpoints
```typescript
// Get user bookings
GET /api/bookings
Headers: { Authorization: Bearer <token> }

// Create booking
POST /api/bookings
Body: { resourceId: string, startDate: string, endDate: string, ... }

// Update booking
PUT /api/bookings/:id
Body: { partial booking data }

// Cancel booking
DELETE /api/bookings/:id
```

#### Resource Endpoints
```typescript
// Get resources
GET /api/resources?buildingId=<id>&type=<type>&available=<boolean>

// Get resource details
GET /api/resources/:id

// Get resource availability
GET /api/resources/:id/availability?date=<YYYY-MM-DD>
```

---

## 🚀 Deployment

### Vercel (Recommended)

1. **Connect Repository**
   - Fork this repository to your GitHub account
   - Connect your Vercel account to GitHub
   - Import the CampusBook project

2. **Configure Environment Variables**
   ```bash
   NEXT_PUBLIC_SUPABASE_URL=your_production_supabase_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_production_anon_key
   SUPABASE_SERVICE_ROLE_KEY=your_production_service_role_key
   ```

3. **Deploy**
   - Vercel will automatically build and deploy your application
   - Configure custom domain if needed

### Manual Deployment

```bash
# Build the application
npm run build

# Start production server
npm start
```

### Database Migration

1. **Production Database Setup**
   - Create a new Supabase project for production
   - Run the schema from `database/schema.sql`
   - Configure RLS policies
   - Import initial data

2. **Environment Configuration**
   - Update production environment variables
   - Configure Supabase settings
   - Set up authentication providers

---

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### Development Workflow

1. **Fork the Repository**
   ```bash
   git clone https://github.com/your-username/CampusBook.git
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. **Make Your Changes**
   - Follow the existing code style
   - Add tests for new functionality
   - Update documentation as needed

4. **Test Your Changes**
   ```bash
   npm run lint
   npm run type-check
   npm run build
   ```

5. **Submit a Pull Request**
   - Write a clear description of your changes
   - Include screenshots for UI changes
   - Reference any related issues

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

### Version 2.0 (Planned)
- [ ] **Mobile App**: React Native companion app
- [ ] **Calendar Integration**: Sync with Google Calendar, Outlook
- [ ] **Resource Sharing**: Inter-department resource sharing
- [ ] **Advanced Analytics**: Machine learning-powered insights
- [ ] **Multi-Campus Support**: Support for university systems
- [ ] **API v2**: GraphQL API for better performance

### Version 1.5 (In Development)
- [ ] **Bulk Operations**: Mass booking creation and management
- [ ] **Approval Workflows**: Customizable approval chains
- [ ] **Email Notifications**: Rich email templates
- [ ] **Resource Categories**: Enhanced categorization system
- [ ] **Dark Mode**: Complete dark theme implementation

### Current Features (v1.0)
- [x] Core booking functionality
- [x] User authentication and authorization
- [x] Administrative interface
- [x] Real-time availability checking
- [x] Responsive design
- [x] Basic analytics and reporting

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Subhajit Dolai

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

## 👥 Team

<div align="center">

### Core Contributors

| ![Subhajit Dolai](https://github.com/SubhajitDolai.png?size=100) |
|:---:|
| **[Subhajit Dolai](https://github.com/SubhajitDolai)** |
| *Project Creator & Lead Developer* |
| Full-stack development, Architecture design |

</div>

### Special Thanks

- **Supabase Team** - For the excellent Backend-as-a-Service platform
- **Vercel Team** - For Next.js framework and deployment platform
- **Radix UI Team** - For accessible UI component primitives
- **Tailwind CSS Team** - For the utility-first CSS framework

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
