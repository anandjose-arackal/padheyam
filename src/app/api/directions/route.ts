import { NextResponse } from "next/server";

export const dynamic = "force-dynamic";

type RoutesApiResponse = {
  routes?: Array<{
    distanceMeters?: number;
    duration?: string;
    polyline?: { encodedPolyline?: string };
  }>;
};

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const originLat = parseFloat(searchParams.get("originLat") ?? "");
  const originLng = parseFloat(searchParams.get("originLng") ?? "");
  const destLat = parseFloat(searchParams.get("destLat") ?? "");
  const destLng = parseFloat(searchParams.get("destLng") ?? "");

  if (
    !Number.isFinite(originLat) ||
    !Number.isFinite(originLng) ||
    !Number.isFinite(destLat) ||
    !Number.isFinite(destLng)
  ) {
    return NextResponse.json(
      { error: "originLat/originLng/destLat/destLng are required" },
      { status: 400 },
    );
  }

  const key = process.env.GOOGLE_MAPS_SERVER_KEY;
  if (!key) {
    return NextResponse.json(
      { error: "GOOGLE_MAPS_SERVER_KEY is not configured" },
      { status: 500 },
    );
  }

  try {
    const res = await fetch(
      "https://routes.googleapis.com/directions/v2:computeRoutes",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-Goog-Api-Key": key,
          "X-Goog-FieldMask":
            "routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline",
        },
        body: JSON.stringify({
          origin: { location: { latLng: { latitude: originLat, longitude: originLng } } },
          destination: { location: { latLng: { latitude: destLat, longitude: destLng } } },
          travelMode: "DRIVE",
        }),
      },
    );

    if (!res.ok) {
      const detail = await res.text();
      console.error("Routes API error", res.status, detail);
      return NextResponse.json({ error: "Failed to compute route" }, { status: 502 });
    }

    const data = (await res.json()) as RoutesApiResponse;
    const route = data.routes?.[0];
    if (!route?.polyline?.encodedPolyline) {
      return NextResponse.json({ error: "No route found" }, { status: 404 });
    }

    return NextResponse.json({
      distanceMeters: route.distanceMeters ?? 0,
      durationSeconds: parseInt(route.duration ?? "0", 10),
      polyline: route.polyline.encodedPolyline,
    });
  } catch (err) {
    console.error("GET /api/directions failed", err);
    return NextResponse.json({ error: "Failed to compute route" }, { status: 500 });
  }
}
