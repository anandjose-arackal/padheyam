"use client";

import { MapPin } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { useLocation } from "@/lib/location-context";

export function LocationGate() {
  const { showGate, requestLocation, dismissGate, requesting } = useLocation();

  if (!showGate) return null;

  return (
    <div className="absolute inset-0 z-[90] flex animate-[fadeIn_0.4s_ease] flex-col justify-end bg-[linear-gradient(180deg,#1b2440_0%,#222d4e_40%,#2a345a_100%)]">
      <div className="pointer-events-none absolute inset-0 opacity-50 [background:radial-gradient(60%_40%_at_80%_12%,rgba(212,175,110,0.35),transparent_70%),radial-gradient(50%_35%_at_10%_30%,rgba(120,150,220,0.3),transparent_70%)]" />

      <div className="relative flex flex-1 flex-col items-center justify-center px-9 text-center">
        <div className="mb-7 flex size-24 items-center justify-center rounded-[30px] bg-[linear-gradient(160deg,#f3ddae,#cda35f)] shadow-[0_22px_50px_-14px_rgba(205,163,95,0.6)]">
          <ChurchIcon className="size-12 text-navy-1" strokeWidth={1.7} />
        </div>
        <h1 className="font-display text-[34px] font-semibold leading-tight tracking-[-0.5px] text-white">
          Mass Tracker
        </h1>
        <p className="mt-3.5 max-w-[300px] text-[15px] leading-relaxed text-white/60">
          Allow location access to discover Holy Masses happening near you, right
          now.
        </p>
      </div>

      <div className="relative flex flex-col gap-3 px-6 pb-12">
        <button
          onClick={requestLocation}
          disabled={requesting}
          className="flex h-[58px] w-full items-center justify-center gap-2.5 rounded-[20px] bg-[linear-gradient(160deg,#f3ddae,#cda35f)] text-base font-bold text-[#231d10] shadow-[0_16px_36px_-12px_rgba(205,163,95,0.7)] disabled:opacity-70"
        >
          <MapPin className="size-5" strokeWidth={2} />
          {requesting ? "Locating…" : "Allow Location"}
        </button>
        <button
          onClick={dismissGate}
          className="h-[54px] w-full rounded-[20px] bg-white/[0.08] text-[15px] font-semibold text-white/80"
        >
          Not Now
        </button>
      </div>
    </div>
  );
}
