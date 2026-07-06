import { config } from "dotenv";
import { createClient } from "@supabase/supabase-js";

// Load .env.local for the standalone script.
config({ path: ".env.local" });

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!url || !key) {
  console.error(
    "Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local",
  );
  process.exit(1);
}

const supabase = createClient(url, key, {
  auth: { persistSession: false },
});

type Rite = "SYRO_MALABAR" | "LATIN" | "MALANKARA";

const toMin = (hhmm: string) => {
  const [h, m] = hhmm.split(":").map(Number);
  return h * 60 + m;
};

type MassDef = {
  days: number[];
  time: string;
  language?: string;
  label: string;
  category?: "mass" | "adoration" | "confession";
};
type ChurchDef = {
  name: string;
  diocese: string;
  rite: Rite;
  address: string;
  latitude: number;
  longitude: number;
  phone: string;
  description: string;
  masses: MassDef[];
};

const ALL = [0, 1, 2, 3, 4, 5, 6];
const WEEKDAYS = [1, 2, 3, 4, 5];

const CHURCHES: ChurchDef[] = [
  {
    name: "St. Mary's Forane Church",
    diocese: "Eparchy of Mananthavady",
    rite: "SYRO_MALABAR",
    address: "Church Junction, Kalpetta",
    latitude: 11.6086,
    longitude: 76.083,
    phone: "+91 4936 202 333",
    description:
      "Established 1898, St. Mary's Forane Church serves the Kalpetta parish under the Eparchy of Mananthavady. Adoration is held daily after the morning Mass, with confession available on request.",
    masses: [
      { days: ALL, time: "05:30", language: "Malayalam", label: "Morning Qurbana" },
      { days: ALL, time: "18:30", language: "Malayalam", label: "Holy Qurbana" },
      { days: ALL, time: "19:45", language: "English", label: "Evening Mass" },
      { days: [0], time: "07:00", language: "Malayalam", label: "Holy Qurbana" },
      { days: [0], time: "09:00", language: "English", label: "Holy Qurbana" },
      { days: ALL, time: "06:30", label: "Eucharistic Adoration", category: "adoration" },
      { days: [0], time: "06:30", label: "Confession", category: "confession" },
    ],
  },
  {
    name: "Sacred Heart Church",
    diocese: "Diocese of Mananthavady (Latin)",
    rite: "LATIN",
    address: "Meenangadi, Wayanad",
    latitude: 11.6667,
    longitude: 76.15,
    phone: "+91 4936 247 110",
    description:
      "Sacred Heart Church is a Latin-rite parish in Meenangadi known for its evening novena devotions and active youth ministry.",
    masses: [
      { days: ALL, time: "06:00", language: "English", label: "Morning Mass" },
      { days: ALL, time: "18:00", language: "Malayalam", label: "Evening Mass" },
      { days: [0], time: "08:00", language: "Malayalam", label: "Holy Mass" },
      { days: [0], time: "10:00", language: "English", label: "Holy Mass" },
      { days: [6], time: "17:00", label: "Confession", category: "confession" },
    ],
  },
  {
    name: "St. Joseph Cathedral",
    diocese: "Eparchy of Mananthavady",
    rite: "SYRO_MALABAR",
    address: "Mananthavady, Wayanad",
    latitude: 11.8009,
    longitude: 76.0017,
    phone: "+91 4935 240 226",
    description:
      "The cathedral church of the Eparchy of Mananthavady, seat of the Bishop, with daily Qurbana and a perpetual adoration chapel.",
    masses: [
      { days: ALL, time: "06:15", language: "Malayalam", label: "Holy Qurbana" },
      { days: ALL, time: "18:15", language: "Malayalam", label: "Holy Qurbana" },
      { days: [0], time: "07:30", language: "Malayalam", label: "Holy Qurbana" },
      { days: [0], time: "09:30", language: "English", label: "Holy Qurbana" },
      { days: [0], time: "17:00", language: "Malayalam", label: "Vespers & Qurbana" },
      { days: ALL, time: "09:00", label: "Adoration", category: "adoration" },
      { days: [5], time: "17:30", label: "Confession", category: "confession" },
    ],
  },
  {
    name: "Little Flower Church",
    diocese: "Diocese of Mananthavady (Latin)",
    rite: "LATIN",
    address: "Sulthan Bathery, Wayanad",
    latitude: 11.6664,
    longitude: 76.2599,
    phone: "+91 4936 220 145",
    description:
      "Little Flower Church in Sulthan Bathery is dedicated to St. Thérèse of Lisieux, with Friday novena and weekend family Masses.",
    masses: [
      { days: ALL, time: "06:00", language: "Malayalam", label: "Morning Mass" },
      { days: WEEKDAYS, time: "17:30", language: "Malayalam", label: "Evening Mass" },
      { days: [0], time: "08:30", language: "English", label: "Holy Mass" },
    ],
  },
  {
    name: "St. Antony Church",
    diocese: "Eparchy of Mananthavady",
    rite: "SYRO_MALABAR",
    address: "Pulpally, Wayanad",
    latitude: 11.7833,
    longitude: 76.1667,
    phone: "+91 4936 240 078",
    description:
      "A quiet mission parish in Pulpally with Sunday Qurbana and the popular Wednesday St. Antony novena.",
    masses: [
      { days: [0], time: "07:00", language: "Malayalam", label: "Holy Qurbana" },
      { days: [0], time: "16:30", language: "Malayalam", label: "Evening Qurbana" },
      { days: [3], time: "18:00", language: "Malayalam", label: "St. Antony Novena" },
    ],
  },
];

async function main() {
  console.log("Seeding churches…");

  // Clean slate (cascade deletes mass_schedules).
  const { error: delErr } = await supabase
    .from("churches")
    .delete()
    .not("id", "is", null);
  if (delErr) throw delErr;

  for (const c of CHURCHES) {
    const { masses, ...church } = c;
    const { data: inserted, error: insErr } = await supabase
      .from("churches")
      .insert(church)
      .select("id")
      .single();
    if (insErr) throw insErr;

    const rows = masses.flatMap((m) =>
      m.days.map((d) => ({
        church_id: inserted.id,
        day_of_week: d,
        start_min: toMin(m.time),
        language: m.language ?? null,
        label: m.label,
        category: m.category ?? "mass",
      })),
    );
    const { error: massErr } = await supabase.from("mass_schedules").insert(rows);
    if (massErr) throw massErr;

    console.log(`  ✓ ${church.name} (${rows.length} masses)`);
  }

  console.log("Done.");
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
