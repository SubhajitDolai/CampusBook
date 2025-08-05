'use client'

import * as React from 'react'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Clock } from 'lucide-react'
import { cn } from '@/lib/utils'

interface TimePickerProps {
  value: string
  onChange: (value: string) => void
  label?: string
  placeholder?: string
  disabled?: boolean
  className?: string
  minTime?: string
  maxTime?: string
}

export function TimePicker({
  value,
  onChange,
  label,
  placeholder = "Select time",
  disabled = false,
  className,
  minTime = "05:00",
  maxTime = "22:00"
}: TimePickerProps) {
  const [inputValue, setInputValue] = React.useState(value)

  React.useEffect(() => {
    setInputValue(value)
  }, [value])

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = e.target.value
    setInputValue(newValue)
    
    // Validate time format (HH:MM)
    const timeRegex = /^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/
    if (timeRegex.test(newValue)) {
      onChange(newValue)
    }
  }

  const handleBlur = () => {
    // Format the time if it's partially entered
    if (inputValue && inputValue.length > 0) {
      const [hours, minutes] = inputValue.split(':')
      if (hours && minutes) {
        const formattedHours = hours.padStart(2, '0')
        const formattedMinutes = minutes.padStart(2, '0')
        const formattedTime = `${formattedHours}:${formattedMinutes}`
        
        // Validate time range
        if (formattedTime >= minTime && formattedTime <= maxTime) {
          setInputValue(formattedTime)
          onChange(formattedTime)
        } else {
          setInputValue(value) // Reset to previous valid value
        }
      } else {
        setInputValue(value) // Reset to previous valid value
      }
    }
  }

  const formatTimeForDisplay = (time: string) => {
    if (!time) return ''
    const [hours, minutes] = time.split(':')
    const hour = parseInt(hours)
    const ampm = hour >= 12 ? 'PM' : 'AM'
    const displayHour = hour > 12 ? hour - 12 : hour === 0 ? 12 : hour
    return `${displayHour}:${minutes} ${ampm}`
  }

  return (
    <div className={cn("space-y-2", className)}>
      {label && <Label htmlFor="time-input">{label}</Label>}
      <div className="relative">
        <Input
          id="time-input"
          type="time"
          value={inputValue}
          onChange={handleInputChange}
          onBlur={handleBlur}
          placeholder={placeholder}
          disabled={disabled}
          min={minTime}
          max={maxTime}
          className="pr-10"
        />
        <Clock className="absolute right-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground pointer-events-none" />
      </div>
      {inputValue && (
        <p className="text-sm text-muted-foreground">
          {formatTimeForDisplay(inputValue)}
        </p>
      )}
    </div>
  )
} 