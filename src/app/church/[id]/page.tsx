"use client";

import { useState } from "react";
import { useParams, useRouter } from "next/navigation";
import {
  Accessibility,
  Car,
  ChevronLeft,
  Cross,
  Flame,
  MapPin,
  Navigation,
  Phone,
} from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { RouteView } from "@/components/map/route-view";
import { useActiveCoords } from "@/lib/location-context";
import { useChurch } from "@/hooks/use-churches";
import { useNow } from "@/hooks/use-now";
import {
  DAY_NAMES,
  formatTime,
  formatTimeLabel,
  getTodayByCategory,
  getTodayMasses,
  getTomorrowMasses,
  getWeeklyScheduleByCategory,
  type MassOccurrence,
  type MassRow,
  type MassTag,
  type ScheduleCategory,
} from "@/lib/masses";
import { formatDistance } from "@/lib/geo";
import { RITE_LABEL } from "@/lib/status";

const TAG_STYLE: Record<MassTag, { label: string; bg: string; fg: string }> = {
  now: { label: "Now", bg: "#ecfbf1", fg: "#16a34a" },
  upcoming: { label: "Upcoming", bg: "#ecfbf1", fg: "#16a34a" },
  later: { label: "Later", bg: "#eef3fb", fg: "#3b6fd4" },
  done: { label: "Done", bg: "#f1f3f7", fg: "#9aa3b5" },
};

/** Per-category identity: default title, icon, and accent used on the details screen. */
const CATEGORY_META: Record<
  ScheduleCategory,
  {
    defaultLabel: string;
    icon: React.ComponentType<{
      className?: string;
      strokeWidth?: number;
      style?: React.CSSProperties;
    }>;
    dot: string;
    iconBg: string;
    iconFg: string;
  }
> = {
  mass: {
    defaultLabel: "Holy Mass",
    icon: ChurchIcon,
    dot: "#3b82f6",
    iconBg: "linear-gradient(160deg,#eaf5ff,#cfe4ff)",
    iconFg: "#3b6fd4",
  },
  adoration: {
    defaultLabel: "Eucharistic Adoration",
    icon: Flame,
    dot: "#f59e0b",
    iconBg: "linear-gradient(160deg,#fff3e0,#ffe3bd)",
    iconFg: "#d97706",
  },
  confession: {
    defaultLabel: "Confession",
    icon: Cross,
    dot: "#8b5cf6",
    iconBg: "linear-gradient(160deg,#f1ecfb,#e2d6f8)",
    iconFg: "#8b5cf6",
  },
};

const FACILITIES = [
  { icon: Car, label: "Parking" },
  { icon: Flame, label: "Adoration Chapel" },
  { icon: Cross, label: "Confession" },
  { icon: Accessibility, label: "Wheelchair Access" },
];

