'use client'

import { useState } from 'react'
import { Dialog, DialogContent, DialogTitle } from '@/components/ui/dialog'
import { Avatar, AvatarImage, AvatarFallback } from '@/components/ui/avatar'

interface AvatarDialogProps {
  avatarUrl?: string | null
  name: string
}

export function AvatarDialog({ avatarUrl, name }: AvatarDialogProps) {
  const [open, setOpen] = useState(false)

  const initials = name?.split(" ").map(n => n[0]).join("")

  return (
    <>
      <Avatar 
        className="size-24 border-4 border-background shadow-lg cursor-pointer hover:opacity-90 transition-opacity"
        onClick={() => setOpen(true)}
      >
        {avatarUrl && <AvatarImage src={avatarUrl} alt={name} />}
        <AvatarFallback className="text-2xl">
          {initials}
        </AvatarFallback>
      </Avatar>

      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent className="max-w-lg p-0 overflow-hidden">
          <DialogTitle className="sr-only">{name} Profile Picture</DialogTitle>
          <div className="relative aspect-square w-full bg-muted flex items-center justify-center">
            {avatarUrl ? (
              <img 
                src={avatarUrl} 
                alt={name}
                className="w-full h-full object-cover"
              />
            ) : (
              <div className="text-8xl font-bold text-muted-foreground">
                {initials}
              </div>
            )}
          </div>
        </DialogContent>
      </Dialog>
    </>
  )
}
