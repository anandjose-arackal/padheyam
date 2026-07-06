import { NextResponse } from "next/server";
import { getChurches } from "@/lib/churches";
import type { Coords } from "@/lib/location-context";

export const dynamic = "force-dynamic";

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const lat = parseFloat(searchParams.get("lat") ?? "");
  const lng = parseFloat(searchParams.get("lng") ?? "");
  const radius = parseFloat(searchParams.get("radius") ?? "50");

  const origin: Coords | undefined =
    Number.isFinite(lat) && Number.isFinite(lng)
      ? { latitude: lat, longitude: lng }
      : undefined;

  try {
    const churches = await getChurches(
      origin,
      Number.isFinite(radius) ? radius : 50,
    );
    return NextResponse.json({ churches });
  } catch (err) {
    console.error("GET /api/churches failed", err);
    return NextResponse.json(
      { error: "Failed to load churches" },
      { status: 500 },
    );
  }
}