export default function ChurchDetailsPage() {
  const router = useRouter();
  const params = useParams<{ id: string }>();
  const id = params.id;
  const coords = useActiveCoords();
  const now = useNow();
  const { data: church, isLoading } = useChurch(id, coords);
  const [showRoute, setShowRoute] = useState(false);

  if (isLoading || !church) {
    return (
      <div className="absolute inset-0 animate-pulse bg-screen">
        <div className="h-[330px] bg-[linear-gradient(170deg,#7fd6cd,#3fb6ae)]" />
      </div>
    );
  }

  const today = getTodayMasses(church.masses, now);
  const tomorrow = getTomorrowMasses(church.masses, now);
  const todayAdoration = getTodayByCategory(church.masses, now, "adoration");
  const todayConfession = getTodayByCategory(church.masses, now, "confession");
  const weekly = getWeeklyScheduleByCategory(church.masses);

  return (
    <div className="absolute inset-0 overflow-hidden bg-screen animate-[fadeIn_0.3s_ease]">
      <div className="no-scrollbar absolute inset-0 overflow-y-auto pb-10">
        {/* hero */}
        <div className="relative h-[330px] bg-[linear-gradient(170deg,#7fd6cd,#3fb6ae_55%,#2b9a93)]">
          <div className="absolute inset-0 opacity-45 [background:radial-gradient(70%_60%_at_30%_20%,rgba(247,198,217,0.45),transparent_60%)]" />
          <ChurchIcon
            className="absolute -bottom-5 -right-8 size-[280px] opacity-[0.16] text-white"
            strokeWidth={1}
          />

          <div className="absolute inset-x-[18px] top-[54px] flex justify-start">
            <button
              onClick={() => router.push("/")}
              className="flex size-11 items-center justify-center rounded-[15px] bg-white/[0.18] text-white backdrop-blur-md"
            >
              <ChevronLeft className="size-[22px]" strokeWidth={2.2} />
            </button>
          </div>

          <div className="absolute inset-x-[22px] bottom-[30px]">
            <span className="inline-flex h-7 items-center gap-1.5 rounded-[9px] bg-[rgba(247,198,217,0.92)] px-3 text-[11px] font-bold uppercase tracking-[0.4px] text-gold-ink">
              {RITE_LABEL[church.rite]} Rite
            </span>
            <h1 className="mt-3.5 font-display text-3xl font-semibold leading-tight tracking-[-0.3px] text-white">
              {church.name}
            </h1>
            <div className="mt-2 flex items-center gap-1.5 text-[13px] text-white/75">
              <MapPin className="size-[14px] text-white/80" strokeWidth={2.2} />
              {church.address}
              {church.distanceKm != null
                ? ` · ${formatDistance(church.distanceKm)} away`
                : ""}
            </div>
          </div>
        </div>

        {/* quick actions */}
        <div className="flex gap-2.5 px-[18px] pb-2 pt-[18px]">
          <button
            onClick={() => setShowRoute(true)}
            className="flex h-[54px] flex-1 items-center justify-center gap-2 rounded-[18px] bg-ink-2 text-sm font-bold text-white"
          >
            <Navigation className="size-[17px]" strokeWidth={2} />
            Directions
          </button>
          {church.phone && (
            <a
              href={`tel:${church.phone.replace(/\s+/g, "")}`}
              className="flex size-[54px] items-center justify-center rounded-[18px] bg-surface-alt"
            >
              <Phone className="size-5 text-ink-3" strokeWidth={2} />
            </a>
          )}
        </div>

        {/* today's masses */}
        <Section title="Today's Masses" accent={CATEGORY_META.mass.dot}>
          {today.length ? (
            <div className="flex flex-col gap-[9px]">
              {today.map((m, i) => (
                <MassRowItem key={i} occ={m} />
              ))}
            </div>
          ) : (
            <Empty>No Masses remaining today.</Empty>
          )}
        </Section>

        {/* today's adoration */}
        {todayAdoration.length > 0 && (
          <Section title="Today's Adoration" accent={CATEGORY_META.adoration.dot}>
            <div className="flex flex-col gap-[9px]">
              {todayAdoration.map((m, i) => (
                <MassRowItem key={i} occ={m} />
              ))}
            </div>
          </Section>
        )}

        {/* today's confession */}
        {todayConfession.length > 0 && (
          <Section title="Today's Confession" accent={CATEGORY_META.confession.dot}>
            <div className="flex flex-col gap-[9px]">
              {todayConfession.map((m, i) => (
                <MassRowItem key={i} occ={m} />
              ))}
            </div>
          </Section>
        )}

        {/* tomorrow's masses */}
        <Section title="Tomorrow's Masses">
          {tomorrow.length ? (
            <div className="flex flex-col gap-[9px]">
              {tomorrow.map((m, i) => (
                <MassRowItem key={i} occ={m} hideTag />
              ))}
            </div>
          ) : (
            <Empty>No Masses scheduled tomorrow.</Empty>
          )}
        </Section>

        {/* weekly schedule */}
        <Section title="Weekly Schedule">
          <div className="overflow-hidden rounded-[18px] bg-white shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]">
            {weekly.map((d, i) => (
              <div
                key={d.dayOfWeek}
                className={`flex items-start gap-3 px-4 py-3 ${
                  i > 0 ? "border-t border-[#f0f2f7]" : ""
                }`}
              >
                <div className="w-24 shrink-0 text-[13px] font-semibold text-ink-3">
                  {DAY_NAMES[d.dayOfWeek]}
                </div>
                <div className="flex flex-1 flex-col gap-1.5">
                  {d.mass.length > 0 && (
                    <ScheduleGroupRow label="Mass" rows={d.mass} />
                  )}
                  {d.adoration.length > 0 && (
                    <ScheduleGroupRow label="Adoration" rows={d.adoration} />
                  )}
                  {d.confession.length > 0 && (
                    <ScheduleGroupRow label="Confession" rows={d.confession} />
                  )}
                </div>
              </div>
            ))}
          </div>
        </Section>

        {/* facilities */}
        <Section title="Facilities">
          <div className="grid grid-cols-2 gap-[9px]">
            {FACILITIES.map((f) => {
              const Icon = f.icon;
              return (
                <div
                  key={f.label}
                  className="flex items-center gap-2.5 rounded-2xl bg-white p-[13px_14px] shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]"
                >
                  <div className="flex size-[34px] items-center justify-center rounded-[11px] bg-[#eef3fb] text-today-text">
                    <Icon className="size-[18px]" strokeWidth={2} />
                  </div>
                  <span className="text-[13px] font-semibold text-ink-3">
                    {f.label}
                  </span>
                </div>
              );
            })}
          </div>
        </Section>

        {/* parish info */}
        {church.description && (
          <div className="px-[18px] pt-[18px]">
            <div className="rounded-[20px] bg-white p-[18px] shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]">
              <div className="mb-2 font-display text-base font-semibold text-ink">
                Parish Information
              </div>
              <p className="text-[13px] leading-relaxed text-body-2">
                {church.description}
              </p>
              {church.phone && (
                <a
                  href={`tel:${church.phone.replace(/\s+/g, "")}`}
                  className="mt-3.5 flex items-center gap-2 border-t border-[#f0f2f7] pt-3.5 text-[13px] font-semibold text-today-text"
                >
                  <Phone className="size-[15px]" strokeWidth={2} />
                  {church.phone}
                </a>
              )}
            </div>
          </div>
        )}
      </div>

      {showRoute && (
        <RouteView
          origin={coords}
          destination={{ latitude: church.latitude, longitude: church.longitude }}
          destinationName={church.name}
          onClose={() => setShowRoute(false)}
        />
      )}
    </div>
  );
}

