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
import { Button } from "@/components/ui/button"
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
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Switch } from "@/components/ui/switch"
import { Skeleton } from "@/components/ui/skeleton"
import {
  Building2,
  Search,
  Plus,
  Edit,
  Trash2,
  CheckCircle,
  XCircle,
  Loader2
} from "lucide-react"
import { useState, useEffect } from "react"
import { getBuildings, addBuilding, updateBuilding, deleteBuilding } from "./actions"

type Building = {
  id: string
  name: string
  code: string
  description: string | null
  is_active: boolean
  created_at: string
}

export default function BuildingsPage() {
  const [buildings, setBuildings] = useState<Building[]>([])
  const [filteredBuildings, setFilteredBuildings] = useState<Building[]>([])
  const [searchTerm, setSearchTerm] = useState("")
  const [isLoading, setIsLoading] = useState(true)
  const [isAddDialogOpen, setIsAddDialogOpen] = useState(false)
  const [isEditDialogOpen, setIsEditDialogOpen] = useState(false)
  const [editingBuilding, setEditingBuilding] = useState<Building | null>(null)
  const [isAddingBuilding, setIsAddingBuilding] = useState(false)
  const [isUpdatingBuilding, setIsUpdatingBuilding] = useState(false)
  const [deletingBuildingId, setDeletingBuildingId] = useState<string | null>(null)
  const [updatingStatusId, setUpdatingStatusId] = useState<string | null>(null)
  const [formErrors, setFormErrors] = useState({
    name: '',
    code: '',
    description: ''
  })
  const [formData, setFormData] = useState({
    name: '',
    code: '',
    description: '',
    is_active: true
  })

  useEffect(() => {
    fetchBuildings()
  }, [])

  const fetchBuildings = async () => {
    try {
      setIsLoading(true)
      const buildingsData = await getBuildings()
      setBuildings(buildingsData)
      setFilteredBuildings(buildingsData)
    } catch (error) {
      console.error('Error fetching buildings:', error)
    } finally {
      setIsLoading(false)
    }
  }

  useEffect(() => {
    const filtered = buildings.filter(building =>
      building.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      building.code?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      building.description?.toLowerCase().includes(searchTerm.toLowerCase())
    )
    setFilteredBuildings(filtered)
  }, [searchTerm, buildings])

  const validateForm = () => {
    const errors = {
      name: '',
      code: '',
      description: ''
    }

    if (!formData.name.trim()) {
      errors.name = 'Building name is required'
    }

    if (!formData.code.trim()) {
      errors.code = 'Building code is required'
    } else if (formData.code.length > 10) {
      errors.code = 'Building code must be 10 characters or less'
    }

    setFormErrors(errors)
    return !errors.name && !errors.code
  }

  const handleAddBuilding = async () => {
    if (!validateForm()) {
      return
    }

    setIsAddingBuilding(true)
    try {
      const formDataObj = new FormData()
      formDataObj.append('name', formData.name.trim())
      formDataObj.append('code', formData.code.trim())
      formDataObj.append('description', formData.description.trim())
      formDataObj.append('is_active', formData.is_active.toString())

      const result = await addBuilding(formDataObj)

      if (result.error) {
        console.error('Error adding building:', result.error)
        return
      }

      // Refresh the buildings list
      await fetchBuildings()
      setFormData({ name: '', code: '', description: '', is_active: true })
      setFormErrors({ name: '', code: '', description: '' })
      setIsAddDialogOpen(false)
    } catch (error) {
      console.error('Error adding building:', error)
    } finally {
      setIsAddingBuilding(false)
    }
  }

  const handleEditBuilding = async () => {
    if (!editingBuilding) return

    if (!validateForm()) {
      return
    }

    setIsUpdatingBuilding(true)
    try {
      const formDataObj = new FormData()
      formDataObj.append('name', formData.name.trim())
      formDataObj.append('code', formData.code.trim())
      formDataObj.append('description', formData.description.trim())
      formDataObj.append('is_active', formData.is_active.toString())

      const result = await updateBuilding(editingBuilding.id, formDataObj)

      if (result.error) {
        console.error('Error updating building:', result.error)
        return
      }

      // Refresh the buildings list
      await fetchBuildings()
      setEditingBuilding(null)
      setFormData({ name: '', code: '', description: '', is_active: true })
      setFormErrors({ name: '', code: '', description: '' })
      setIsEditDialogOpen(false)
    } catch (error) {
      console.error('Error updating building:', error)
    } finally {
      setIsUpdatingBuilding(false)
    }
  }

  const handleDeleteBuilding = async (id: string) => {
    setDeletingBuildingId(id)
    try {
      const result = await deleteBuilding(id)

      if (result.error) {
        console.error('Error deleting building:', result.error)
        return
      }

      // Refresh the buildings list
      await fetchBuildings()
    } catch (error) {
      console.error('Error deleting building:', error)
    } finally {
      setDeletingBuildingId(null)
    }
  }

  const openEditDialog = (building: Building) => {
    setEditingBuilding(building)
    setFormData({
      name: building.name,
      code: building.code,
      description: building.description || '',
      is_active: building.is_active
    })
    setIsEditDialogOpen(true)
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
                  <BreadcrumbPage>Buildings</BreadcrumbPage>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
          {/* Header */}
          <div className="flex flex-col gap-2">
            <div className="flex items-center justify-between">
              <div>
                <h1 className="text-3xl font-bold tracking-tight">Buildings</h1>
                <p className="text-muted-foreground">
                  Manage university buildings and facilities.
                </p>
              </div>
              <Dialog open={isAddDialogOpen} onOpenChange={(open) => {
                setIsAddDialogOpen(open)
                if (!open) {
                  setFormData({ name: '', code: '', description: '', is_active: true })
                  setFormErrors({ name: '', code: '', description: '' })
                }
              }}>
                <DialogTrigger asChild>
                  <Button>
                    <Plus className="h-4 w-4" />
                    Add Building
                  </Button>
                </DialogTrigger>
                <DialogContent>
                  <DialogHeader>
                    <DialogTitle>Add New Building</DialogTitle>
                    <DialogDescription>
                      Create a new building entry for the university.
                    </DialogDescription>
                  </DialogHeader>
                  <div className="grid gap-4 py-4">
                    <div className="grid gap-2">
                      <Label htmlFor="name">Building Name *</Label>
                      <Input
                        id="name"
                        value={formData.name}
                        onChange={(e) => {
                          setFormData({ ...formData, name: e.target.value })
                          if (formErrors.name) {
                            setFormErrors({ ...formErrors, name: '' })
                          }
                        }}
                        placeholder="Enter building name"
                        className={formErrors.name ? "border-red-500" : ""}
                      />
                      {formErrors.name && (
                        <p className="text-sm text-red-500">{formErrors.name}</p>
                      )}
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="code">Building Code *</Label>
                      <Input
                        id="code"
                        value={formData.code}
                        onChange={(e) => {
                          setFormData({ ...formData, code: e.target.value })
                          if (formErrors.code) {
                            setFormErrors({ ...formErrors, code: '' })
                          }
                        }}
                        placeholder="Enter building code"
                        className={formErrors.code ? "border-red-500" : ""}
                      />
                      {formErrors.code && (
                        <p className="text-sm text-red-500">{formErrors.code}</p>
                      )}
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="description">Description</Label>
                      <Textarea
                        id="description"
                        value={formData.description}
                        onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                        placeholder="Enter building description"
                      />
                    </div>
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="is_active"
                        checked={formData.is_active}
                        onCheckedChange={(checked) => setFormData({ ...formData, is_active: checked })}
                      />
                      <Label htmlFor="is_active">Active</Label>
                    </div>
                  </div>
                  <DialogFooter>
                    <Button variant="outline" onClick={() => setIsAddDialogOpen(false)}>
                      Cancel
                    </Button>
                    <Button onClick={handleAddBuilding} disabled={isAddingBuilding}>
                      {isAddingBuilding ? (
                        <>
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Adding...
                        </>
                      ) : (
                        'Add Building'
                      )}
                    </Button>
                  </DialogFooter>
                </DialogContent>
              </Dialog>
            </div>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-3">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Buildings</CardTitle>
                <Building2 className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{filteredBuildings.length}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  All buildings
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Active Buildings</CardTitle>
                <CheckCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredBuildings.filter(b => b.is_active).length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Currently active
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Inactive Buildings</CardTitle>
                <XCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredBuildings.filter(b => !b.is_active).length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Currently inactive
                </p>
              </CardContent>
            </Card>
          </div>

          {/* Search and Buildings Table */}
          <Card>
            <CardHeader>
              <CardTitle>Building Management</CardTitle>
              <CardDescription>
                Search and manage university buildings and facilities.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="mb-6">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    placeholder="Search buildings by name, code, or description..."
                    className="pl-10"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </div>
              </div>

              {/* Buildings Table */}
              <div className="rounded-md border">
                {isLoading ? (
                  <div className="p-4 space-y-4">
                    {[...Array(5)].map((_, i) => (
                      <div key={i} className="flex items-center gap-4">
                        <Skeleton className="h-10 w-10 rounded-full" />
                        <div className="flex-1 space-y-2">
                          <Skeleton className="h-4 w-[200px]" />
                          <Skeleton className="h-3 w-[150px]" />
                        </div>
                        <Skeleton className="h-6 w-16" />
                        <Skeleton className="h-4 w-[180px]" />
                        <Skeleton className="h-6 w-20" />
                        <div className="flex gap-2">
                          <Skeleton className="h-8 w-8" />
                          <Skeleton className="h-8 w-8" />
                        </div>
                      </div>
                    ))}
                  </div>
                ) : filteredBuildings.length === 0 ? (
                  <div className="flex flex-col items-center justify-center py-12">
                    <div className="flex h-16 w-16 items-center justify-center rounded-full bg-muted mb-4">
                      <Building2 className="h-8 w-8 text-muted-foreground" />
                    </div>
                    <h3 className="text-lg font-semibold mb-2">No buildings found</h3>
                    <p className="text-sm text-muted-foreground text-center mb-4 max-w-sm">
                      {searchTerm ?
                        `No buildings match your search for "${searchTerm}". Try adjusting your search terms.` :
                        'Get started by adding your first building to the system.'
                      }
                    </p>
                    {!searchTerm && (
                      <Button onClick={() => setIsAddDialogOpen(true)}>
                        <Plus className="h-4 w-4" />
                        Add Your First Building
                      </Button>
                    )}
                  </div>
                ) : (
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Building</TableHead>
                        <TableHead>Code</TableHead>
                        <TableHead>Description</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {filteredBuildings.map((building) => (
                        <TableRow key={building.id} className={!building.is_active ? "opacity-50" : ""}>
                          <TableCell>
                            <div className="flex items-center gap-3">
                              <div className="flex h-10 w-10 items-center justify-center rounded-full bg-muted">
                                <Building2 className="h-5 w-5" />
                              </div>
                              <div>
                                <p className="font-medium">{building.name}</p>
                                <p className="text-sm text-muted-foreground">
                                  Created {new Date(building.created_at).toLocaleDateString()}
                                </p>
                              </div>
                            </div>
                          </TableCell>
                          <TableCell>
                            <Badge variant="outline">{building.code}</Badge>
                          </TableCell>
                          <TableCell>
                            <div className="max-w-xs">
                              <p className="text-sm text-muted-foreground truncate" title={building.description || 'No description available'}>
                                {building.description || 'No description available'}
                              </p>
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              <Switch
                                checked={building.is_active}
                                disabled={updatingStatusId === building.id}
                                onCheckedChange={async (checked) => {
                                  setUpdatingStatusId(building.id)
                                  try {
                                    const formDataObj = new FormData()
                                    formDataObj.append('name', building.name)
                                    formDataObj.append('code', building.code)
                                    formDataObj.append('description', building.description || '')
                                    formDataObj.append('is_active', checked.toString())

                                    const result = await updateBuilding(building.id, formDataObj)

                                    if (result.error) {
                                      console.error('Error updating building status:', result.error)
                                      return
                                    }

                                    // Refresh the buildings list
                                    await fetchBuildings()
                                  } catch (error) {
                                    console.error('Error updating building status:', error)
                                  } finally {
                                    setUpdatingStatusId(null)
                                  }
                                }}
                              />
                              <span className="text-sm text-muted-foreground">
                                {building.is_active ? 'Active' : 'Inactive'}
                              </span>
                              {updatingStatusId === building.id && (
                                <Loader2 className="h-3 w-3 animate-spin text-muted-foreground" />
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => openEditDialog(building)}
                              >
                                <Edit className="h-4 w-4" />
                              </Button>
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => handleDeleteBuilding(building.id)}
                                disabled={deletingBuildingId === building.id}
                              >
                                {deletingBuildingId === building.id ? (
                                  <Loader2 className="h-4 w-4 animate-spin text-red-500" />
                                ) : (
                                  <Trash2 className="h-4 w-4 text-red-500" />
                                )}
                              </Button>
                            </div>
                          </TableCell>
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

      {/* Edit Dialog */}
      <Dialog open={isEditDialogOpen} onOpenChange={(open) => {
        setIsEditDialogOpen(open)
        if (!open) {
          setEditingBuilding(null)
          setFormData({ name: '', code: '', description: '', is_active: true })
          setFormErrors({ name: '', code: '', description: '' })
        }
      }}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Edit Building</DialogTitle>
            <DialogDescription>
              Update building information.
            </DialogDescription>
          </DialogHeader>
          <div className="grid gap-4 py-4">
            <div className="grid gap-2">
              <Label htmlFor="edit-name">Building Name *</Label>
              <Input
                id="edit-name"
                value={formData.name}
                onChange={(e) => {
                  setFormData({ ...formData, name: e.target.value })
                  if (formErrors.name) {
                    setFormErrors({ ...formErrors, name: '' })
                  }
                }}
                placeholder="Enter building name"
                className={formErrors.name ? "border-red-500" : ""}
              />
              {formErrors.name && (
                <p className="text-sm text-red-500">{formErrors.name}</p>
              )}
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-code">Building Code *</Label>
              <Input
                id="edit-code"
                value={formData.code}
                onChange={(e) => {
                  setFormData({ ...formData, code: e.target.value })
                  if (formErrors.code) {
                    setFormErrors({ ...formErrors, code: '' })
                  }
                }}
                placeholder="Enter building code"
                className={formErrors.code ? "border-red-500" : ""}
              />
              {formErrors.code && (
                <p className="text-sm text-red-500">{formErrors.code}</p>
              )}
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-description">Description</Label>
              <Textarea
                id="edit-description"
                value={formData.description}
                onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                placeholder="Enter building description"
              />
            </div>
            <div className="flex items-center space-x-2">
              <Switch
                id="edit-is_active"
                checked={formData.is_active}
                onCheckedChange={(checked) => setFormData({ ...formData, is_active: checked })}
              />
              <Label htmlFor="edit-is_active">Active</Label>
            </div>
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setIsEditDialogOpen(false)}>
              Cancel
            </Button>
            <Button onClick={handleEditBuilding} disabled={isUpdatingBuilding}>
              {isUpdatingBuilding ? (
                <>
                  <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                  Updating...
                </>
              ) : (
                'Update Building'
              )}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </SidebarProvider>
  )
} 