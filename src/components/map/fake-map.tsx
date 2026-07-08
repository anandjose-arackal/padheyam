"use client";

import { ChurchPin } from "@/components/map/church-pin";
import type { Coords } from "@/lib/location-context";
import type { MassStatus } from "@/lib/status";

export type MapChurch = {
  id: string;
  latitude: number;
  longitude: number;
  status: MassStatus;
};

/** Rough equirectangular projection of a point relative to center. */
function project(center: Coords, p: Coords) {
  const K = 1400; // px per degree at this zoom
  const dx = (p.longitude - center.longitude) * Math.cos((center.latitude * Math.PI) / 180) * K;
  const dy = (p.latitude - center.latitude) * K;
  const clamp = (v: number) => Math.min(92, Math.max(8, v));
  return { left: clamp(50 + dx), top: clamp(50 - dy) };
}

/**
 * Stylized CSS/SVG stand-in for a real map (from the prototype). Used when no
 * Google Maps API key is configured so the app still renders end-to-end.
 */
export function FakeMap({
  center,
  churches,
  activeId,
  onMarkerTap,
}: {
  center: Coords;
  churches: MapChurch[];
  activeId?: string | null;
  onMarkerTap?: (id: string) => void;
}) {
  return (
    <div className="absolute inset-0 overflow-hidden bg-[#e9edf2] [filter:saturate(0.9)]">
      {/* park / water blobs */}
      <div className="absolute left-[-40px] top-[120px] h-[200px] w-[240px] bg-[#d7e8d8] [border-radius:46%_54%_60%_40%/50%_46%_54%_50%]" />
      <div className="absolute bottom-[180px] right-[-70px] h-[230px] w-[300px] bg-[#cfe1ec] [border-radius:54%_46%_40%_60%/46%_60%_40%_54%]" />
      <div className="absolute left-[230px] top-[540px] h-[150px] w-[170px] bg-[#d7e8d8] [border-radius:50%_50%_46%_54%/54%_46%_50%_50%]" />

      {/* roads */}
      <svg className="absolute inset-0 h-full w-full" viewBox="0 0 430 932" fill="none">
        <g stroke="#fff" strokeWidth="13" strokeLinecap="round">
          <path d="M-20 300 L460 240" />
          <path d="M-20 620 L460 700" />
          <path d="M120 -20 L80 960" />
          <path d="M320 -20 L360 960" />
        </g>
        <g stroke="#fff" strokeWidth="7" strokeLinecap="round" opacity=".9">
          <path d="M-20 460 L460 470" />
          <path d="M-20 790 L460 760" />
          <path d="M220 -20 L210 960" />
          <path d="M40 120 L420 90" />
        </g>
      </svg>

      {/* markers */}
      {churches.map((c, i) => {
        const { left, top } = project(center, c);
        return (
          <button
            key={c.id}
            onClick={() => onMarkerTap?.(c.id)}
            className="absolute -translate-x-1/2 -translate-y-full animate-[markerDrop_0.5s_cubic-bezier(0.2,1.2,0.3,1)_both]"
            style={{ left: `${left}%`, top: `${top}%`, animationDelay: `${i * 60}ms` }}
          >
            <ChurchPin status={c.status} active={activeId === c.id} />
          </button>
        );
      })}

      {/* user location dot */}
      <div className="absolute left-1/2 top-1/2 z-30 -translate-x-1/2 -translate-y-1/2">
        <div className="absolute left-1/2 top-1/2 -ml-[11px] -mt-[11px] size-[22px] animate-[ringPulse_2.4s_ease-out_infinite] rounded-full bg-[#3b82f6]" />
        <div className="relative size-[22px] rounded-full border-[3px] border-white bg-[#3b82f6] shadow-[0_4px_12px_rgba(59,130,246,0.6)]" />
      </div>
    </div>
  );
}
