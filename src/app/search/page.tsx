"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { ChevronLeft, Search } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { useActiveCoords } from "@/lib/location-context";
import { useNearbyChurches } from "@/hooks/use-churches";
import { useNow } from "@/hooks/use-now";
import { formatTimeLabel, getUpcomingMass, type MassOccurrence } from "@/lib/masses";
import { formatDistance } from "@/lib/geo";
import { RITE_LABEL, statusStyle, statusTileGradient } from "@/lib/status";
import type { MassStatus } from "@/lib/status";
import type { ChurchDTO } from "@/lib/types";
import { RadiusEmptyState } from "@/components/radius-empty-state";
import { ChurchBadges } from "@/components/church-badges";

export default function SearchPage() {
  const router = useRouter();
  const coords = useActiveCoords();
  const now = useNow();
  const { data: churches = [], isLoading } = useNearbyChurches(coords);
  const [query, setQuery] = useState("");
  const [radiusKm, setRadiusKm] = useState(10);

  const results = useMemo(() => {
    const q = query.trim().toLowerCase();
    const list = q
      ? churches.filter((c) =>
          [c.name, c.diocese, c.address, RITE_LABEL[c.rite]]
            .join(" ")
            .toLowerCase()
            .includes(q),
        )
      : churches;
    return list
      .map((c) => {
        const { status, countdownMinutes, nextMass } = getUpcomingMass(c.masses, now);
        return { church: c, status, countdownMinutes, nextMass };
      })
      .sort((a, b) => {
        const aMin = a.countdownMinutes ?? Infinity;
        const bMin = b.countdownMinutes ?? Infinity;
        if (aMin !== bMin) return aMin - bMin;
        return (a.church.distanceKm ?? Infinity) - (b.church.distanceKm ?? Infinity);
      });
  }, [churches, query, now]);

  const visibleResults = useMemo(
    () =>
      results.filter(
        (r) => r.church.distanceKm == null || r.church.distanceKm <= radiusKm,
      ),
    [results, radiusKm],
  );

  const closestId = useMemo(() => {
    const withDistance = visibleResults.filter((r) => r.church.distanceKm != null);
    if (!withDistance.length) return null;
    return withDistance.reduce((a, b) =>
      a.church.distanceKm! < b.church.distanceKm! ? a : b,
    ).church.id;
  }, [visibleResults]);

  const soonestId = useMemo(() => {
    const withMass = visibleResults.filter((r) => r.countdownMinutes != null);
    if (!withMass.length) return null;
    return withMass.reduce((a, b) =>
      a.countdownMinutes! < b.countdownMinutes! ? a : b,
    ).church.id;
  }, [visibleResults]);

  return (
    <div className="absolute inset-0 flex animate-[fadeIn_0.3s_ease] flex-col bg-screen">
      <div className="flex items-center gap-3 px-[18px] pb-3 pt-[54px]">
        <button
          onClick={() => router.push("/")}
          className="flex size-11 shrink-0 items-center justify-center rounded-[15px] bg-white shadow-[0_6px_16px_-10px_rgba(30,40,70,0.4)]"
        >
          <ChevronLeft className="size-[22px] text-ink-3" strokeWidth={2.2} />
        </button>
        <div className="flex h-12 flex-1 items-center gap-2.5 rounded-2xl bg-white px-[15px] shadow-[0_6px_16px_-10px_rgba(30,40,70,0.3)]">
          <Search className="size-[18px] text-muted-1" strokeWidth={2.2} />
          <input
            autoFocus
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search church, parish, diocese…"
            className="w-full bg-transparent text-[15px] text-ink outline-none placeholder:text-muted-1"
          />
        </div>
      </div>

      {/* search radius slider */}
      <div className="px-[18px] pb-2">
        <div className="flex items-center justify-between text-xs font-semibold text-muted-1">
          <span>Search radius</span>
          <span>{radiusKm} km</span>
        </div>
        <input
          key={radiusKm}
          type="range"
          min={0}
          max={50}
          step={5}
          defaultValue={radiusKm}
          onMouseUp={(e) => setRadiusKm(Number(e.currentTarget.value))}
          onTouchEnd={(e) => setRadiusKm(Number(e.currentTarget.value))}
          onKeyUp={(e) => setRadiusKm(Number(e.currentTarget.value))}
          className="mt-1.5 w-full accent-[#25314f]"
        />
      </div>

      <div className="no-scrollbar flex-1 overflow-y-auto px-[18px] pb-28 pt-1.5">
        {isLoading ? (
          <>
            <div className="mx-1 mb-3 mt-2 text-xs font-bold uppercase tracking-[0.5px] text-muted-1">
              {query ? "Results" : "Nearby Churches"}
            </div>
            <ListSkeleton />
          </>
        ) : results.length === 0 ? (
          <p className="mt-10 text-center text-sm text-body-3">
            No churches match “{query}”.
          </p>
        ) : visibleResults.length === 0 ? (
          <RadiusEmptyState radiusKm={radiusKm} onWiden={setRadiusKm} />
        ) : (
          <>
            <div className="mx-1 mb-3 mt-2 text-xs font-bold uppercase tracking-[0.5px] text-muted-1">
              {query ? "Results" : "Nearby Churches"}
            </div>
            <ChurchGroup
              label={null}
              items={visibleResults}
              closestId={closestId}
              soonestId={soonestId}
              onOpen={(id) => router.push(`/church/${id}`)}
            />
          </>
        )}
      </div>
    </div>
  );
}

