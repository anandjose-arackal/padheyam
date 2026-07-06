"use client";

import { useEffect } from "react";
import { AdvancedMarker, Map, useMap } from "@vis.gl/react-google-maps";
import { ChurchPin } from "@/components/map/church-pin";
import { FakeMap, type MapChurch } from "@/components/map/fake-map";
import type { Coords } from "@/lib/location-context";

const API_KEY = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
const MAP_ID = process.env.NEXT_PUBLIC_GOOGLE_MAPS_MAP_ID ?? "DEMO_MAP_ID";

type MapViewProps = {
  center: Coords;
  churches: MapChurch[];
  activeId?: string | null;
  onMarkerTap?: (id: string) => void;
  /** Bump this to recenter the map back on the user. */
  recenterNonce?: number;
};

function Recenter({ center, nonce }: { center: Coords; nonce?: number }) {
  const map = useMap();
  useEffect(() => {
    if (map) {
      map.panTo({ lat: center.latitude, lng: center.longitude });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [nonce]);
  return null;
}

export function MapView(props: MapViewProps) {
  // Without an API key, gracefully fall back to the stylized map.
  if (!API_KEY) {
    return <FakeMap {...props} />;
  }

  const { center, churches, activeId, onMarkerTap, recenterNonce } = props;

  return (
    <div className="absolute inset-0">
      <Map
        mapId={MAP_ID}
        defaultZoom={13}
        defaultCenter={{ lat: center.latitude, lng: center.longitude }}
        gestureHandling="greedy"
        disableDefaultUI
        clickableIcons={false}
        className="h-full w-full"
      >
        <Recenter center={center} nonce={recenterNonce} />

        {/* user location */}
        <AdvancedMarker
          position={{ lat: center.latitude, lng: center.longitude }}
          zIndex={5}
        >
          <div className="relative">
            <div className="absolute left-1/2 top-1/2 -ml-[11px] -mt-[11px] size-[22px] animate-[ringPulse_2.4s_ease-out_infinite] rounded-full bg-[#3b82f6]" />
            <div className="relative size-[22px] rounded-full border-[3px] border-white bg-[#3b82f6] shadow-[0_4px_12px_rgba(59,130,246,0.6)]" />
          </div>
        </AdvancedMarker>

        {/* churches */}
        {churches.map((c) => (
          <AdvancedMarker
            key={c.id}
            position={{ lat: c.latitude, lng: c.longitude }}
            onClick={() => onMarkerTap?.(c.id)}
            zIndex={c.status === "now" ? 20 : 10}
          >
            <div className="-translate-y-1/2">
              <ChurchPin status={c.status} active={activeId === c.id} />
            </div>
          </AdvancedMarker>
        ))}
      </Map>
    </div>
  );
}
