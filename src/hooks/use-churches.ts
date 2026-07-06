"use client";

import { useQuery } from "@tanstack/react-query";
import type { Coords } from "@/lib/location-context";
import type { ChurchDTO } from "@/lib/types";

async function fetchJson<T>(url: string): Promise<T> {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Request failed: ${res.status}`);
  return res.json() as Promise<T>;
}

export function useNearbyChurches(coords: Coords, radiusKm = 50) {
  return useQuery({
    queryKey: ["churches", coords.latitude, coords.longitude, radiusKm],
    queryFn: () =>
      fetchJson<{ churches: ChurchDTO[] }>(
        `/api/churches?lat=${coords.latitude}&lng=${coords.longitude}&radius=${radiusKm}`,
      ).then((d) => d.churches),
  });
}

export function useChurch(id: string, coords: Coords) {
  return useQuery({
    queryKey: ["church", id, coords.latitude, coords.longitude],
    queryFn: () =>
      fetchJson<{ church: ChurchDTO }>(
        `/api/churches/${id}?lat=${coords.latitude}&lng=${coords.longitude}`,
      ).then((d) => d.church),
    enabled: !!id,
  });
}
