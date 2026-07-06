"use client";

import { useQuery } from "@tanstack/react-query";
import type { Coords } from "@/lib/location-context";

async function fetchJson<T>(url: string): Promise<T> {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Request failed: ${res.status}`);
  return res.json() as Promise<T>;
}

/** Rounded to ~100m — avoids refetching on tiny GPS jitter. */
const round = (n: number) => Math.round(n * 1000) / 1000;

export function useReverseGeocode(coords: Coords, enabled = true) {
  const lat = round(coords.latitude);
  const lng = round(coords.longitude);
  return useQuery({
    queryKey: ["reverse-geocode", lat, lng],
    queryFn: () =>
      fetchJson<{ label: string }>(`/api/geocode?lat=${lat}&lng=${lng}`).then(
        (d) => d.label,
      ),
    staleTime: Infinity,
    enabled,
  });
}
