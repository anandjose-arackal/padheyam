import type { MassRow } from "@/lib/masses";

/** Serialized church returned by the API (raw Mass rows; status/countdown
 * are computed client-side so countdowns stay live). */
export type ChurchDTO = {
  id: string;
  name: string;
  diocese: string;
  rite: "SYRO_MALABAR" | "LATIN" | "MALANKARA";
  address: string;
  latitude: number;
  longitude: number;
  phone: string | null;
  imageUrl: string | null;
  description: string | null;
  masses: MassRow[];
  /** Distance from the query origin, in km (when lat/lng were provided). */
  distanceKm: number | null;
  /** True when this church is outside the requested radius but was
   * included anyway because nothing was found within it. */
  isFar: boolean;
};
