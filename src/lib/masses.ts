import type { MassStatus } from "@/lib/status";

export type ScheduleCategory = "mass" | "adoration" | "confession";

/** A weekly recurring schedule row (Mass, Adoration, or Confession). */
export type MassRow = {
  dayOfWeek: number; // 0 = Sun … 6 = Sat
  startMin: number; // minutes from midnight
  language: string | null;
  label: string | null;
  category: ScheduleCategory;
};

/** How long a Mass is considered "in progress" (drives the "Mass Now" status). */
export const MASS_DURATION_MIN = 60;

/** Per-Mass display tag on the details screen. */
export type MassTag = "now" | "upcoming" | "later" | "done";

export type MassOccurrence = {
  /** Absolute start time. */
  start: Date;
  startMin: number;
  language: string | null;
  label: string | null;
  category: ScheduleCategory;
  /** Whole minutes from `now` until start (negative if already started). */
  minutesUntil: number;
  tag: MassTag;
};

function onlyMass(rows: MassRow[]): MassRow[] {
  return rows.filter((m) => m.category === "mass");
}

const DAY_MS = 24 * 60 * 60 * 1000;

function startOfDay(d: Date): Date {
  const c = new Date(d);
  c.setHours(0, 0, 0, 0);
  return c;
}

function tagFor(minutesUntil: number): MassTag {
  if (minutesUntil <= -MASS_DURATION_MIN) return "done";
  if (minutesUntil <= 0) return "now";
  if (minutesUntil <= 60) return "upcoming";
  return "later";
}

/**
 * Expand recurring Mass rows into concrete occurrences over the next
 * `daysAhead` days, sorted by start time.
 */
export function expandOccurrences(
  masses: MassRow[],
  now: Date,
  daysAhead = 7,
): MassOccurrence[] {
  const base = startOfDay(now);
  const out: MassOccurrence[] = [];

  for (let offset = 0; offset <= daysAhead; offset++) {
    const day = new Date(base.getTime() + offset * DAY_MS);
    const dow = day.getDay();
    for (const m of masses) {
      if (m.dayOfWeek !== dow) continue;
      const start = new Date(day);
      start.setMinutes(m.startMin);
      const minutesUntil = Math.round((start.getTime() - now.getTime()) / 60000);
      out.push({
        start,
        startMin: m.startMin,
        language: m.language,
        label: m.label,
        category: m.category,
        minutesUntil,
        tag: tagFor(minutesUntil),
      });
    }
  }

  return out.sort((a, b) => a.start.getTime() - b.start.getTime());
}

/** Occurrences for a given calendar-day offset (0 = today, 1 = tomorrow). */
export function massesForDay(
  masses: MassRow[],
  now: Date,
  dayOffset: number,
): MassOccurrence[] {
  const target = startOfDay(new Date(now.getTime() + dayOffset * DAY_MS));
  return expandOccurrences(masses, now, dayOffset + 1).filter(
    (o) => startOfDay(o.start).getTime() === target.getTime(),
  );
}

export type UpcomingResult = {
  status: MassStatus;
  /** The relevant Mass: in-progress one, else the next upcoming. */
  nextMass: MassOccurrence | null;
  /** Minutes until the next Mass starts (0 if in progress). */
  countdownMinutes: number | null;
};

/**
 * Core engine: classify a church's soonest Mass relative to `now`.
 * - now      → a Mass is currently in progress
 * - hour     → next Mass starts within 60 minutes
 * - today    → next Mass is later today
 * - tomorrow → no more Masses today, but one tomorrow
 * - none     → nothing today or tomorrow
 */
export function getUpcomingMass(masses: MassRow[], now: Date): UpcomingResult {
  const occ = expandOccurrences(onlyMass(masses), now, 2);

  // In progress?
  const inProgress = occ.find(
    (o) => o.minutesUntil <= 0 && o.minutesUntil > -MASS_DURATION_MIN,
  );
  if (inProgress) {
    return { status: "now", nextMass: inProgress, countdownMinutes: 0 };
  }

  const next = occ.find((o) => o.minutesUntil > 0);
  if (!next) return { status: "none", nextMass: null, countdownMinutes: null };

  const today = startOfDay(now).getTime();
  const tomorrow = today + DAY_MS;
  const massDay = startOfDay(next.start).getTime();

  let status: MassStatus;
  if (next.minutesUntil <= 60) status = "hour";
  else if (massDay === today) status = "today";
  else if (massDay === tomorrow) status = "tomorrow";
  else status = "none";

  return { status, nextMass: next, countdownMinutes: next.minutesUntil };
}

/** Just the status (used to color markers / list rows). */
export function getChurchStatus(masses: MassRow[], now: Date): MassStatus {
  return getUpcomingMass(masses, now).status;
}

/** Today's Masses with per-Mass tags (for the details screen). */
export function getTodayMasses(masses: MassRow[], now: Date): MassOccurrence[] {
  return massesForDay(onlyMass(masses), now, 0);
}

export function getTomorrowMasses(
  masses: MassRow[],
  now: Date,
): MassOccurrence[] {
  return massesForDay(onlyMass(masses), now, 1);
}

/** Today's/Tomorrow's occurrences for a specific category (Adoration, Confession). */
export function getTodayByCategory(
  masses: MassRow[],
  now: Date,
  category: ScheduleCategory,
): MassOccurrence[] {
  return massesForDay(
    masses.filter((m) => m.category === category),
    now,
    0,
  );
}

export function getTomorrowByCategory(
  masses: MassRow[],
  now: Date,
  category: ScheduleCategory,
): MassOccurrence[] {
  return massesForDay(
    masses.filter((m) => m.category === category),
    now,
    1,
  );
}

export type WeeklyDayGroup = {
  dayOfWeek: number;
  mass: MassRow[];
  adoration: MassRow[];
  confession: MassRow[];
};

/** Grouped weekly schedule, Sunday → Saturday, split by category. */
export function getWeeklyScheduleByCategory(masses: MassRow[]): WeeklyDayGroup[] {
  return Array.from({ length: 7 }, (_, dow) => {
    const day = masses.filter((m) => m.dayOfWeek === dow);
    const byCategory = (category: ScheduleCategory) =>
      day
        .filter((m) => m.category === category)
        .sort((a, b) => a.startMin - b.startMin);
    return {
      dayOfWeek: dow,
      mass: byCategory("mass"),
      adoration: byCategory("adoration"),
      confession: byCategory("confession"),
    };
  }).filter((d) => d.mass.length || d.adoration.length || d.confession.length);
}

/** Format minutes-from-midnight as "6:30" + "PM". */
export function formatTime(startMin: number): { time: string; ampm: string } {
  const h24 = Math.floor(startMin / 60);
  const m = startMin % 60;
  const ampm = h24 >= 12 ? "PM" : "AM";
  const h12 = h24 % 12 === 0 ? 12 : h24 % 12;
  return { time: `${h12}:${m.toString().padStart(2, "0")}`, ampm };
}

export function formatTimeLabel(startMin: number): string {
  const { time, ampm } = formatTime(startMin);
  return `${time} ${ampm}`;
}

/** "Starts in" countdown text, e.g. "45 min", "1 hr 5 min", "Now". */
export function formatCountdown(minutes: number | null): string {
  if (minutes === null) return "—";
  if (minutes <= 0) return "Now";
  if (minutes < 60) return `${minutes} min`;
  const h = Math.floor(minutes / 60);
  const m = minutes % 60;
  return m === 0 ? `${h} hr` : `${h} hr ${m} min`;
}

export const DAY_NAMES = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];
