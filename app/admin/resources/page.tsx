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
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Skeleton } from "@/components/ui/skeleton"
import { 
  Settings, 
  Search,
  Plus,
  Edit,
  Trash2,
  CheckCircle,
  Loader2,
  X
} from "lucide-react"
import { useState, useEffect } from "react"
import { getResources, addResource, updateResource, deleteResource, getBuildings, getFloors } from "./actions"

type Resource = {
  id: string
  building_id: string
  floor_id: string
  name: string
  type: string
  capacity: number | null
  description: string | null
  equipment: string | null
  is_active: boolean
  created_at: string
  buildings?: {
    name: string
    code: string
  }
  floors?: {
    floor_number: number
    name: string | null
  }
}

type Building = {
  id: string
  name: string
  code: string
}

type Floor = {
  id: string
  building_id: string
  floor_number: number
  name: string | null
}

export default function ResourcesPage() {
  const [resources, setResources] = useState<Resource[]>([])
  const [filteredResources, setFilteredResources] = useState<Resource[]>([])
  const [buildings, setBuildings] = useState<Building[]>([])
  const [floors, setFloors] = useState<Floor[]>([])
  const [searchTerm, setSearchTerm] = useState("")
  const [selectedBuilding, setSelectedBuilding] = useState<string>("all")
  const [selectedFloor, setSelectedFloor] = useState<string>("all")
  const [isLoading, setIsLoading] = useState(true)
  const [isAddDialogOpen, setIsAddDialogOpen] = useState(false)
  const [isEditDialogOpen, setIsEditDialogOpen] = useState(false)
  const [editingResource, setEditingResource] = useState<Resource | null>(null)
  const [isAddingResource, setIsAddingResource] = useState(false)
  const [isUpdatingResource, setIsUpdatingResource] = useState(false)
  const [deletingResourceId, setDeletingResourceId] = useState<string | null>(null)
  const [updatingStatusId, setUpdatingStatusId] = useState<string | null>(null)
  const [formErrors, setFormErrors] = useState({
    building_id: '',
    floor_id: '',
    name: '',
    type: '',
    capacity: ''
  })
  const [formData, setFormData] = useState({
    building_id: '',
    floor_id: '',
    name: '',
    type: '',
    capacity: '',
    description: '',
    equipment: '',
    is_active: true
  })

  useEffect(() => {
    fetchResources()
    fetchBuildings()
    fetchFloors()
  }, [])

  const fetchResources = async () => {
    try {
      setIsLoading(true)
      const resourcesData = await getResources()
      setResources(resourcesData)
      setFilteredResources(resourcesData)
    } catch (error) {
      console.error('Error fetching resources:', error)
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

  const fetchFloors = async () => {
    try {
      const floorsData = await getFloors()
      setFloors(floorsData)
    } catch (error) {
      console.error('Error fetching floors:', error)
    }
  }

  useEffect(() => {
    let filtered = resources.filter(resource => 
      resource.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      resource.type?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      resource.buildings?.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      resource.buildings?.code?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      resource.floors?.floor_number?.toString().includes(searchTerm)
    )
    
    // Apply building filter if selected
    if (selectedBuilding && selectedBuilding !== "all") {
      filtered = filtered.filter(resource => resource.building_id === selectedBuilding)
    }
    
    // Apply floor filter if selected
    if (selectedFloor && selectedFloor !== "all") {
      filtered = filtered.filter(resource => resource.floor_id === selectedFloor)
    }
    
    // Sort by building name first, then by floor number, then by resource name
    const sorted = filtered.sort((a, b) => {
      const buildingA = a.buildings?.name || ''
      const buildingB = b.buildings?.name || ''
      
      if (buildingA !== buildingB) {
        return buildingA.localeCompare(buildingB)
      }
      
      const floorA = a.floors?.floor_number || 0
      const floorB = b.floors?.floor_number || 0
      
      if (floorA !== floorB) {
        return floorA - floorB
      }
      
      return (a.name || '').localeCompare(b.name || '')
    })
    
    setFilteredResources(sorted)
  }, [searchTerm, selectedBuilding, selectedFloor, resources])

  const validateForm = () => {
    const errors = {
      building_id: '',
      floor_id: '',
      name: '',
      type: '',
      capacity: ''
    }
    
    if (!formData.building_id) {
      errors.building_id = 'Building is required'
    }
    
    if (!formData.floor_id) {
      errors.floor_id = 'Floor is required'
    }
    
    if (!formData.name.trim()) {
      errors.name = 'Resource name is required'
    }
    
    if (!formData.type) {
      errors.type = 'Resource type is required'
    }
    
    if (formData.capacity && (parseInt(formData.capacity) <= 0)) {
      errors.capacity = 'Capacity must be greater than 0'
    }
    
    setFormErrors(errors)
    return !errors.building_id && !errors.floor_id && !errors.name && !errors.type
  }

  const handleAddResource = async () => {
    if (!validateForm()) {
      return
    }

    setIsAddingResource(true)
    try {
      const formDataObj = new FormData()
      formDataObj.append('building_id', formData.building_id)
      formDataObj.append('floor_id', formData.floor_id)
      formDataObj.append('name', formData.name.trim())
      formDataObj.append('type', formData.type)
      formDataObj.append('capacity', formData.capacity || '')
      formDataObj.append('description', formData.description.trim())
      formDataObj.append('equipment', formData.equipment.trim())
      formDataObj.append('is_active', formData.is_active.toString())

      const result = await addResource(formDataObj)
      
      if (result.error) {
        console.error('Error adding resource:', result.error)
        return
      }

      // Refresh the resources list
      await fetchResources()
      setFormData({ building_id: '', floor_id: '', name: '', type: '', capacity: '', description: '', equipment: '', is_active: true })
      setFormErrors({ building_id: '', floor_id: '', name: '', type: '', capacity: '' })
      setIsAddDialogOpen(false)
    } catch (error) {
      console.error('Error adding resource:', error)
    } finally {
      setIsAddingResource(false)
    }
  }

  const handleEditResource = async () => {
    if (!editingResource) return
    
    if (!validateForm()) {
      return
    }
    
    setIsUpdatingResource(true)
    try {
      const formDataObj = new FormData()
      formDataObj.append('building_id', formData.building_id)
      formDataObj.append('floor_id', formData.floor_id)
      formDataObj.append('name', formData.name.trim())
      formDataObj.append('type', formData.type)
      formDataObj.append('capacity', formData.capacity || '')
      formDataObj.append('description', formData.description.trim())
      formDataObj.append('equipment', formData.equipment.trim())
      formDataObj.append('is_active', formData.is_active.toString())

      const result = await updateResource(editingResource.id, formDataObj)
      
      if (result.error) {
        console.error('Error updating resource:', result.error)
        return
      }

      // Refresh the resources list
      await fetchResources()
      setEditingResource(null)
      setFormData({ building_id: '', floor_id: '', name: '', type: '', capacity: '', description: '', equipment: '', is_active: true })
      setFormErrors({ building_id: '', floor_id: '', name: '', type: '', capacity: '' })
      setIsEditDialogOpen(false)
    } catch (error) {
      console.error('Error updating resource:', error)
    } finally {
      setIsUpdatingResource(false)
    }
  }

  const handleDeleteResource = async (id: string) => {
    setDeletingResourceId(id)
    try {
      const result = await deleteResource(id)
      
      if (result.error) {
        console.error('Error deleting resource:', result.error)
        return
      }

      // Refresh the resources list
      await fetchResources()
    } catch (error) {
      console.error('Error deleting resource:', error)
    } finally {
      setDeletingResourceId(null)
    }
  }

  const openEditDialog = (resource: Resource) => {
    setEditingResource(resource)
    setFormData({
      building_id: resource.building_id,
      floor_id: resource.floor_id,
      name: resource.name,
      type: resource.type,
      capacity: resource.capacity?.toString() || '',
      description: resource.description || '',
      equipment: resource.equipment || '',
      is_active: resource.is_active
    })
    setIsEditDialogOpen(true)
  }

  const getTypeBadge = (type: string) => {
    const typeColors = {
      classroom: 'bg-blue-100 text-blue-800',
      lab: 'bg-green-100 text-green-800',
      hall: 'bg-purple-100 text-purple-800',
      auditorium: 'bg-orange-100 text-orange-800',
      others: 'bg-gray-100 text-gray-800'
    }
    
    return (
      <Badge className={typeColors[type as keyof typeof typeColors] || 'bg-gray-100 text-gray-800'}>
        {type.charAt(0).toUpperCase() + type.slice(1)}
      </Badge>
    )
  }

  const getFloorsForBuilding = (buildingId: string) => {
    return floors.filter(floor => floor.building_id === buildingId)
  }

  const clearFilters = () => {
    setSearchTerm("")
    setSelectedBuilding("all")
    setSelectedFloor("all")
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
                  <BreadcrumbPage>Resources</BreadcrumbPage>
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
                <h1 className="text-3xl font-bold tracking-tight">Resources</h1>
                <p className="text-muted-foreground">
                  Manage bookable resources like classrooms, labs, and halls.
                </p>
              </div>
              <Dialog open={isAddDialogOpen} onOpenChange={(open) => {
                setIsAddDialogOpen(open)
                if (!open) {
                  setFormData({ building_id: '', floor_id: '', name: '', type: '', capacity: '', description: '', equipment: '', is_active: true })
                  setFormErrors({ building_id: '', floor_id: '', name: '', type: '', capacity: '' })
                }
              }}>
                <DialogTrigger asChild>
                  <Button>
                    <Plus className="h-4 w-4" />
                    Add Resource
                  </Button>
                </DialogTrigger>
                <DialogContent className="max-w-2xl">
                  <DialogHeader>
                    <DialogTitle>Add New Resource</DialogTitle>
                    <DialogDescription>
                      Create a new bookable resource for a specific floor.
                    </DialogDescription>
                  </DialogHeader>
                  <div className="grid gap-4 py-4">
                    <div className="grid grid-cols-2 gap-4">
                      <div className="grid gap-2">
                        <Label htmlFor="building">Building *</Label>
                        <Select
                          value={formData.building_id}
                          onValueChange={(value) => {
                            setFormData({ ...formData, building_id: value, floor_id: '' })
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
                        <Label htmlFor="floor">Floor *</Label>
                        <Select
                          value={formData.floor_id}
                          onValueChange={(value) => {
                            setFormData({ ...formData, floor_id: value })
                            if (formErrors.floor_id) {
                              setFormErrors({ ...formErrors, floor_id: '' })
                            }
                          }}
                          disabled={!formData.building_id}
                        >
                          <SelectTrigger className={formErrors.floor_id ? "border-red-500" : ""}>
                            <SelectValue placeholder="Select a floor" />
                          </SelectTrigger>
                          <SelectContent>
                            {getFloorsForBuilding(formData.building_id).map((floor) => (
                              <SelectItem key={floor.id} value={floor.id}>
                                Floor {floor.floor_number} {floor.name ? `(${floor.name})` : ''}
                              </SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                        {formErrors.floor_id && (
                          <p className="text-sm text-red-500">{formErrors.floor_id}</p>
                        )}
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                      <div className="grid gap-2">
                        <Label htmlFor="name">Resource Name *</Label>
                        <Input
                          id="name"
                          value={formData.name}
                          onChange={(e) => {
                            setFormData({ ...formData, name: e.target.value })
                            if (formErrors.name) {
                              setFormErrors({ ...formErrors, name: '' })
                            }
                          }}
                          placeholder="Enter resource name"
                          className={formErrors.name ? "border-red-500" : ""}
                        />
                        {formErrors.name && (
                          <p className="text-sm text-red-500">{formErrors.name}</p>
                        )}
                      </div>
                      <div className="grid gap-2">
                        <Label htmlFor="type">Resource Type *</Label>
                        <Select
                          value={formData.type}
                          onValueChange={(value) => {
                            setFormData({ ...formData, type: value })
                            if (formErrors.type) {
                              setFormErrors({ ...formErrors, type: '' })
                            }
                          }}
                        >
                          <SelectTrigger className={formErrors.type ? "border-red-500" : ""}>
                            <SelectValue placeholder="Select resource type" />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="classroom">Classroom</SelectItem>
                            <SelectItem value="lab">Lab</SelectItem>
                            <SelectItem value="hall">Hall</SelectItem>
                            <SelectItem value="auditorium">Auditorium</SelectItem>
                            <SelectItem value="others">Others</SelectItem>
                          </SelectContent>
                        </Select>
                        {formErrors.type && (
                          <p className="text-sm text-red-500">{formErrors.type}</p>
                        )}
                      </div>
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="capacity">Capacity</Label>
                      <Input
                        id="capacity"
                        type="number"
                        value={formData.capacity}
                        onChange={(e) => {
                          setFormData({ ...formData, capacity: e.target.value })
                          if (formErrors.capacity) {
                            setFormErrors({ ...formErrors, capacity: '' })
                          }
                        }}
                        placeholder="Enter capacity (optional)"
                        className={formErrors.capacity ? "border-red-500" : ""}
                      />
                      {formErrors.capacity && (
                        <p className="text-sm text-red-500">{formErrors.capacity}</p>
                      )}
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="description">Description</Label>
                      <Textarea
                        id="description"
                        value={formData.description}
                        onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                        placeholder="Enter resource description (optional)"
                        rows={3}
                      />
                    </div>
                    <div className="grid gap-2">
                      <Label htmlFor="equipment">Equipment</Label>
                      <Textarea
                        id="equipment"
                        value={formData.equipment}
                        onChange={(e) => setFormData({ ...formData, equipment: e.target.value })}
                        placeholder="Enter available equipment (optional)"
                        rows={2}
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
                    <Button onClick={handleAddResource} disabled={isAddingResource}>
                      {isAddingResource ? (
                        <>
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Adding...
                        </>
                      ) : (
                        'Add Resource'
                      )}
                    </Button>
                  </DialogFooter>
                </DialogContent>
              </Dialog>
            </div>
          </div>

          {/* Stats Cards */}
          <div className="grid gap-4 md:grid-cols-4">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Resources</CardTitle>
                <Settings className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">{filteredResources.length}</div>
                )}
                <p className="text-xs text-muted-foreground">
                  All resources
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Active Resources</CardTitle>
                <CheckCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredResources.filter(r => r.is_active).length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Currently active
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Classrooms</CardTitle>
                <Badge variant="outline" className="h-4 w-4 p-0">
                  <span className="text-xs">C</span>
                </Badge>
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredResources.filter(r => r.type === 'classroom').length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Available classrooms
                </p>
              </CardContent>
            </Card>
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Labs</CardTitle>
                <Badge variant="outline" className="h-4 w-4 p-0">
                  <span className="text-xs">L</span>
                </Badge>
              </CardHeader>
              <CardContent>
                {isLoading ? (
                  <Skeleton className="h-8 w-16" />
                ) : (
                  <div className="text-2xl font-bold">
                    {filteredResources.filter(r => r.type === 'lab').length}
                  </div>
                )}
                <p className="text-xs text-muted-foreground">
                  Available labs
                </p>
              </CardContent>
            </Card>
          </div>

          {/* Search and Resources Table */}
          <Card>
            <CardHeader>
              <CardTitle>Resource Management</CardTitle>
              <CardDescription>
                Search and manage bookable resources across all buildings and floors.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="mb-4">
                <div className="flex flex-col gap-4 sm:flex-row sm:gap-4 items-stretch sm:items-center">
                  <div className="relative flex-1 min-w-0">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                    <Input
                      placeholder="Search resources by name, type, building, or floor..."
                      className="pl-10 h-10"
                      value={searchTerm}
                      onChange={(e) => setSearchTerm(e.target.value)}
                    />
                  </div>
                  <div className="w-full sm:w-48">
                    <Select value={selectedBuilding} onValueChange={(value) => {
                      setSelectedBuilding(value)
                      setSelectedFloor("all") // Reset floor when building changes
                    }}>
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
                  <div className="w-full sm:w-48">
                    <Select value={selectedFloor} onValueChange={setSelectedFloor} disabled={selectedBuilding === "all"}>
                      <SelectTrigger className="h-10">
                        <SelectValue placeholder="Filter by floor" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="all">All Floors</SelectItem>
                        {selectedBuilding !== "all" && getFloorsForBuilding(selectedBuilding).map((floor) => (
                          <SelectItem key={floor.id} value={floor.id}>
                            Floor {floor.floor_number} {floor.name ? `(${floor.name})` : ''}
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>
                  {(searchTerm || selectedBuilding !== "all" || selectedFloor !== "all") && (
                    <div>
                      <Button
                        variant="outline"
                        size="icon"
                        onClick={clearFilters}
                        className="h-10 w-10"
                      >
                        <X className="h-4 w-4" />
                      </Button>
                    </div>
                  )}
                </div>
              </div>

              {/* Resources Table */}
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
                        <Skeleton className="h-6 w-20" />
                        <div className="flex gap-2">
                          <Skeleton className="h-8 w-8" />
                          <Skeleton className="h-8 w-8" />
                        </div>
                      </div>
                    ))}
                  </div>
                ) : filteredResources.length === 0 ? (
                  <div className="flex flex-col items-center justify-center py-12">
                    <div className="flex h-16 w-16 items-center justify-center rounded-full bg-muted mb-4">
                      <Settings className="h-8 w-8 text-muted-foreground" />
                    </div>
                    <h3 className="text-lg font-semibold mb-2">No resources found</h3>
                    <p className="text-sm text-muted-foreground text-center mb-4 max-w-sm">
                      {searchTerm ? 
                        `No resources match your search for "${searchTerm}". Try adjusting your search terms.` :
                        'Get started by adding your first resource to a floor.'
                      }
                    </p>
                    {!searchTerm && (
                      <Button onClick={() => setIsAddDialogOpen(true)}>
                        <Plus className="h-4 w-4" />
                        Add Your First Resource
                      </Button>
                    )}
                  </div>
                ) : (
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Resource</TableHead>
                        <TableHead>Location</TableHead>
                        <TableHead>Type</TableHead>
                        <TableHead>Capacity</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {filteredResources.map((resource) => (
                        <TableRow key={resource.id} className={!resource.is_active ? "opacity-50" : ""}>
                          <TableCell>
                            <div className="flex items-center gap-3">
                              <div className="flex h-10 w-10 items-center justify-center rounded-full bg-muted">
                                <Settings className="h-5 w-5" />
                              </div>
                              <div>
                                <p className="font-medium">{resource.name}</p>
                                <p className="text-sm text-muted-foreground">
                                  Created {new Date(resource.created_at).toLocaleDateString()}
                                </p>
                              </div>
                            </div>
                          </TableCell>
                          <TableCell>
                            <div>
                              <p className="font-medium">{resource.buildings?.name}</p>
                              <p className="text-sm text-muted-foreground">
                                Floor {resource.floors?.floor_number} {resource.floors?.name ? `(${resource.floors.name})` : ''}
                              </p>
                            </div>
                          </TableCell>
                          <TableCell>
                            {getTypeBadge(resource.type)}
                          </TableCell>
                          <TableCell>
                            {resource.capacity ? (
                              <Badge variant="secondary">{resource.capacity} people</Badge>
                            ) : (
                              <span className="text-sm text-muted-foreground">Not specified</span>
                            )}
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              <Switch
                                checked={resource.is_active}
                                disabled={updatingStatusId === resource.id}
                                onCheckedChange={async (checked) => {
                                  setUpdatingStatusId(resource.id)
                                  try {
                                    const formDataObj = new FormData()
                                    formDataObj.append('building_id', resource.building_id)
                                    formDataObj.append('floor_id', resource.floor_id)
                                    formDataObj.append('name', resource.name)
                                    formDataObj.append('type', resource.type)
                                    formDataObj.append('capacity', resource.capacity?.toString() || '')
                                    formDataObj.append('description', resource.description || '')
                                    formDataObj.append('equipment', resource.equipment || '')
                                    formDataObj.append('is_active', checked.toString())

                                    const result = await updateResource(resource.id, formDataObj)
                                    
                                    if (result.error) {
                                      console.error('Error updating resource status:', result.error)
                                      return
                                    }

                                    // Refresh the resources list
                                    await fetchResources()
                                  } catch (error) {
                                    console.error('Error updating resource status:', error)
                                  } finally {
                                    setUpdatingStatusId(null)
                                  }
                                }}
                              />
                              <span className="text-sm text-muted-foreground">
                                {resource.is_active ? 'Active' : 'Inactive'}
                              </span>
                              {updatingStatusId === resource.id && (
                                <Loader2 className="h-3 w-3 animate-spin text-muted-foreground" />
                              )}
                            </div>
                          </TableCell>
                          <TableCell>
                            <div className="flex items-center gap-2">
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => openEditDialog(resource)}
                              >
                                <Edit className="h-4 w-4" />
                              </Button>
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => handleDeleteResource(resource.id)}
                                disabled={deletingResourceId === resource.id}
                              >
                                {deletingResourceId === resource.id ? (
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
          setEditingResource(null)
          setFormData({ building_id: '', floor_id: '', name: '', type: '', capacity: '', description: '', equipment: '', is_active: true })
          setFormErrors({ building_id: '', floor_id: '', name: '', type: '', capacity: '' })
        }
      }}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle>Edit Resource</DialogTitle>
            <DialogDescription>
              Update resource information.
            </DialogDescription>
          </DialogHeader>
          <div className="grid gap-4 py-4">
            <div className="grid grid-cols-2 gap-4">
              <div className="grid gap-2">
                <Label htmlFor="edit-building">Building *</Label>
                <Select
                  value={formData.building_id}
                  onValueChange={(value) => {
                    setFormData({ ...formData, building_id: value, floor_id: '' })
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
                <Label htmlFor="edit-floor">Floor *</Label>
                <Select
                  value={formData.floor_id}
                  onValueChange={(value) => {
                    setFormData({ ...formData, floor_id: value })
                    if (formErrors.floor_id) {
                      setFormErrors({ ...formErrors, floor_id: '' })
                    }
                  }}
                  disabled={!formData.building_id}
                >
                  <SelectTrigger className={formErrors.floor_id ? "border-red-500" : ""}>
                    <SelectValue placeholder="Select a floor" />
                  </SelectTrigger>
                  <SelectContent>
                    {getFloorsForBuilding(formData.building_id).map((floor) => (
                      <SelectItem key={floor.id} value={floor.id}>
                        Floor {floor.floor_number} {floor.name ? `(${floor.name})` : ''}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
                {formErrors.floor_id && (
                  <p className="text-sm text-red-500">{formErrors.floor_id}</p>
                )}
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="grid gap-2">
                <Label htmlFor="edit-name">Resource Name *</Label>
                <Input
                  id="edit-name"
                  value={formData.name}
                  onChange={(e) => {
                    setFormData({ ...formData, name: e.target.value })
                    if (formErrors.name) {
                      setFormErrors({ ...formErrors, name: '' })
                    }
                  }}
                  placeholder="Enter resource name"
                  className={formErrors.name ? "border-red-500" : ""}
                />
                {formErrors.name && (
                  <p className="text-sm text-red-500">{formErrors.name}</p>
                )}
              </div>
              <div className="grid gap-2">
                <Label htmlFor="edit-type">Resource Type *</Label>
                <Select
                  value={formData.type}
                  onValueChange={(value) => {
                    setFormData({ ...formData, type: value })
                    if (formErrors.type) {
                      setFormErrors({ ...formErrors, type: '' })
                    }
                  }}
                >
                  <SelectTrigger className={formErrors.type ? "border-red-500" : ""}>
                    <SelectValue placeholder="Select resource type" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="classroom">Classroom</SelectItem>
                    <SelectItem value="lab">Lab</SelectItem>
                    <SelectItem value="hall">Hall</SelectItem>
                    <SelectItem value="auditorium">Auditorium</SelectItem>
                    <SelectItem value="others">Others</SelectItem>
                  </SelectContent>
                </Select>
                {formErrors.type && (
                  <p className="text-sm text-red-500">{formErrors.type}</p>
                )}
              </div>
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-capacity">Capacity</Label>
              <Input
                id="edit-capacity"
                type="number"
                value={formData.capacity}
                onChange={(e) => {
                  setFormData({ ...formData, capacity: e.target.value })
                  if (formErrors.capacity) {
                    setFormErrors({ ...formErrors, capacity: '' })
                  }
                }}
                placeholder="Enter capacity (optional)"
                className={formErrors.capacity ? "border-red-500" : ""}
              />
              {formErrors.capacity && (
                <p className="text-sm text-red-500">{formErrors.capacity}</p>
              )}
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-description">Description</Label>
              <Textarea
                id="edit-description"
                value={formData.description}
                onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                placeholder="Enter resource description (optional)"
                rows={3}
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="edit-equipment">Equipment</Label>
              <Textarea
                id="edit-equipment"
                value={formData.equipment}
                onChange={(e) => setFormData({ ...formData, equipment: e.target.value })}
                placeholder="Enter available equipment (optional)"
                rows={2}
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
            <Button onClick={handleEditResource} disabled={isUpdatingResource}>
              {isUpdatingResource ? (
                <>
                  <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                  Updating...
                </>
              ) : (
                'Update Resource'
              )}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </SidebarProvider>
  )
} 