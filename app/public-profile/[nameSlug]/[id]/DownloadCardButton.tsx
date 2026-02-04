'use client'

import { Button } from '@/components/ui/button'
import { Download } from 'lucide-react'
import { toast } from 'sonner'
import QRCode from 'qrcode'

interface DownloadCardButtonProps {
  profileName: string
  shareLink: string
}

export function DownloadCardButton({ profileName, shareLink }: DownloadCardButtonProps) {
  const handleDownload = async () => {
    try {
      // Generate QR code
      const qrDataUrl = await QRCode.toDataURL(shareLink, {
        errorCorrectionLevel: 'H',
        margin: 2,
        width: 512,
        color: {
          dark: '#000000',
          light: '#ffffff'
        }
      })

      // Create download link
      const link = document.createElement('a')
      link.href = qrDataUrl
      link.download = `${profileName} visiting card.png`
      link.click()
      
      toast.success('Visiting card downloaded successfully!')
    } catch (error) {
      console.error('Error generating QR code:', error)
      toast.error('Failed to download visiting card')
    }
  }

  return (
    <Button variant="outline" className="flex items-center gap-2" onClick={handleDownload}>
      <Download className="size-4" />
      Download Visiting Card
    </Button>
  )
}
