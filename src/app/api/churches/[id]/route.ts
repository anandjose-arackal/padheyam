import { NextResponse } from "next/server";
import { getChurchById } from "@/lib/churches";
import type { Coords } from "@/lib/location-context";

export const dynamic = "force-dynamic";

export async function GET(
  request: Request,
  { params }: { params: Promise<{ id: string }> },
) {
  const { id } = await params;
  const { searchParams } = new URL(request.url);
  const lat = parseFloat(searchParams.get("lat") ?? "");
  const lng = parseFloat(searchParams.get("lng") ?? "");
  const origin: Coords | undefined =
    Number.isFinite(lat) && Number.isFinite(lng)
      ? { latitude: lat, longitude: lng }
      : undefined;

  try {
    const church = await getChurchById(id, origin);
    if (!church) {
      return NextResponse.json({ error: "Not found" }, { status: 404 });
    }
    return NextResponse.json({ church });
  } catch (err) {
    console.error("GET /api/churches/[id] failed", err);
    return NextResponse.json(
      { error: "Failed to load church" },
      { status: 500 },
    );
  }
}
