"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { ChevronRight, LocateFixed, MapPin, Navigation } from "lucide-react";
import { MapView } from "@/components/map/map-view";
import { RouteView } from "@/components/map/route-view";
import { ChurchIcon } from "@/components/church-icon";
import { useActiveCoords, useActiveLocationLabel } from "@/lib/location-context";
import { useNearbyChurches } from "@/hooks/use-churches";
import { useNow } from "@/hooks/use-now";
import {
  formatCountdown,
  formatTimeLabel,
  getUpcomingMass,
} from "@/lib/masses";
import { formatDistance } from "@/lib/geo";
import { FILTERS, matchesFilter, type FilterKey } from "@/lib/filters";
import { RITE_LABEL } from "@/lib/status";
import { RadiusEmptyState } from "@/components/radius-empty-state";
import { ChurchBadges } from "@/components/church-badges";

export default function HomePage() {
  const router = useRouter();
  const coords = useActiveCoords();
  const { label: locationLabel } = useActiveLocationLabel();
  const now = useNow();
  const { data: churches = [] } = useNearbyChurches(coords);
  const [filter, setFilter] = useState<FilterKey | null>(null);
  const [radiusKm, setRadiusKm] = useState(10);
  const [recenterNonce, setRecenterNonce] = useState(0);
  const [cardIndex, setCardIndex] = useState(0);
  const [routeTarget, setRouteTarget] = useState<{
    lat: number;
    lng: number;
    name: string;
  } | null>(null);
  const trackRef = useRef<HTMLDivElement>(null);

  const enriched = useMemo(
    () =>
      churches.map((c) => ({
        church: c,
        ...getUpcomingMass(c.masses, now),
      })),
    [churches, now],
  );

  const visible = useMemo(
    () =>
      (filter
        ? enriched.filter((e) => matchesFilter(e.church.masses, now, filter))
        : enriched
      ).filter(
        (e) => e.church.distanceKm == null || e.church.distanceKm <= radiusKm,
      ),
    [enriched, filter, now, radiusKm],
  );

  const mapChurches = visible.map((e) => ({
    id: e.church.id,
    latitude: e.church.latitude,
    longitude: e.church.longitude,
    status: e.status,
  }));

  // Churches with an upcoming Mass, closest church first.
  const upcoming = useMemo(
    () =>
      [...visible]
        .filter((e) => e.nextMass)
        .sort(
          (a, b) =>
            (a.church.distanceKm ?? Infinity) - (b.church.distanceKm ?? Infinity),
        ),
    [visible],
  );

  // Clamp the carousel position if the list shrinks (e.g. a filter chip change).
  useEffect(() => {
    setCardIndex((i) => Math.min(i, Math.max(upcoming.length - 1, 0)));
  }, [upcoming.length]);

  // Already sorted by distance ascending, so the first card is the closest.
  const closestChurchId = upcoming[0]?.church.id ?? null;

  const soonestChurchId = useMemo(() => {
    if (!upcoming.length) return null;
    return upcoming.reduce((a, b) =>
      (a.countdownMinutes ?? Infinity) < (b.countdownMinutes ?? Infinity) ? a : b,
    ).church.id;
  }, [upcoming]);

  return (
    <div className="absolute inset-0">
      <MapView
        center={coords}
        churches={mapChurches}
        activeId={upcoming[cardIndex]?.church.id ?? null}
        onMarkerTap={(id) => router.push(`/church/${id}`)}
        recenterNonce={recenterNonce}
      />

      {/* top location/search card */}
      <div className="absolute inset-x-0 top-0 z-40 bg-[linear-gradient(180deg,rgba(255,255,255,0.95)_35%,rgba(255,255,255,0))] px-[18px] pb-4 pt-[54px]">
        <button
          onClick={() => router.push("/location")}
          className="glass flex h-[72px] w-full items-center gap-3.5 rounded-[24px] px-[18px] shadow-[0_16px_40px_-16px_rgba(22,58,107,0.28)] transition-transform active:scale-[0.98]"
        >
          <span className="flex size-[42px] shrink-0 items-center justify-center rounded-2xl bg-[linear-gradient(160deg,#69b7ff,#2f80ed)] shadow-[0_6px_16px_-4px_rgba(47,128,237,0.5)]">
            <MapPin className="size-[22px] text-white" strokeWidth={2.2} />
          </span>
          <span className="min-w-0 flex-1 text-left">
            <span className="block text-[11px] font-semibold uppercase tracking-[0.6px] text-text-secondary">
              Your location
            </span>
            <span className="block truncate text-[18px] font-semibold leading-tight text-text-primary">
              {locationLabel}
            </span>
          </span>
          <ChevronRight className="size-[22px] shrink-0 text-text-secondary" strokeWidth={2.2} />
        </button>

        {/* filter chips */}
        <div className="no-scrollbar mt-3.5 flex gap-[9px] overflow-x-auto px-0.5 pb-1 pt-0.5">
          {FILTERS.map((f) => {
            const on = filter === f.key;
            return (
              <button
                key={f.key}
                onClick={() => setFilter(on ? null : f.key)}
                className="flex h-[40px] shrink-0 items-center gap-[7px] rounded-full px-4 text-[13px] font-semibold transition-all duration-250 active:scale-[0.98]"
                style={{
                  background: on
                    ? "linear-gradient(135deg,#69b7ff,#2f80ed)"
                    : "rgba(255,255,255,0.82)",
                  color: on ? "#fff" : "#163a6b",
                  backdropFilter: "blur(25px)",
                  border: on ? "1px solid rgba(255,255,255,0.4)" : "1px solid rgba(255,255,255,0.6)",
                  boxShadow: on
                    ? "0 10px 24px -8px rgba(47,128,237,0.55)"
                    : "0 8px 22px -14px rgba(22,58,107,0.2)",
                }}
              >
                <span
                  className="size-2 rounded-full"
                  style={{ background: on ? "#fff" : f.dot }}
                />
                {f.label}
              </button>
            );
          })}
        </div>
      </div>

      {/* recenter FAB */}
      <button
        onClick={() => setRecenterNonce((n) => n + 1)}
        className="glass absolute bottom-[300px] right-[18px] z-40 flex size-14 items-center justify-center rounded-full shadow-[0_12px_30px_-8px_rgba(47,128,237,0.45)] transition-transform active:scale-[0.98]"
      >
        <LocateFixed className="size-[24px] text-primary-blue" strokeWidth={2.2} />
      </button>

      {/* bottom live-mass carousel */}
      {upcoming.length === 0 && (
        <div className="absolute inset-x-0 bottom-24 z-[45] px-4 animate-[floatUp_0.55s_cubic-bezier(0.2,0.9,0.3,1)_both]">
          <RadiusEmptyState radiusKm={radiusKm} onWiden={setRadiusKm} />
        </div>
      )}
      {upcoming.length > 0 && (
        <div className="absolute inset-x-0 bottom-24 z-[45] animate-[floatUp_0.55s_cubic-bezier(0.2,0.9,0.3,1)_both]">
          <div
            ref={trackRef}
            onScroll={(e) => {
              const el = e.currentTarget;
              const idx = Math.round(el.scrollLeft / el.clientWidth);
              setCardIndex(Math.max(0, Math.min(idx, upcoming.length - 1)));
            }}
            className="no-scrollbar flex snap-x snap-mandatory gap-3 overflow-x-auto px-4"
          >
            {upcoming.map((e) => (
              <div
                key={e.church.id}
                className="w-[calc(100%-32px)] shrink-0 snap-center"
              >
                <LiveMassCard
                  churchId={e.church.id}
                  name={e.church.name}
                  address={e.church.address}
                  distanceKm={e.church.distanceKm}
                  rite={e.church.rite}
                  count={visible.length}
                  isClosest={e.church.id === closestChurchId}
                  isSoonest={e.church.id === soonestChurchId}
                  nextTimeLabel={
                    e.nextMass ? formatTimeLabel(e.nextMass.startMin) : "—"
                  }
                  countdown={
                    e.status === "now"
                      ? "In progress"
                      : formatCountdown(e.countdownMinutes)
                  }
                  onDirections={() =>
                    setRouteTarget({
                      lat: e.church.latitude,
                      lng: e.church.longitude,
                      name: e.church.name,
                    })
                  }
                />
              </div>
            ))}
          </div>

          {upcoming.length > 1 && (
            <div className="mt-2.5 flex items-center justify-center gap-[6px]">
              {upcoming.map((e, i) => (
                <span
                  key={e.church.id}
                  className="h-[6px] rounded-full transition-all"
                  style={{
                    width: i === cardIndex ? 16 : 6,
                    background:
                      i === cardIndex ? "#25314f" : "rgba(37,49,79,0.25)",
                  }}
                />
              ))}
            </div>
          )}
        </div>
      )}

      {routeTarget && (
        <RouteView
          origin={coords}
          destination={{ latitude: routeTarget.lat, longitude: routeTarget.lng }}
          destinationName={routeTarget.name}
          onClose={() => setRouteTarget(null)}
        />
      )}
    </div>
  );
}

