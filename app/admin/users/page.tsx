'use client'

import { AppSidebar } from "../components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"

import { Input } from "@/components/ui/input"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow
} from "@/components/ui/table"
import {
  Building2,
  Users,
  Settings,
  Search,
  Mail,
  Phone,
  GraduationCap,
  Eye
} from "lucide-react"
import { Skeleton } from "@/components/ui/skeleton"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog"
import { getUsersWithCurrentUserRole, promoteUserToAdmin, demoteUserToFaculty } from "../actions"
import { approveUser, unapproveUser } from "../actions"
import { useState, useEffect } from "react"
import { toast } from "sonner"
import { Button } from "@/components/ui/button"
import { createClient } from "@/utils/supabase/client"

type User = {
  id: string
  name: string
  email: string
  university_id: string
  phone: string | null
  gender: string | null
  designation: string | null
  department: string
  role: string
  approved?: boolean
  approved_by?: string | null
  approved_at?: string | null
  created_at: string
  seating_location?: string | null
  building_name?: string | null
  floor_number?: number | null
  room_number?: number | null
  cabin?: string | null
  cubicle?: string | null
  workstation?: string | null
}

export default function UsersPage() {
  const [users, setUsers] = useState<User[]>([])
  const [filteredUsers, setFilteredUsers] = useState<User[]>([])
  const [searchTerm, setSearchTerm] = useState("")
  const [isLoading, setIsLoading] = useState(true)
  const [currentUserRole, setCurrentUserRole] = useState<'super_admin' | 'admin' | 'faculty' | null>(null);
  const [promotingId, setPromotingId] = useState<string | null>(null);
  const [demotingId, setDemotingId] = useState<string | null>(null);
  const [approvingId, setApprovingId] = useState<string | null>(null);
  const [unapprovingId, setUnapprovingId] = useState<string | null>(null);
  const [isViewDialogOpen, setIsViewDialogOpen] = useState(false);
  const [selectedUser, setSelectedUser] = useState<User | null>(null);

  const handleApprove = async (userId: string) => {
    setApprovingId(userId);
    const result = await approveUser(userId);
    if (result && result.success) {
      setUsers((prev) => prev.map(u => u.id === userId ? { ...u, approved: true } : u));
      setFilteredUsers((prev) => prev.map(u => u.id === userId ? { ...u, approved: true } : u));
      toast.success('User approved')
    } else {
      toast.error(result?.error || 'Failed to approve user')
    }
    setApprovingId(null);
  }

  const handleUnapprove = async (userId: string) => {
    setUnapprovingId(userId);
    const result = await unapproveUser(userId);
    if (result && result.success) {
      setUsers((prev) => prev.map(u => u.id === userId ? { ...u, approved: false } : u));
      setFilteredUsers((prev) => prev.map(u => u.id === userId ? { ...u, approved: false } : u));
      toast.success('User unapproved')
    } else {
      toast.error(result?.error || 'Failed to unapprove user')
    }
    setUnapprovingId(null);
  }

  useEffect(() => {
    async function fetchUsersAndRole() {
      try {
        setIsLoading(true)
        const { users: usersData, userRole } = await getUsersWithCurrentUserRole()
        setUsers(usersData)
        setFilteredUsers(usersData)
        setCurrentUserRole(userRole)
      } catch (error) {
        console.error('Error fetching users:', error)
      } finally {
        setIsLoading(false)
      }
    }
    fetchUsersAndRole()
  }, [])

  useEffect(() => {
    const filtered = users.filter(user =>
      user.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      user.email?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      user.department?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      user.university_id?.toLowerCase().includes(searchTerm.toLowerCase())
    )
    setFilteredUsers(filtered)
  }, [searchTerm, users])

  // Handler to promote a user to admin (real backend)
  const handlePromoteToAdmin = async (userId: string) => {
    setPromotingId(userId);
    const result = await promoteUserToAdmin(userId);
    if (result && result.success) {
      setUsers((prev) => prev.map(u => u.id === userId ? { ...u, role: 'admin' } : u));
      setFilteredUsers((prev) => prev.map(u => u.id === userId ? { ...u, role: 'admin' } : u));
      toast.success('User promoted to admin successfully');
    } else {
      toast.error(result?.error || 'Failed to promote user');
    }
    setPromotingId(null);
  };

  // Handler to demote a user to faculty (real backend)
  const handleDemoteToFaculty = async (userId: string) => {
    setDemotingId(userId);
    const result = await demoteUserToFaculty(userId);
    if (result && result.success) {
      setUsers((prev) => prev.map(u => u.id === userId ? { ...u, role: 'faculty' } : u));
      setFilteredUsers((prev) => prev.map(u => u.id === userId ? { ...u, role: 'faculty' } : u));
      toast.success('User demoted to faculty successfully');
    } else {
      toast.error(result?.error || 'Failed to demote user');
    }
    setDemotingId(null);
  };

  const getRoleBadge = (role: string) => {
    switch (role) {
      case 'super_admin':
        return <Badge variant="destructive">Super Admin</Badge>
      case 'admin':
        return <Badge variant="default">Admin</Badge>
      case 'faculty':
        return <Badge variant="secondary">Faculty</Badge>
      default:
        return <Badge variant="outline">{role}</Badge>
    }
  }

  const getDepartmentIcon = (department: string) => {
    switch (department.toLowerCase()) {
      case 'computer science':
      case 'cs':
        return <Settings className="h-4 w-4" />
      case 'mechanical':
      case 'me':
        return <Building2 className="h-4 w-4" />
      case 'electrical':
      case 'ee':
        return <Settings className="h-4 w-4" />
      default:
        return <GraduationCap className="h-4 w-4" />
    }
  }

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12">
          <div className="flex items-center gap-2 px-4">
            <SidebarTrigger className="-ml-1" />
            <Separator
              orientation="vertical"
              className="mr-2 data-[orientation=vertical]:h-4"
            />
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem className="hidden md:block">
                  <BreadcrumbLink href="/admin">
                    Admin
                  </BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block" />
                <BreadcrumbItem>
                  <BreadcrumbPage>Users</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          {/* Header */}
          <div className="flex flex-col gap-2">
            <div>
              <h1 className="text-3xl font-bold tracking-tight">Users</h1>
              <p className="text-muted-foreground">
                Manage university faculty and staff accounts.
              </p>
            </div>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-4">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Users</CardTitle>
                <Users className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{filteredUsers.length}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  All registered users
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Faculty</CardTitle>
                <GraduationCap className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredUsers.filter(u => u.role === 'faculty').length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Teaching staff
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Admins</CardTitle>
                <Settings className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredUsers.filter(u => u.role === 'admin').length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  System administrators
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Super Admins</CardTitle>
                <Building2 className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredUsers.filter(u => u.role === 'super_admin').length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  System owners
                </p>
              </CardContent>
            </Card>
          </div>

          {/* Search and Filters */}
          <Card>
            <CardHeader>
              <CardTitle>User Management</CardTitle>
              <CardDescription>
                Search and manage university faculty and staff accounts.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="mb-6">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    placeholder="Search users by name, email, or department..."
                    className="pl-10"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </div>
              </div>

              {/* Users Table */}
              <div className="rounded-md border">
                {isLoading ? (
                  <div className="p-4 space-y-4">
                    {[...Array(5)].map((_, i) => (
                      <div key={i} className="flex items-center gap-4">
                        <Skeleton className="h-10 w-10 rounded-full" />
                        <div className="flex-1 space-y-2">
                          <Skeleton className="h-4 w-[180px]" />
                          <Skeleton className="h-3 w-[120px]" />
                        </div>
                        <Skeleton className="h-6 w-32" />
                        <Skeleton className="h-6 w-40" />
                        <Skeleton className="h-6 w-20" />
                        <Skeleton className="h-6 w-28" />
                        <Skeleton className="h-6 w-20" />
                        <Skeleton className="h-8 w-24" />
                      </div>
                    ))}
                  </div>
                ) : (
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>User</TableHead>
                      <TableHead>Department</TableHead>
                      <TableHead>Contact</TableHead>
                      <TableHead>Role</TableHead>
                      <TableHead>View</TableHead>
                      {(currentUserRole === 'super_admin' || currentUserRole === 'admin') && (
                        <TableHead>Action</TableHead>
                      )}
                      {(currentUserRole === 'super_admin' || currentUserRole === 'admin') && (
                        <TableHead>Approval</TableHead>
                      )}
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredUsers.map((user) => (
                      <TableRow key={user.id}>
                        <TableCell>
                          <div className="flex items-center gap-3">
                            <div className="flex h-10 w-10 items-center justify-center rounded-full bg-muted">
                              <Users className="h-5 w-5" />
                            </div>
                            <div>
                              <p className="font-medium">{user.name}</p>
                              <p className="text-sm text-muted-foreground">{user.university_id}</p>
                            </div>
                          </div>
                        </TableCell>
                        <TableCell>
                          <div className="space-y-1">
                            <div className="flex items-center gap-2">
                              {getDepartmentIcon(user.department)}
                              <span className="font-medium">{user.department}</span>
                            </div>
                            {user.designation && (
                              <div className="text-xs text-muted-foreground">{user.designation}</div>
                            )}
                          </div>
                        </TableCell>
                        <TableCell>
                          <div className="space-y-1">
                            <div className="flex items-center gap-1 text-sm">
                              <Mail className="h-3 w-3" />
                              <span>{user.email}</span>
                            </div>
                            {user.phone && (
                              <div className="flex items-center gap-1 text-sm text-muted-foreground">
                                <Phone className="h-3 w-3" />
                                <span>{user.phone}</span>
                              </div>
                            )}
                          </div>
                        </TableCell>
                        <TableCell>
                          <div className="flex items-center gap-2">
                            {getRoleBadge(user.role)}
                            {user.approved ? <Badge variant="default">Approved</Badge> : <Badge variant="secondary">Pending</Badge>}
                          </div>
                        </TableCell>
                        <TableCell>
                          <Button
                            size="sm"
                            variant="ghost"
                            onClick={() => {
                              setSelectedUser(user);
                              setIsViewDialogOpen(true);
                            }}
                          >
                            <Eye className="h-4 w-4" />
                          </Button>
                        </TableCell>
                        {(currentUserRole === 'super_admin' || currentUserRole === 'admin') && (
                          <>
                            <TableCell>
                              {user.role === 'faculty' && (
                                <Button
                                  size="sm"
                                  variant="outline"
                                  disabled={promotingId === user.id}
                                  onClick={() => handlePromoteToAdmin(user.id)}
                                >
                                  {promotingId === user.id ? 'Promoting...' : 'Make Admin'}
                                </Button>
                              )}
                              {user.role === 'admin' && (
                                <Button
                                  size="sm"
                                  variant="outline"
                                  disabled={demotingId === user.id}
                                  onClick={() => handleDemoteToFaculty(user.id)}
                                >
                                  {demotingId === user.id ? 'Demoting...' : 'Demote to Faculty'}
                                </Button>
                              )}
                              {user.role === 'super_admin' && (
                                <span className="text-xs text-muted-foreground">Super Admin</span>
                              )}
                            </TableCell>

                            <TableCell>
                              {/* Approval actions - only super_admin can approve/unapprove */}
                              {currentUserRole === 'super_admin' && (
                                <>
                                  {!user.approved && (
                                    <Button
                                      size="sm"
                                      variant="default"
                                      disabled={approvingId === user.id}
                                      onClick={() => handleApprove(user.id)}
                                    >
                                      {approvingId === user.id ? 'Approving...' : 'Approve'}
                                    </Button>
                                  )}
                                  {user.approved && (
                                    <Button
                                      size="sm"
                                      variant="outline"
                                      disabled={unapprovingId === user.id}
                                      onClick={() => handleUnapprove(user.id)}
                                    >
                                      {unapprovingId === user.id ? 'Working...' : 'Unapprove'}
                                    </Button>
                                  )}
                                </>
                              )}
                              {currentUserRole === 'admin' && (
                                <span className="text-sm">
                                  {user.approved ? (
                                    <Badge variant="default">Approved</Badge>
                                  ) : (
                                    <Badge variant="secondary">Pending</Badge>
                                  )}
                                </span>
                              )}
                            </TableCell>
                          </>
                        )}
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
                )}
              </div>
            </CardContent>
          </Card>
        </div>
      </SidebarInset>

      {/* View User Profile Dialog */}
      <Dialog open={isViewDialogOpen} onOpenChange={setIsViewDialogOpen}>
        <DialogContent className="max-w-3xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>User Profile Details</DialogTitle>
            <DialogDescription>
              Complete information about the user profile
            </DialogDescription>
          </DialogHeader>
          {selectedUser && (
            <div className="grid gap-6 py-4">
              {/* Personal Information */}
              <div>
                <h3 className="text-lg font-semibold mb-3 flex items-center gap-2">
                  <Users className="h-5 w-5" />
                  Personal Information
                </h3>
                <div className="grid grid-cols-2 gap-4 bg-muted/30 p-4 rounded-lg">
                  <div>
                    <p className="text-sm text-muted-foreground">Full Name</p>
                    <p className="font-medium">{selectedUser.name}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">University ID</p>
                    <p className="font-medium">{selectedUser.university_id}</p>
                  </div>
                  <div className="col-span-2">
                    <p className="text-sm text-muted-foreground">Email</p>
                    <p className="font-medium break-all">{selectedUser.email}</p>
                  </div>
                  <div className="col-span-2">
                    <p className="text-sm text-muted-foreground">Phone</p>
                    <p className="font-medium">{selectedUser.phone || 'Not provided'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Gender</p>
                    <p className="font-medium">{selectedUser.gender || 'Not specified'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Designation</p>
                    <p className="font-medium">{selectedUser.designation || 'Not specified'}</p>
                  </div>
                </div>
              </div>

              {/* Department & Role Information */}
              <div>
                <h3 className="text-lg font-semibold mb-3 flex items-center gap-2">
                  <GraduationCap className="h-5 w-5" />
                  Department & Role
                </h3>
                <div className="grid grid-cols-2 gap-4 bg-muted/30 p-4 rounded-lg">
                  <div>
                    <p className="text-sm text-muted-foreground">Department</p>
                    <p className="font-medium">{selectedUser.department}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Role</p>
                    <div className="mt-1">{getRoleBadge(selectedUser.role)}</div>
                  </div>
                </div>
              </div>

              {/* Seating Location */}
              <div>
                <h3 className="text-lg font-semibold mb-3 flex items-center gap-2">
                  <Building2 className="h-5 w-5" />
                  Seating Location
                </h3>
                <div className="grid grid-cols-2 gap-4 bg-muted/30 p-4 rounded-lg">
                  <div>
                    <p className="text-sm text-muted-foreground">Building</p>
                    <p className="font-medium">{selectedUser.building_name || 'Not provided'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Floor Number</p>
                    <p className="font-medium">{selectedUser.floor_number || 'Not provided'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Room Number</p>
                    <p className="font-medium">{selectedUser.room_number || 'Not provided'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Cabin</p>
                    <p className="font-medium">{selectedUser.cabin || 'Not provided'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Cubicle</p>
                    <p className="font-medium">{selectedUser.cubicle || 'Not provided'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Workstation</p>
                    <p className="font-medium">{selectedUser.workstation || 'Not provided'}</p>
                  </div>
                  <div className="col-span-2">
                    <p className="text-sm text-muted-foreground">Seating Location</p>
                    <p className="font-medium">{selectedUser.seating_location || 'Not provided'}</p>
                  </div>
                </div>
              </div>

              {/* Approval Status */}
              <div>
                <h3 className="text-lg font-semibold mb-3 flex items-center gap-2">
                  <Settings className="h-5 w-5" />
                  Account Status
                </h3>
                <div className="grid grid-cols-2 gap-4 bg-muted/30 p-4 rounded-lg">
                  <div>
                    <p className="text-sm text-muted-foreground">Approval Status</p>
                    <div className="mt-1">
                      {selectedUser.approved ? (
                        <Badge variant="default">Approved</Badge>
                      ) : (
                        <Badge variant="secondary">Pending</Badge>
                      )}
                    </div>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Created At</p>
                    <p className="font-medium">
                      {new Date(selectedUser.created_at).toLocaleDateString('en-US', {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric'
                      })}
                    </p>
                  </div>
                  {selectedUser.approved_at && (
                    <div>
                      <p className="text-sm text-muted-foreground">Approved At</p>
                      <p className="font-medium">
                        {new Date(selectedUser.approved_at).toLocaleDateString('en-US', {
                          year: 'numeric',
                          month: 'long',
                          day: 'numeric'
                        })}
                      </p>
                    </div>
                  )}
                </div>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </SidebarProvider>
  )
} 