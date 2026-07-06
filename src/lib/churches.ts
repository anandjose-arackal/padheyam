import "server-only";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { haversineKm } from "@/lib/geo";
import type { Coords } from "@/lib/location-context";
import type { ChurchDTO } from "@/lib/types";

/** Row shapes as returned by Supabase (snake_case). */
type MassRowDb = {
  day_of_week: number;
  start_min: number;
  language: string | null;
  label: string | null;
  category: "mass" | "adoration" | "confession";
};

type ChurchRowDb = {
  id: string;
  name: string;
  diocese: string;
  rite: ChurchDTO["rite"];
  address: string;
  latitude: number;
  longitude: number;
  phone: string | null;
  image_url: string | null;
  description: string | null;
  mass_schedules: MassRowDb[] | null;
};

const SELECT =
  "id,name,diocese,rite,address,latitude,longitude,phone,image_url,description,mass_schedules(day_of_week,start_min,language,label,category)";

function toDTO(c: ChurchRowDb, origin?: Coords, radiusKm?: number): ChurchDTO {
  const distanceKm = origin
    ? haversineKm(origin, { latitude: c.latitude, longitude: c.longitude })
    : null;
  return {
    id: c.id,
    name: c.name,
    diocese: c.diocese,
    rite: c.rite,
    address: c.address,
    latitude: c.latitude,
    longitude: c.longitude,
    phone: c.phone,
    imageUrl: c.image_url,
    description: c.description,
    masses: (c.mass_schedules ?? []).map((m) => ({
      dayOfWeek: m.day_of_week,
      startMin: m.start_min,
      language: m.language,
      label: m.label,
      category: m.category,
    })),
    distanceKm,
    isFar:
      distanceKm != null && radiusKm != null ? distanceKm > radiusKm : false,
  };
}

/** Churches within `radiusKm` of `origin`, sorted nearest-first. Without an
 * origin, returns all churches alphabetically. If nothing falls within the
 * radius, falls back to every church (sorted by distance) so the app never
 * shows an empty list — those beyond the radius are flagged `isFar`. */
export async function getChurches(
  origin?: Coords,
  radiusKm = 50,
): Promise<ChurchDTO[]> {
  const { data, error } = await supabaseAdmin()
    .from("churches")
    .select(SELECT)
    .order("name", { ascending: true });

  if (error) throw new Error(error.message);

  const rows = (data ?? []) as ChurchRowDb[];
  if (!origin) return rows.map((c) => toDTO(c, origin));

  const dtos = rows
    .map((c) => toDTO(c, origin, radiusKm))
    .sort((a, b) => (a.distanceKm ?? 0) - (b.distanceKm ?? 0));

  const nearby = dtos.filter((c) => !c.isFar);
  return nearby.length > 0 ? nearby : dtos;
}

export async function getChurchById(
  id: string,
  origin?: Coords,
): Promise<ChurchDTO | null> {
  const { data, error } = await supabaseAdmin()
    .from("churches")
    .select(SELECT)
    .eq("id", id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return data ? toDTO(data as ChurchRowDb, origin) : null;
}