function Section({
  title,
  accent,
  children,
}: {
  title: string;
  accent?: string;
  children: React.ReactNode;
}) {
  return (
    <div className="px-[18px] pt-[18px]">
      <div className="mb-3 flex items-center gap-2">
        {accent && (
          <span
            className="size-[7px] shrink-0 rounded-full"
            style={{ background: accent }}
          />
        )}
        <div className="font-display text-lg font-semibold text-ink">
          {title}
        </div>
      </div>
      {children}
    </div>
  );
}

function ScheduleGroupRow({ label, rows }: { label: string; rows: MassRow[] }) {
  return (
    <div className="flex flex-wrap items-baseline gap-x-2 gap-y-1">
      <span className="text-[11px] font-bold uppercase tracking-[0.3px] text-muted-1">
        {label}
      </span>
      <div className="flex flex-wrap gap-x-3 gap-y-1 text-[13px] text-body-2">
        {rows.map((m, j) => (
          <span key={j}>{formatTimeLabel(m.startMin)}</span>
        ))}
      </div>
    </div>
  );
}

function Empty({ children }: { children: React.ReactNode }) {
  return (
    <div className="rounded-2xl bg-white p-4 text-center text-[13px] text-body-3 shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]">
      {children}
    </div>
  );
}

function MassRowItem({
  occ,
  hideTag = false,
}: {
  occ: MassOccurrence;
  hideTag?: boolean;
}) {
  const { time, ampm } = formatTime(occ.startMin);
  const tag = TAG_STYLE[occ.tag];
  const meta = CATEGORY_META[occ.category];
  const Icon = meta.icon;
  return (
    <div
      className="flex items-center gap-3.5 rounded-[18px] bg-white p-[14px_16px] shadow-[0_6px_18px_-12px_rgba(30,40,70,0.3)]"
      style={{
        border: `1px solid ${occ.tag === "now" || occ.tag === "upcoming" ? "rgba(34,197,94,0.3)" : "#f0f2f7"}`,
      }}
    >
      <div className="w-12 shrink-0 text-center">
        <div className="font-display text-[17px] font-semibold leading-none text-ink">
          {time}
        </div>
        <div className="text-[10px] font-bold tracking-[0.5px] text-muted-1">
          {ampm}
        </div>
      </div>
      <div
        className="flex size-11 shrink-0 items-center justify-center rounded-2xl"
        style={{ background: meta.iconBg }}
      >
        <Icon className="size-[19px]" strokeWidth={1.8} style={{ color: meta.iconFg }} />
      </div>
      <div className="min-w-0 flex-1">
        <div className="truncate text-sm font-semibold text-ink-3">
          {occ.label ?? meta.defaultLabel}
        </div>
        {occ.language && (
          <div className="mt-0.5 truncate text-xs text-muted-1">{occ.language}</div>
        )}
      </div>
      {!hideTag && (
        <span
          className="flex h-[26px] shrink-0 items-center rounded-lg px-[11px] text-[11px] font-bold"
          style={{ background: tag.bg, color: tag.fg }}
        >
          {tag.label}
        </span>
      )}
    </div>
  );
}

