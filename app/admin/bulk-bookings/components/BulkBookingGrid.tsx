'use client'

import React, { useState, useEffect, useCallback } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Plus, Save } from 'lucide-react'
import { toast } from 'sonner'
import { BookingRow } from './BookingRow'
import { BulkBookingRow, createBulkBookings, validateBulkBookings, ConflictCheck } from '../actions'

export function BulkBookingGrid() {
  const [rows, setRows] = useState<BulkBookingRow[]>([])
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [conflicts, setConflicts] = useState<ConflictCheck[]>([])

  // Initialize with one empty row
  useEffect(() => {
    addRow()
  }, [])

  const addRow = () => {
    const newRow: BulkBookingRow = {
      tempId: `row-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
      building_id: '',
      floor_id: '',
      resource_id: '',
      start_date: '',
      end_date: '',
      start_time: '09:00',
      end_time: '10:00',
      weekdays: [2, 3, 4, 5, 6], // Mon-Fri by default
      reason: '',
      faculty_name: '',
      subject: '',
      class_name: ''
    }
    setRows(prev => [...prev, newRow])
  }

  const removeRow = (tempId: string) => {
    setRows(prev => prev.filter(row => row.tempId !== tempId))
  }

  const copyRow = (tempId: string) => {
    const rowToCopy = rows.find(row => row.tempId === tempId)
    if (rowToCopy) {
      const newRow: BulkBookingRow = {
        ...rowToCopy,
        tempId: `row-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`
      }
      setRows(prev => [...prev, newRow])
    }
  }

  const updateRow = useCallback((tempId: string, updates: Partial<BulkBookingRow>) => {
    setRows(prev => prev.map(row => 
      row.tempId === tempId ? { ...row, ...updates } : row
    ))
  }, [])

  const validateRows = async () => {
    // Filter out incomplete rows
    const completeRows = rows.filter(row => 
      row.resource_id && 
      row.start_date && 
      row.end_date && 
      row.start_time && 
      row.end_time &&
      row.reason &&
      row.subject &&
      row.class_name
    )

    if (completeRows.length === 0) {
      toast.error('Please complete at least one booking row')
      return false
    }

    try {
      const { conflicts: validationResults } = await validateBulkBookings(completeRows)
      setConflicts(validationResults)
      
      const hasBlockingConflicts = validationResults.some(c => 
        c.conflicts.some(conf => conf.type !== 'overlap_pending')
      )
      
      if (hasBlockingConflicts) {
        toast.error('Please resolve conflicts before submitting')
        return false
      }
      
      return completeRows
    } catch (error) {
      console.error('Validation error:', error)
      toast.error('Failed to validate bookings')
      return false
    }
  }

  const handleSubmit = async () => {
    const validRows = await validateRows()
    if (!validRows) return

    setIsSubmitting(true)
    try {
      const result = await createBulkBookings(validRows)
      
      if (result.error) {
        toast.error(result.error)
      } else {
        toast.success(result.message || 'Bookings created successfully!')
        // Clear the form or redirect
        setRows([])
        addRow() // Add one empty row
        setConflicts([])
      }
    } catch (error) {
      console.error('Submit error:', error)
      toast.error('Failed to create bookings')
    } finally {
      setIsSubmitting(false)
    }
  }

  const getRowConflicts = (tempId: string) => {
    return conflicts.find(c => c.tempId === tempId)?.conflicts || []
  }

  return (
    <div className="space-y-4">
      {/* Header Actions */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div className="flex items-center gap-2">
          <Button onClick={addRow} variant="outline" size="sm">
            <Plus className="h-4 w-4 mr-2" />
            Add Row
          </Button>
          <span className="text-sm text-muted-foreground">
            {rows.length} booking{rows.length !== 1 ? 's' : ''}
          </span>
        </div>
        <div className="flex items-center gap-2">
          <Button onClick={validateRows} variant="outline" size="sm" className="flex-1 sm:flex-none">
            Validate
          </Button>
          <Button 
            onClick={handleSubmit} 
            disabled={isSubmitting || rows.length === 0}
            size="sm"
            className="flex-1 sm:flex-none"
          >
            <Save className="h-4 w-4 mr-2" />
            {isSubmitting ? 'Creating...' : 'Create All Bookings'}
          </Button>
        </div>
      </div>

      {/* Grid Header - Desktop Only */}
      <Card className="hidden md:block">
        <CardContent className="p-4">
          <div className="grid grid-cols-12 gap-2 text-sm font-medium text-muted-foreground mb-4">
            <div className="col-span-1">#</div>
            <div className="col-span-2">Building → Floor → Resource</div>
            <div className="col-span-2">Dates</div>
            <div className="col-span-2">Times</div>
            <div className="col-span-2">Course Info</div>
            <div className="col-span-2">Details</div>
            <div className="col-span-1">Actions</div>
          </div>

          {/* Booking Rows */}
          <div className="space-y-3">
            {rows.map((row, index) => (
              <BookingRow
                key={row.tempId}
                row={row}
                index={index}
                conflicts={getRowConflicts(row.tempId)}
                onUpdate={(updates: Partial<BulkBookingRow>) => updateRow(row.tempId, updates)}
                onRemove={() => removeRow(row.tempId)}
                onCopy={() => copyRow(row.tempId)}
              />
            ))}
          </div>

          {rows.length === 0 && (
            <div className="text-center py-8 text-muted-foreground">
              <p>No booking rows. Click &quot;Add Row&quot; to start.</p>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Mobile Layout */}
      <div className="md:hidden space-y-4">
        {rows.map((row, index) => (
          <BookingRow
            key={row.tempId}
            row={row}
            index={index}
            conflicts={getRowConflicts(row.tempId)}
            onUpdate={(updates: Partial<BulkBookingRow>) => updateRow(row.tempId, updates)}
            onRemove={() => removeRow(row.tempId)}
            onCopy={() => copyRow(row.tempId)}
          />
        ))}

        {rows.length === 0 && (
          <Card>
            <CardContent className="p-8">
              <div className="text-center text-muted-foreground">
                <p>No booking rows. Click &quot;Add Row&quot; to start.</p>
              </div>
            </CardContent>
          </Card>
        )}
      </div>

      {/* Conflicts Summary */}
      {conflicts.length > 0 && (
        <Card>
          <CardContent className="p-4">
            <h3 className="font-medium mb-2 text-sm md:text-base">Validation Results</h3>
            <div className="space-y-2">
              {conflicts.map(conflict => (
                <div key={conflict.tempId} className="text-sm">
                  <span className="font-medium">Row {rows.findIndex(r => r.tempId === conflict.tempId) + 1}:</span>
                  {conflict.conflicts.length === 0 ? (
                    <span className="text-green-600 ml-2">✓ No conflicts</span>
                  ) : (
                    <div className="ml-2 space-y-1 mt-1">
                      {conflict.conflicts.map((conf, idx: number) => (
                        <div key={idx} className={`text-xs md:text-sm ${conf.type === 'overlap_approved' ? 'text-red-600' : 'text-yellow-600'}`}>
                          ⚠ {conf.message}
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
}