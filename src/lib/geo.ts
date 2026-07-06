import type { Coords } from "@/lib/location-context";

const EARTH_RADIUS_KM = 6371;
const toRad = (deg: number) => (deg * Math.PI) / 180;

/** Great-circle distance between two points, in kilometers. */
export function haversineKm(a: Coords, b: Coords): number {
  const dLat = toRad(b.latitude - a.latitude);
  const dLng = toRad(b.longitude - a.longitude);
  const lat1 = toRad(a.latitude);
  const lat2 = toRad(b.latitude);

  const h =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(lat1) * Math.cos(lat2) * Math.sin(dLng / 2) ** 2;
  return 2 * EARTH_RADIUS_KM * Math.asin(Math.sqrt(h));
}

/** Format a distance for display, e.g. "2.4 km" / "850 m". */
export function formatDistance(km: number): string {
  if (km < 1) return `${Math.round(km * 1000)} m`;
  return `${km.toFixed(1)} km`;
}

/** Format a duration for display, e.g. "18 min" / "1 hr 5 min". */
export function formatDuration(seconds: number): string {
  const totalMin = Math.round(seconds / 60);
  const hr = Math.floor(totalMin / 60);
  const min = totalMin % 60;
  if (hr === 0) return `${min} min`;
  return min === 0 ? `${hr} hr` : `${hr} hr ${min} min`;
}

/**
 * Attach distance to each item and return those within `radiusKm`, sorted
 * nearest-first.
 */
export function withinRadius<T extends Coords>(
  origin: Coords,
  items: T[],
  radiusKm = 50,
): Array<T & { distanceKm: number }> {
  return items
    .map((item) => ({ ...item, distanceKm: haversineKm(origin, item) }))
    .filter((item) => item.distanceKm <= radiusKm)
    .sort((a, b) => a.distanceKm - b.distanceKm);
}
