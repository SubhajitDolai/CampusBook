// Deterministic IST helpers using Intl.formatToParts
// Avoid parsing localized strings with `new Date(localizedString)` which is
// implementation-dependent. Use formatToParts to extract numeric components
// in the Asia/Kolkata timezone and build ISO-like strings or Date objects.

function getISTParts(d = new Date()) {
  const dtf = new Intl.DateTimeFormat('en-GB', {
    timeZone: 'Asia/Kolkata',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false,
  })

  const parts = dtf.formatToParts(d)
  const map: Record<string, string> = {}
  for (const p of parts) {
    if (p.type !== 'literal') map[p.type] = p.value
  }

  return {
    year: Number(map.year),
    month: Number(map.month),
    day: Number(map.day),
    hour: Number(map.hour),
    minute: Number(map.minute),
    second: Number(map.second),
  }
}

export function getISTDateObj(d = new Date()): Date {
  const { year, month, day, hour, minute, second } = getISTParts(d)
  // Build an ISO string with +05:30 offset so Date parses to the exact IST
  // instant represented by the wall-clock time.
  const iso = `${String(year).padStart(4, '0')}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}T${String(hour).padStart(2, '0')}:${String(minute).padStart(2, '0')}:${String(second).padStart(2, '0')}+05:30`
  return new Date(iso)
}

export function getISTDateString(d = new Date()): string {
  const { year, month, day } = getISTParts(d)
  return `${String(year).padStart(4, '0')}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`
}

export function getISTTimeString(d = new Date()): string {
  const { hour, minute } = getISTParts(d)
  return `${String(hour).padStart(2, '0')}:${String(minute).padStart(2, '0')}`
}

// Day of week in project's convention: 1=Sunday, 2=Monday, ..., 7=Saturday
export function getISTDayOfWeek(d = new Date()): number {
  const { year, month, day } = getISTParts(d)
  // Weekday for the calendar date is invariant; compute via UTC date.
  const weekday = new Date(Date.UTC(year, month - 1, day)).getUTCDay() // 0..6
  return weekday + 1
}
