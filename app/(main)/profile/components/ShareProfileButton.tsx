'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Share2, Copy, Download, QrCode, Link as LinkIcon } from 'lucide-react'
import { toast } from 'sonner'
import QRCode from 'qrcode'
import { useRef } from 'react'

interface ShareProfileButtonProps {
  universityId: string
  profileName: string
}

function createNameSlug(name: string): string {
  return name
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
}

export function ShareProfileButton({ universityId, profileName }: ShareProfileButtonProps) {
  const [open, setOpen] = useState(false)
  const [qrCode, setQrCode] = useState<string | null>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)

  const nameSlug = createNameSlug(profileName)
  // Include university_id at the end for uniqueness
  const shareLink = `${typeof window !== 'undefined' ? window.location.origin : ''}/public-profile/${nameSlug}/${universityId}`

  const generateQRCode = async () => {
    if (qrCode) return
    try {
      const qr = await QRCode.toDataURL(shareLink, {
        errorCorrectionLevel: 'H',
        margin: 1,
        width: 300,
      })
      setQrCode(qr)
    } catch (err) {
      toast.error('Failed to generate QR code')
    }
  }

  const downloadQRCode = async () => {
    try {
      if (!qrCode) await generateQRCode()
      const link = document.createElement('a')
      link.href = qrCode || ''
      link.download = `${profileName} visiting card.png`
      link.click()
      toast.success('Visiting card downloaded successfully!')
    } catch (err) {
      toast.error('Failed to download visiting card')
    }
  }

  const copyLink = () => {
    navigator.clipboard.writeText(shareLink)
    toast.success('Profile link copied to clipboard!')
  }

  const handleOpenChange = (newOpen: boolean) => {
    setOpen(newOpen)
    if (newOpen && !qrCode) {
      generateQRCode()
    }
  }

  return (
    <>
      <Button
        variant="outline"
        onClick={() => handleOpenChange(true)}
        className="flex items-center gap-2"
      >
        <Share2 className="size-4" />
        Share Profile
      </Button>

      <Dialog open={open} onOpenChange={handleOpenChange}>
        <DialogContent className="max-w-md">
          <DialogHeader>
            <DialogTitle>Share Profile</DialogTitle>
            <DialogDescription>
              Share your profile with others using a QR code or link
            </DialogDescription>
          </DialogHeader>

          <Tabs defaultValue="qr" className="w-full">
            <TabsList className="grid w-full grid-cols-2">
              <TabsTrigger value="qr" className="flex items-center gap-2">
                <QrCode className="size-4" />
                QR Code
              </TabsTrigger>
              <TabsTrigger value="link" className="flex items-center gap-2">
                <LinkIcon className="size-4" />
                Share Link
              </TabsTrigger>
            </TabsList>

            <TabsContent value="qr" className="space-y-4">
              <div className="flex flex-col items-center justify-center p-6 bg-secondary rounded-lg">
                {qrCode ? (
                  <img
                    src={qrCode}
                    alt="Profile QR Code"
                    className="w-48 h-48 rounded"
                  />
                ) : (
                  <div className="w-48 h-48 bg-muted rounded flex items-center justify-center">
                    <span className="text-muted-foreground">Generating...</span>
                  </div>
                )}
              </div>
              <Button
                onClick={downloadQRCode}
                className="w-full"
                variant="default"
              >
                <Download className="size-4 mr-2" />
                Download Visiting Card
              </Button>
            </TabsContent>

            <TabsContent value="link" className="space-y-4">
              <div className="flex items-center gap-2 p-3 bg-secondary rounded-lg">
                <input
                  type="text"
                  readOnly
                  value={shareLink}
                  className="flex-1 bg-transparent outline-none text-sm truncate"
                />
                <Button
                  size="sm"
                  variant="ghost"
                  onClick={copyLink}
                  className="flex-shrink-0"
                >
                  <Copy className="size-4" />
                </Button>
              </div>
              <p className="text-xs text-muted-foreground text-center">
                Anyone with this link can view your public profile
              </p>
            </TabsContent>
          </Tabs>
        </DialogContent>
      </Dialog>
    </>
  )
}
