"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { ChevronLeft, Search } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { useActiveCoords } from "@/lib/location-context";
import { useNearbyChurches } from "@/hooks/use-churches";
import { useNow } from "@/hooks/use-now";
import { getChurchStatus } from "@/lib/masses";
import { formatDistance } from "@/lib/geo";
import { RITE_LABEL, statusStyle, statusTileGradient } from "@/lib/status";
import type { ChurchDTO } from "@/lib/types";

export default function SearchPage() {
  const router = useRouter();
  const coords = useActiveCoords();
  const now = useNow();
  const { data: churches = [], isLoading } = useNearbyChurches(coords);
  const [query, setQuery] = useState("");

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
    return list.map((c) => ({ church: c, status: getChurchStatus(c.masses, now) }));
  }, [churches, query, now]);

  const anyFar = results.some((r) => r.church.isFar);

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
        ) : (
          <>
            {anyFar && (
              <p className="mx-1 mb-3 mt-2 text-xs text-body-3">
                No churches found close by — showing the nearest ones available,
                farther away than usual.
              </p>
            )}
            {!anyFar && (
              <div className="mx-1 mb-3 mt-2 text-xs font-bold uppercase tracking-[0.5px] text-muted-1">
                {query ? "Results" : "Nearby Churches"}
              </div>
            )}

            <ChurchGroup
              label={anyFar ? "Nearby" : null}
              items={results.filter((r) => !r.church.isFar)}
              onOpen={(id) => router.push(`/church/${id}`)}
            />
            <ChurchGroup
              label={anyFar ? "Farther Away" : null}
              items={results.filter((r) => r.church.isFar)}
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
  onOpen,
}: {
  label: string | null;
  items: { church: ChurchDTO; status: ReturnType<typeof getChurchStatus> }[];
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
        {items.map(({ church: c, status }) => {
          const s = statusStyle(status);
          return (
            <button
              key={c.id}
              onClick={() => onOpen(c.id)}
              className="flex items-center gap-3.5 rounded-[20px] bg-white p-3.5 text-left shadow-[0_8px_22px_-16px_rgba(30,40,70,0.4)]"
            >
              <div
                className="flex size-[52px] shrink-0 items-center justify-center rounded-2xl"
                style={{ background: statusTileGradient(status) }}
              >
                <ChurchIcon
                  className="size-6"
                  strokeWidth={1.8}
                  style={{ color: s.marker }}
                />
              </div>
              <div className="min-w-0 flex-1">
                <div className="truncate font-display text-base font-semibold text-ink">
                  {c.name}
                </div>
                <div className="mt-[3px] text-[12.5px] text-body-3">
                  {c.address.split(",")[0]} · {RITE_LABEL[c.rite]}
                </div>
              </div>
              <div className="shrink-0 text-right">
                <div className="text-[13px] font-bold" style={{ color: s.text }}>
                  {s.label}
                </div>
                <div
                  className="mt-0.5 text-[11px] font-semibold"
                  style={{ color: c.isFar ? "#b45309" : "#8a93a6" }}
                >
                  {c.distanceKm != null ? formatDistance(c.distanceKm) : "—"}
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
