"use client";

import { useQuery } from "@tanstack/react-query";
import type { Coords } from "@/lib/location-context";

async function fetchJson<T>(url: string): Promise<T> {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Request failed: ${res.status}`);
  return res.json() as Promise<T>;
}

export type RouteInfo = {
  distanceMeters: number;
  durationSeconds: number;
  polyline: string;
};

export function useRoute(origin: Coords, destination: Coords) {
  return useQuery({
    queryKey: [
      "route",
      origin.latitude,
      origin.longitude,
      destination.latitude,
      destination.longitude,
    ],
    queryFn: () =>
      fetchJson<RouteInfo>(
        `/api/directions?originLat=${origin.latitude}&originLng=${origin.longitude}` +
          `&destLat=${destination.latitude}&destLng=${destination.longitude}`,
      ),
  });
}
