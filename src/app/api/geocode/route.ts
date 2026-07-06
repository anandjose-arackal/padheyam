import { NextResponse } from "next/server";

export const dynamic = "force-dynamic";

type AddressComponent = { long_name: string; types: string[] };
type GeocodeResult = {
  formatted_address: string;
  address_components: AddressComponent[];
};
type GeocodeResponse = { results?: GeocodeResult[]; status: string };

function shortLabel(result: GeocodeResult): string {
  const find = (type: string) =>
    result.address_components.find((c) => c.types.includes(type))?.long_name;

  const place =
    find("locality") ??
    find("sublocality_level_1") ??
    find("administrative_area_level_2");
  const region = find("administrative_area_level_2") ?? find("administrative_area_level_1");

  if (place && region && place !== region) return `${place}, ${region}`;
  return place ?? region ?? result.formatted_address;
}

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const lat = parseFloat(searchParams.get("lat") ?? "");
  const lng = parseFloat(searchParams.get("lng") ?? "");

  if (!Number.isFinite(lat) || !Number.isFinite(lng)) {
    return NextResponse.json({ error: "lat/lng are required" }, { status: 400 });
  }

  const key = process.env.GOOGLE_MAPS_SERVER_KEY;
  if (!key) {
    return NextResponse.json(
      { error: "GOOGLE_MAPS_SERVER_KEY is not configured" },
      { status: 500 },
    );
  }

  try {
    const url = new URL("https://maps.googleapis.com/maps/api/geocode/json");
    url.searchParams.set("latlng", `${lat},${lng}`);
    url.searchParams.set("key", key);

    const res = await fetch(url);
    const data = (await res.json()) as GeocodeResponse;

    if (data.status !== "OK" || !data.results?.[0]) {
      return NextResponse.json({ error: "No address found" }, { status: 404 });
    }

    return NextResponse.json({ label: shortLabel(data.results[0]) });
  } catch (err) {
    console.error("GET /api/geocode failed", err);
    return NextResponse.json({ error: "Failed to reverse geocode" }, { status: 500 });
  }
}
