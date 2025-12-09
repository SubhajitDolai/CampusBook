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
import { Switch } from "@/components/ui/switch"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Skeleton } from "@/components/ui/skeleton"
import { 
  Building2, 
  Search,
  Plus,
  Edit,
  Trash2,
  CheckCircle,
  XCircle,
  Loader2,
  X
} from "lucide-react"
import { useState, useEffect } from "react"
import { getFloors, addFloor, updateFloor, deleteFloor, getBuildings } from "./actions"

type Floor = {
  id: string
  building_id: string
  floor_number: number
  name: string | null
  is_active: boolean
  created_at: string
  buildings?: {
    name: string
    code: string
  }
}

type Building = {
  id: string
  name: string
  code: string
}

export default function FloorsPage() {
  const [floors, setFloors] = useState<Floor[]>([])
  const [filteredFloors, setFilteredFloors] = useState<Floor[]>([])
  const [buildings, setBuildings] = useState<Building[]>([])
  const [searchTerm, setSearchTerm] = useState("")
  const [selectedBuilding, setSelectedBuilding] = useState<string>("all")
  const [isLoading, setIsLoading] = useState(true)
  const [isAddDialogOpen, setIsAddDialogOpen] = useState(false)
  const [isEditDialogOpen, setIsEditDialogOpen] = useState(false)
  const [editingFloor, setEditingFloor] = useState<Floor | null>(null)
  const [isAddingFloor, setIsAddingFloor] = useState(false)
  const [isUpdatingFloor, setIsUpdatingFloor] = useState(false)
  const [deletingFloorId, setDeletingFloorId] = useState<string | null>(null)
  const [updatingStatusId, setUpdatingStatusId] = useState<string | null>(null)
  const [formErrors, setFormErrors] = useState({
    building_id: '',
    floor_number: '',
    name: ''
  })
  const [formData, setFormData] = useState({
    building_id: '',
    floor_number: 0,
    name: '',
    is_active: true
  })

  useEffect(() => {
    fetchFloors()
    fetchBuildings()
  }, [])

  const fetchFloors = async () => {
    try {
      setIsLoading(true)
      const floorsData = await getFloors()
      setFloors(floorsData)
      setFilteredFloors(floorsData)
    } catch (error) {
      console.error('Error fetching floors:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const fetchBuildings = async () => {
    try {
      const buildingsData = await getBuildings()
      setBuildings(buildingsData)
    } catch (error) {
      console.error('Error fetching buildings:', error)
    }
  }

  useEffect(() => {
    let filtered = floors.filter(floor => 
      floor.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      floor.floor_number.toString().includes(searchTerm) ||
      floor.buildings?.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      floor.buildings?.code?.toLowerCase().includes(searchTerm.toLowerCase())
    )
    
    // Apply building filter if selected
    if (selectedBuilding && selectedBuilding !== "all") {
      filtered = filtered.filter(floor => floor.building_id === selectedBuilding)
    }
    
    // Sort by building name first, then by floor number
    const sorted = filtered.sort((a, b) => {
      const buildingA = a.buildings?.name || ''
      const buildingB = b.buildings?.name || ''
      
      if (buildingA !== buildingB) {
        return buildingA.localeCompare(buildingB)
      }
      
      return a.floor_number - b.floor_number
    })
    
    setFilteredFloors(sorted)
  }, [searchTerm, selectedBuilding, floors])

  const validateForm = () => {
    const errors = {
      building_id: '',
      floor_number: '',
      name: ''
    }
    
    if (!formData.building_id) {
      errors.building_id = 'Building is required'
    }
    
    if (formData.floor_number === undefined || formData.floor_number === null) {
      errors.floor_number = 'Floor number is required'
    }
    
    setFormErrors(errors)
    return !errors.building_id && !errors.floor_number
  }

  const handleAddFloor = async () => {
    if (!validateForm()) {
      return
    }

    setIsAddingFloor(true)
    try {
      const formDataObj = new FormData()
      formDataObj.append('building_id', formData.building_id)
      formDataObj.append('floor_number', formData.floor_number.toString())
      formDataObj.append('name', formData.name.trim())
      formDataObj.append('is_active', formData.is_active.toString())

      const result = await addFloor(formDataObj)
      
      if (result.error) {
        console.error('Error adding floor:', result.error)
        return
      }

      // Refresh the floors list
      await fetchFloors()
      setFormData({ building_id: '', floor_number: 0, name: '', is_active: true })
      setFormErrors({ building_id: '', floor_number: '', name: '' })
      setIsAddDialogOpen(false)
    } catch (error) {
      console.error('Error adding floor:', error)
    } finally {
      setIsAddingFloor(false)
    }
  }

  const clearFilters = () => {
    setSearchTerm("")
    setSelectedBuilding("all")
  }

  const handleEditFloor = async () => {
    if (!editingFloor) return
    
    if (!validateForm()) {
      return
    }
    
    setIsUpdatingFloor(true)
    try {
      const formDataObj = new FormData()
      formDataObj.append('building_id', formData.building_id)
      formDataObj.append('floor_number', formData.floor_number.toString())
      formDataObj.append('name', formData.name.trim())
      formDataObj.append('is_active', formData.is_active.toString())

      const result = await updateFloor(editingFloor.id, formDataObj)
      
      if (result.error) {
        console.error('Error updating floor:', result.error)
        return
      }

      // Refresh the floors list
      await fetchFloors()
      setEditingFloor(null)
      setFormData({ building_id: '', floor_number: 0, name: '', is_active: true })
      setFormErrors({ building_id: '', floor_number: '', name: '' })
      setIsEditDialogOpen(false)
    } catch (error) {
      console.error('Error updating floor:', error)
    } finally {
      setIsUpdatingFloor(false)
    }
  }

  const handleDeleteFloor = async (id: string) => {
    setDeletingFloorId(id)
    try {
      const result = await deleteFloor(id)
      
      if (result.error) {
        console.error('Error deleting floor:', result.error)
        return
      }

      // Refresh the floors list
      await fetchFloors()
    } catch (error) {
      console.error('Error deleting floor:', error)
    } finally {
      setDeletingFloorId(null)
    }
  }

  const openEditDialog = (floor: Floor) => {
    setEditingFloor(floor)
    setFormData({
      building_id: floor.building_id,
      floor_number: floor.floor_number,
      name: floor.name || '',
      is_active: floor.is_active
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
                  <BreadcrumbPage>Floors</BreadcrumbPage>
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
                <h1 className="text-3xl font-bold tracking-tight">Floors</h1>
                <p className="text-muted-foreground">
                  Manage building floors and levels.
                </p>
              </div>
              <Dialog open={isAddDialogOpen} onOpenChange={(open) => {
                setIsAddDialogOpen(open)
                if (!open) {
                  setFormData({ building_id: '', floor_number: 0, name: '', is_active: true })
                  setFormErrors({ building_id: '', floor_number: '', name: '' })
                }
              }}>
                <DialogTrigger asChild>
                  <Button>
                    <Plus className="h-4 w-4" />
                    Add Floor
                  </Button>
                </DialogTrigger>
                <DialogContent>
                  <DialogHeader>
                    <DialogTitle>Add New Floor</DialogTitle>
                    <DialogDescription>
                      Create a new floor entry for a building.
                    </DialogDescription>
                  </DialogHeader>
                  <div className="grid gap-4 py-4">
                    <div className="grid gap-2">
                      <Label htmlFor="building">Building *</Label>
                      <Select
                        value={formData.building_id}
                        onValueChange={(value) => {
                          setFormData({ ...formData, building_id: value })
                          if (formErrors.building_id) {
                            setFormErrors({ ...formErrors, building_id: '' })
                          }
                        }}
                      >
                        <SelectTrigger className={formErrors.building_id ? "border-red-500" : ""}>
                          <SelectValue placeholder="Select a building" />
                        </SelectTrigger>
                        <SelectContent>
                          {buildings.map((building) => (
                            <SelectItem key={building.id} value={building.id}>
                              {building.name} ({building.code})
                            </SelectItem>
                          ))}
                        </SelectContent>
                      </Select>
                      {formErrors.building_id && (
                        <p className="text-sm text-red-500">{formErrors.building_id}</p>
                      )}
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="floor_number">Floor Number *</Label>
                      <Input
                        id="floor_number"
                        type="number"
                        value={formData.floor_number}
                        onChange={(e) => {
                          const value = e.target.value === '' ? 0 : parseInt(e.target.value)
                          setFormData({ ...formData, floor_number: value })
                          if (formErrors.floor_number) {
                            setFormErrors({ ...formErrors, floor_number: '' })
                          }
                        }}
                        placeholder="Enter floor number (e.g., -2, -1, 0, 1, 2)"
                        className={formErrors.floor_number ? "border-red-500" : ""}
                      />
                      {formErrors.floor_number && (
                        <p className="text-sm text-red-500">{formErrors.floor_number}</p>
                      )}
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="name">Floor Name</Label>
                      <Input
                        id="name"
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        placeholder="Enter floor name (optional) - will default to 'Floor X'"
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
                    <Button onClick={handleAddFloor} disabled={isAddingFloor}>
                      {isAddingFloor ? (
                        <>
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Adding...
                        </>
                      ) : (
                        'Add Floor'
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
                <CardTitle className="text-sm font-medium">Total Floors</CardTitle>
                <Building2 className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{filteredFloors.length}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  All floors
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Active Floors</CardTitle>
                <CheckCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredFloors.filter(f => f.is_active).length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Currently active
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Inactive Floors</CardTitle>
                <XCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredFloors.filter(f => !f.is_active).length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Currently inactive
                </p>
              </CardContent>
            </Card>
          </div>

          {/* Search and Floors Table */}
          <Card>
            <CardHeader>
              <CardTitle>Floor Management</CardTitle>
              <CardDescription>
                Search and manage building floors and levels.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="mb-4">
                <div className="flex flex-col gap-4 sm:flex-row sm:gap-4 items-stretch sm:items-center">
                  <div className="relative flex-1 min-w-0">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                    <Input
                      placeholder="Search floors by name, number, or building..."
                      className="pl-10 h-10"
                      value={searchTerm}
                      onChange={(e) => setSearchTerm(e.target.value)}
                    />
                  </div>
                  <div className="w-full sm:w-48">
                    <Select value={selectedBuilding} onValueChange={setSelectedBuilding}>
                      <SelectTrigger className="h-10">
                        <SelectValue placeholder="Filter by building" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="all">All Buildings</SelectItem>
                        {buildings.map((building) => (
                          <SelectItem key={building.id} value={building.id}>
                            {building.name}
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>
                  <div className="w-10">
                    {(searchTerm || selectedBuilding !== "all") && (
                      <Button
                        variant="outline"
                        size="icon"
                        onClick={clearFilters}
                        className="h-10 w-10"
                      >
                        <X className="h-4 w-4" />
                      </Button>
                    )}
                  </div>
                </div>
              </div>

              {/* Floors Table */}
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
                        <Skeleton className="h-6 w-24" />
                        <Skeleton className="h-6 w-16" />
                        <Skeleton className="h-6 w-20" />
                        <div className="flex gap-2">
                          <Skeleton className="h-8 w-8" />
                          <Skeleton className="h-8 w-8" />
                        </div>
                      </div>
                    ))}
                  </div>
                ) : filteredFloors.length === 0 ? (
                  <div className="flex flex-col items-center justify-center py-12">
                    <div className="flex h-16 w-16 items-center justify-center rounded-full bg-muted mb-4">
                      <Building2 className="h-8 w-8 text-muted-foreground" />
                    </div>
                    <h3 className="text-lg font-semibold mb-2">No floors found</h3>
                    <p className="text-sm text-muted-foreground text-center mb-4 max-w-sm">
                      {searchTerm ? 
                        `No floors match your search for "${searchTerm}". Try adjusting your search terms.` :
                        'Get started by adding your first floor to a building.'
                      }
                    </p>
                    {!searchTerm && (
                      <Button onClick={() => setIsAddDialogOpen(true)}>
                        <Plus className="h-4 w-4" />
                        Add Your First Floor
                      </Button>
                    )}
                  </div>
                ) : (
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Floor</TableHead>
                        <TableHead>Building</TableHead>
                        <TableHead>Floor Number</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {filteredFloors.map((floor) => (
                        <TableRow key={floor.id} className={!floor.is_active ? "opacity-50" : ""}>
                          <TableCell>
                            <div className="flex items-center gap-3">
                              <div className="flex h-10 w-10 items-center justify-center rounded-full bg-muted">
                                <Building2 className="h-5 w-5" />
                              </div>
                              <div>
                                <p className="font-medium">{floor.name || `Floor ${floor.floor_number}`}</p>
                                <p className="text-sm text-muted-foreground">
                                  Created {new Date(floor.created_at).toLocaleDateString()}
                                </p>
                              </div>
                            </div>
                          </TableCell>
                          <TableCell>
                            <div>
                              <p className="font-medium">{floor.buildings?.name}</p>
                              <Badge variant="outline">{floor.buildings?.code}</Badge>
                            </div>
                          </TableCell>
                          <TableCell>
                            <Badge variant="secondary">{floor.floor_number}</Badge>
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              <Switch
                                checked={floor.is_active}
                                disabled={updatingStatusId === floor.id}
                                onCheckedChange={async (checked) => {
                                  setUpdatingStatusId(floor.id)
                                  try {
                                    const formDataObj = new FormData()
                                    formDataObj.append('building_id', floor.building_id)
                                    formDataObj.append('floor_number', floor.floor_number.toString())
                                    formDataObj.append('name', floor.name || '')
                                    formDataObj.append('is_active', checked.toString())

                                    const result = await updateFloor(floor.id, formDataObj)
                                    
                                    if (result.error) {
                                      console.error('Error updating floor status:', result.error)
                                      return
                                    }

                                    // Refresh the floors list
                                    await fetchFloors()
                                  } catch (error) {
                                    console.error('Error updating floor status:', error)
                                  } finally {
                                    setUpdatingStatusId(null)
                                  }
                                }}
                              />
                              <span className="text-sm text-muted-foreground">
                                {floor.is_active ? 'Active' : 'Inactive'}
                              </span>
                              {updatingStatusId === floor.id && (
                                <Loader2 className="h-3 w-3 animate-spin text-muted-foreground" />
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => openEditDialog(floor)}
                              >
                                <Edit className="h-4 w-4" />
                              </Button>
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => handleDeleteFloor(floor.id)}
                                disabled={deletingFloorId === floor.id}
                              >
                                {deletingFloorId === floor.id ? (
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
          setEditingFloor(null)
          setFormData({ building_id: '', floor_number: 0, name: '', is_active: true })
          setFormErrors({ building_id: '', floor_number: '', name: '' })
        }
      }}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Edit Floor</DialogTitle>
            <DialogDescription>
              Update floor information.
            </DialogDescription>
          </DialogHeader>
          <div className="grid gap-4 py-4">
            <div className="grid gap-2">
              <Label htmlFor="edit-building">Building *</Label>
              <Select
                value={formData.building_id}
                onValueChange={(value) => {
                  setFormData({ ...formData, building_id: value })
                  if (formErrors.building_id) {
                    setFormErrors({ ...formErrors, building_id: '' })
                  }
                }}
              >
                <SelectTrigger className={formErrors.building_id ? "border-red-500" : ""}>
                  <SelectValue placeholder="Select a building" />
                </SelectTrigger>
                <SelectContent>
                  {buildings.map((building) => (
                    <SelectItem key={building.id} value={building.id}>
                      {building.name} ({building.code})
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
              {formErrors.building_id && (
                <p className="text-sm text-red-500">{formErrors.building_id}</p>
              )}
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-floor_number">Floor Number *</Label>
                                    <Input
                        id="edit-floor_number"
                        type="number"
                        value={formData.floor_number}
                        onChange={(e) => {
                          const value = e.target.value === '' ? 0 : parseInt(e.target.value)
                          setFormData({ ...formData, floor_number: value })
                          if (formErrors.floor_number) {
                            setFormErrors({ ...formErrors, floor_number: '' })
                          }
                        }}
                        placeholder="Enter floor number (e.g., -2, -1, 0, 1, 2)"
                        className={formErrors.floor_number ? "border-red-500" : ""}
                      />
              {formErrors.floor_number && (
                <p className="text-sm text-red-500">{formErrors.floor_number}</p>
              )}
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-name">Floor Name</Label>
                      <Input
                        id="edit-name"
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        placeholder="Enter floor name (optional) - will default to 'Floor X'"
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
            <Button onClick={handleEditFloor} disabled={isUpdatingFloor}>
              {isUpdatingFloor ? (
                <>
                  <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                  Updating...
                </>
              ) : (
                'Update Floor'
              )}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </SidebarProvider>
  )
} 