function ChurchGroup({
  label,
  items,
  closestId,
  soonestId,
  onOpen,
}: {
  label: string | null;
  items: {
    church: ChurchDTO;
    status: MassStatus;
    countdownMinutes: number | null;
    nextMass: MassOccurrence | null;
  }[];
  closestId: string | null;
  soonestId: string | null;
  onOpen: (id: string) => void;
}) {
  if (items.length === 0) return null;

  return (
    <div className="mb-5">
      {label && (
        <div className="mx-1 mb-2.5 mt-1 text-xs font-bold uppercase tracking-[0.5px] text-muted-1">
          {label}
        </div>
      )}
      <div className="flex flex-col gap-[11px]">
        {items.map(({ church: c, status, nextMass }) => {
          const s = statusStyle(status);
          return (
            <button
              key={c.id}
              onClick={() => onOpen(c.id)}
              className="flex flex-col gap-2 rounded-[20px] bg-white p-3.5 text-left shadow-[0_8px_22px_-16px_rgba(30,40,70,0.4)]"
            >
              <div className="font-display text-base font-semibold leading-snug text-ink">
                {c.name}
              </div>
              <ChurchBadges
                isClosest={c.id === closestId}
                isSoonest={c.id === soonestId}
              />
              <div className="flex items-center gap-3">
                <div
                  className="flex size-11 shrink-0 items-center justify-center rounded-xl"
                  style={{ background: statusTileGradient(status) }}
                >
                  <ChurchIcon
                    className="size-5"
                    strokeWidth={1.8}
                    style={{ color: s.marker }}
                  />
                </div>
                <div className="min-w-0 flex-1 truncate text-[12.5px] text-body-3">
                  {c.address.split(",")[0]} · {RITE_LABEL[c.rite]}
                </div>
                <div className="shrink-0 text-right">
                  <div className="text-[13px] font-bold" style={{ color: s.text }}>
                    {s.label}
                    {nextMass ? ` · ${formatTimeLabel(nextMass.startMin)}` : ""}
                  </div>
                  <div className="mt-0.5 text-[11px] font-semibold text-[#8a93a6]">
                    {c.distanceKm != null ? formatDistance(c.distanceKm) : "—"}
                  </div>
                </div>
              </div>
            </button>
          );
        })}
      </div>
    </div>
  );
}

function ListSkeleton() {
  return (
    <div className="flex flex-col gap-[11px]">
      {Array.from({ length: 5 }).map((_, i) => (
        <div
          key={i}
          className="h-[80px] animate-pulse rounded-[20px] bg-white/70"
        />
      ))}
    </div>
  );
}
