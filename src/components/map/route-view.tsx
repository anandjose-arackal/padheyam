"use client";

import { AdvancedMarker, Map, Polyline } from "@vis.gl/react-google-maps";
import { ChevronLeft, ExternalLink } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { formatDistance, formatDuration, haversineKm } from "@/lib/geo";
import { directionsUrl } from "@/lib/directions";
import { useRoute } from "@/hooks/use-route";
import type { Coords } from "@/lib/location-context";

const API_KEY = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
const MAP_ID = process.env.NEXT_PUBLIC_GOOGLE_MAPS_MAP_ID ?? "DEMO_MAP_ID";

type RouteViewProps = {
  origin: Coords;
  destination: Coords;
  destinationName: string;
  onClose: () => void;
};

export function RouteView({ origin, destination, destinationName, onClose }: RouteViewProps) {
  const { data: route } = useRoute(origin, destination);
  const straightLineKm = haversineKm(origin, destination);

  const center = {
    lat: (origin.latitude + destination.latitude) / 2,
    lng: (origin.longitude + destination.longitude) / 2,
  };

  return (
    <div className="fixed inset-0 z-[70] flex flex-col bg-screen">
      {/* top bar */}
      <div className="z-10 flex items-center gap-3 bg-white px-[18px] pb-3 pt-[54px] shadow-[0_6px_16px_-10px_rgba(30,40,70,0.25)]">
        <button
          onClick={onClose}
          className="flex size-11 shrink-0 items-center justify-center rounded-[15px] bg-surface-alt"
        >
          <ChevronLeft className="size-[22px] text-ink-3" strokeWidth={2.2} />
        </button>
        <div className="min-w-0 flex-1">
          <div className="truncate font-display text-base font-semibold text-ink">
            {destinationName}
          </div>
          <div className="text-[12.5px] text-body-3">
            {route
              ? `${formatDistance(route.distanceMeters / 1000)} · ${formatDuration(route.durationSeconds)}`
              : `${formatDistance(straightLineKm)} away`}
          </div>
        </div>
      </div>

      {/* map */}
      <div className="relative flex-1">
        {API_KEY ? (
          <Map
            mapId={MAP_ID}
            defaultZoom={12}
            defaultCenter={center}
            gestureHandling="greedy"
            disableDefaultUI
            className="h-full w-full"
          >
            {route && (
              <Polyline
                encodedPath={route.polyline}
                strokeColor="#3b82f6"
                strokeWeight={5}
              />
            )}

            <AdvancedMarker position={{ lat: origin.latitude, lng: origin.longitude }} zIndex={5}>
              <div className="relative">
                <div className="absolute left-1/2 top-1/2 -ml-[11px] -mt-[11px] size-[22px] animate-[ringPulse_2.4s_ease-out_infinite] rounded-full bg-[#3b82f6]" />
                <div className="relative size-[22px] rounded-full border-[3px] border-white bg-[#3b82f6] shadow-[0_4px_12px_rgba(59,130,246,0.6)]" />
              </div>
            </AdvancedMarker>

            <AdvancedMarker
              position={{ lat: destination.latitude, lng: destination.longitude }}
              zIndex={10}
            >
              <div className="-translate-y-1/2 flex size-9 items-center justify-center rounded-full bg-ink-2 shadow-[0_6px_16px_-6px_rgba(30,40,70,0.6)]">
                <ChurchIcon className="size-[18px] text-white" strokeWidth={1.8} />
              </div>
            </AdvancedMarker>
          </Map>
        ) : (
          <div className="flex h-full items-center justify-center bg-[#e9edf2] p-8 text-center text-sm text-body-3">
            Map preview isn&apos;t available (no Google Maps key configured). Distance shown
            is a straight line.
          </div>
        )}
      </div>

      {/* bottom action */}
      <div className="border-t border-[#f0f2f7] bg-white px-[18px] pb-8 pt-3.5">
        <a
          href={directionsUrl(destination.latitude, destination.longitude)}
          target="_blank"
          rel="noopener noreferrer"
          className="flex h-[54px] w-full items-center justify-center gap-2 rounded-[18px] bg-ink-2 text-sm font-bold text-white"
        >
          <ExternalLink className="size-[17px]" strokeWidth={2} />
          Open in Google Maps
        </a>
      </div>
    </div>
  );
}