function LiveMassCard({
  churchId,
  name,
  address,
  distanceKm,
  rite,
  count,
  isClosest,
  isSoonest,
  nextTimeLabel,
  countdown,
  onDirections,
}: {
  churchId: string;
  name: string;
  address: string;
  distanceKm: number | null;
  rite: keyof typeof RITE_LABEL;
  count: number;
  isClosest: boolean;
  isSoonest: boolean;
  nextTimeLabel: string;
  countdown: string;
  onDirections: () => void;
}) {
  const router = useRouter();
  return (
    <div className="glass rounded-[28px] p-[20px_20px_18px] shadow-[0_28px_64px_-20px_rgba(22,58,107,0.35)]">
      <div className="mb-3.5 flex items-center gap-[7px]">
        <span className="size-[7px] rounded-full bg-now shadow-[0_0_0_3px_rgba(43,182,115,0.2)]" />
        <span className="text-[11px] font-bold uppercase tracking-[0.5px] text-now-text">
          Next Mass nearby
        </span>
        <span className="ml-auto text-xs font-semibold text-text-secondary">
          {count} {count === 1 ? "church" : "churches"} near you
        </span>
      </div>

      <ChurchBadges isClosest={isClosest} isSoonest={isSoonest} />

      <div className="mt-2.5 flex items-center gap-3.5">
        <div className="flex size-14 shrink-0 items-center justify-center rounded-2xl bg-[linear-gradient(160deg,#eaf5ff,#cfe4ff)] shadow-[inset_0_0_0_1px_rgba(47,128,237,0.14)]">
          <ChurchIcon className="size-[26px] text-primary-blue" strokeWidth={1.8} />
        </div>
        <div className="min-w-0 flex-1">
          <div className="truncate font-display text-lg font-semibold leading-tight text-text-primary">
            {name}
          </div>
          <div className="mt-1 truncate text-xs font-medium text-text-primary">
            {address}
          </div>
          <div className="mt-[5px] flex items-center gap-2.5 text-[13px] font-semibold text-text-primary">
            <span className="flex items-center gap-1">
              <MapPin className="size-[13px] text-text-primary" strokeWidth={2.2} />
              {distanceKm != null ? formatDistance(distanceKm) : "—"}
            </span>
            <span className="text-muted-3">•</span>
            <span>{RITE_LABEL[rite]}</span>
          </div>
        </div>
      </div>

      <div className="mt-4 grid grid-cols-2 gap-2.5">
        <div className="rounded-2xl bg-accent-blue p-[14px_16px]">
          <div className="text-[11px] font-semibold uppercase tracking-[0.4px] text-primary-blue">
            Next Mass
          </div>
          <div className="mt-[3px] font-display text-[24px] font-semibold leading-none text-text-primary">
            {nextTimeLabel}
          </div>
        </div>
        <div className="rounded-2xl bg-accent-blue p-[14px_16px]">
          <div className="text-[11px] font-semibold uppercase tracking-[0.4px] text-primary-blue">
            Starts in
          </div>
          <div className="mt-[3px] text-lg font-bold text-text-primary">
            {countdown}
          </div>
        </div>
      </div>

      <div className="mt-3.5 flex gap-2.5">
        <button
          onClick={() => router.push(`/church/${churchId}`)}
          className="h-[52px] flex-1 rounded-2xl bg-[linear-gradient(135deg,#69b7ff,#2f80ed)] text-sm font-bold text-white shadow-[0_12px_28px_-10px_rgba(47,128,237,0.6)] transition-transform active:scale-[0.98]"
        >
          View Details
        </button>
        <button
          onClick={onDirections}
          className="glass flex h-[52px] flex-1 items-center justify-center gap-[7px] rounded-2xl border border-primary-blue/30 text-sm font-bold text-primary-blue transition-transform active:scale-[0.98]"
        >
          <Navigation className="size-[17px]" strokeWidth={2} />
          Directions
        </button>
      </div>
    </div>
  );
}
