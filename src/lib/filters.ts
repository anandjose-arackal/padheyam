import {
  getTodayMasses,
  getUpcomingMass,
  type MassRow,
} from "@/lib/masses";

export type FilterKey = "now" | "hour" | "today" | "tomorrow" | "sunday";

export const FILTERS: { key: FilterKey; label: string; dot: string }[] = [
  { key: "now", label: "Mass Now", dot: "#22c55e" },
  { key: "hour", label: "Next Hour", dot: "#f59e0b" },
  { key: "today", label: "Today", dot: "#3b82f6" },
  { key: "tomorrow", label: "Tomorrow", dot: "#8b5cf6" },
  { key: "sunday", label: "Sunday", dot: "#ec4899" },
];

/** Whether a church matches the selected time-window filter. */
export function matchesFilter(
  masses: MassRow[],
  now: Date,
  filter: FilterKey,
): boolean {
  const { status } = getUpcomingMass(masses, now);

  switch (filter) {
    case "now":
      return status === "now";
    case "hour":
      return status === "now" || status === "hour";
    case "today":
      // Any Mass still to come (or in progress) today.
      return getTodayMasses(masses, now).some((m) => m.tag !== "done");
    case "tomorrow":
      return status === "tomorrow" || status === "today" || status === "hour" || status === "now";
    case "sunday":
      return masses.some((m) => m.dayOfWeek === 0);
    default:
      return true;
  }
}
