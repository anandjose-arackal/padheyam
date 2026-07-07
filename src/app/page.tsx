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
      <div className="absolute inset-x-0 top-0 z-40 bg-[linear-gradient(180deg,rgba(255,255,255,0.92)_30%,rgba(255,255,255,0))] px-[18px] pb-3.5 pt-[54px]">
        <button
          onClick={() => router.push("/location")}
          className="glass flex h-[58px] w-full items-center gap-3 rounded-[22px] px-4 shadow-[0_12px_32px_-12px_rgba(30,40,70,0.28)]"
        >
          <span className="flex size-[34px] shrink-0 items-center justify-center rounded-xl bg-[linear-gradient(160deg,#f3ddae,#cda35f)]">
            <MapPin className="size-[17px] text-navy-1" strokeWidth={2.2} />
          </span>
          <span className="min-w-0 flex-1 text-left">
            <span className="block text-[10px] font-semibold uppercase tracking-[0.6px] text-muted-1">
              Your location
            </span>
            <span className="block truncate text-[15px] font-bold text-ink">
              {locationLabel}
            </span>
          </span>
          <ChevronRight className="size-5 text-muted-1" strokeWidth={2.2} />
        </button>

        {/* filter chips */}
        <div className="no-scrollbar mt-3 flex gap-[9px] overflow-x-auto px-0.5 pb-1 pt-0.5">
          {FILTERS.map((f) => {
            const on = filter === f.key;
            return (
              <button
                key={f.key}
                onClick={() => setFilter(on ? null : f.key)}
                className="flex h-[38px] shrink-0 items-center gap-[7px] rounded-[14px] px-4 text-[13px] font-semibold transition-all"
                style={{
                  background: on ? "#222b45" : "rgba(255,255,255,0.86)",
                  color: on ? "#fff" : "#4a5468",
                  boxShadow: on
                    ? "0 10px 24px -10px rgba(34,43,69,0.5)"
                    : "0 8px 22px -14px rgba(30,40,70,0.25)",
                }}
              >
                <span
                  className="size-2 rounded-full"
                  style={{ background: f.dot }}
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
        className="glass absolute bottom-[300px] right-[18px] z-40 flex size-12 items-center justify-center rounded-2xl shadow-[0_10px_26px_-10px_rgba(30,40,70,0.4)]"
      >
        <LocateFixed className="size-[22px] text-[#3b82f6]" strokeWidth={2} />
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
                      i === cardIndex ? "#222b45" : "rgba(34,43,69,0.25)",
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
    <div className="glass rounded-[30px] p-[18px_18px_16px] shadow-[0_24px_60px_-18px_rgba(30,40,70,0.4)]">
      <div className="mb-3 flex items-center gap-[7px]">
        <span className="size-[7px] rounded-full bg-now shadow-[0_0_0_3px_rgba(34,197,94,0.18)]" />
        <span className="text-[11px] font-bold uppercase tracking-[0.5px] text-now-text">
          Next Mass nearby
        </span>
        <span className="ml-auto text-xs font-semibold text-muted-1">
          {count} {count === 1 ? "church" : "churches"} near you
        </span>
      </div>

      <ChurchBadges isClosest={isClosest} isSoonest={isSoonest} />

      <div className="mt-2 flex items-center gap-3.5">
        <div className="flex size-14 shrink-0 items-center justify-center rounded-[18px] bg-[linear-gradient(160deg,#e7eefb,#cfe0fb)] shadow-[inset_0_0_0_1px_rgba(59,130,246,0.12)]">
          <ChurchIcon className="size-[26px] text-today-text" strokeWidth={1.8} />
        </div>
        <div className="min-w-0 flex-1">
          <div className="truncate font-display text-lg font-semibold leading-tight text-ink">
            {name}
          </div>
          <div className="mt-1 truncate text-xs font-medium text-muted-1">
            {address}
          </div>
          <div className="mt-[5px] flex items-center gap-2.5 text-[13px] font-medium text-body-3">
            <span className="flex items-center gap-1">
              <MapPin className="size-[13px] text-muted-1" strokeWidth={2.2} />
              {distanceKm != null ? formatDistance(distanceKm) : "—"}
            </span>
            <span className="text-muted-3">•</span>
            <span>{RITE_LABEL[rite]}</span>
          </div>
        </div>
      </div>

      <div className="mt-[15px] flex items-center gap-3 rounded-[18px] border border-[rgba(34,197,94,0.16)] bg-[linear-gradient(120deg,#ecfbf1,#e1f7e9)] p-[13px_16px]">
        <div>
          <div className="text-[11px] font-semibold uppercase tracking-[0.4px] text-now-text">
            Next Mass
          </div>
          <div className="mt-[3px] font-display text-[23px] font-semibold leading-none text-now-text-deep">
            {nextTimeLabel}
          </div>
        </div>
        <div className="ml-auto text-right">
          <div className="text-[11px] font-semibold uppercase tracking-[0.4px] text-now-text">
            Starts in
          </div>
          <div className="mt-[3px] text-lg font-bold text-now-text-deep">
            {countdown}
          </div>
        </div>
      </div>

      <div className="mt-3.5 flex gap-2.5">
        <button
          onClick={() => router.push(`/church/${churchId}`)}
          className="h-[50px] flex-1 rounded-[17px] bg-ink-2 text-sm font-bold text-white"
        >
          View Details
        </button>
        <button
          onClick={onDirections}
          className="flex h-[50px] flex-1 items-center justify-center gap-[7px] rounded-[17px] bg-surface-alt text-sm font-bold text-ink-3"
        >
          <Navigation className="size-[17px]" strokeWidth={2} />
          Directions
        </button>
      </div>
    </div>
  );
}
