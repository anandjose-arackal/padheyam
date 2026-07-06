/**
 * Mass-status design system — the single source of truth that maps a church's
 * upcoming-Mass status to its colors. Reused by map markers, filter chips,
 * list rows, and badges so the palette stays consistent.
 */

export type MassStatus = "now" | "hour" | "today" | "tomorrow" | "none";

export type StatusStyle = {
  /** Human label, e.g. "Mass Now". */
  label: string;
  /** Solid marker / dot color. */
  marker: string;
  /** Foreground text color for the status. */
  text: string;
  /** Soft background tint. */
  bg: string;
  /** Secondary tint (gradients / icon tiles). */
  bg2: string;
};

export const STATUS: Record<MassStatus, StatusStyle> = {
  now: {
    label: "Mass Now",
    marker: "#22c55e",
    text: "#16a34a",
    bg: "#ecfbf1",
    bg2: "#e1f7e9",
  },
  hour: {
    label: "Next Hour",
    marker: "#f59e0b",
    text: "#d97706",
    bg: "#fff3e0",
    bg2: "#ffe3bd",
  },
  today: {
    label: "Today",
    marker: "#3b82f6",
    text: "#3b6fd4",
    bg: "#eef3fb",
    bg2: "#cfe0fb",
  },
  tomorrow: {
    label: "Tomorrow",
    marker: "#8b5cf6",
    text: "#8b5cf6",
    bg: "#f1ecfb",
    bg2: "#e2d6f8",
  },
  none: {
    label: "No Mass",
    marker: "#94a3b8",
    text: "#9aa3b5",
    bg: "#f1f3f7",
    bg2: "#f1f3f7",
  },
};

export function statusStyle(status: MassStatus): StatusStyle {
  return STATUS[status];
}

/** Linear-gradient icon-tile background for a status (used in lists/saved). */
export function statusTileGradient(status: MassStatus): string {
  const s = STATUS[status];
  if (status === "none") return s.bg;
  return `linear-gradient(160deg, ${s.bg}, ${s.bg2})`;
}

/** Rite display labels. */
export const RITE_LABEL: Record<string, string> = {
  SYRO_MALABAR: "Syro-Malabar",
  LATIN: "Latin Rite",
  MALANKARA: "Malankara",
};
