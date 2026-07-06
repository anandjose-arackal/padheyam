"use client";

import { useState } from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { APIProvider } from "@vis.gl/react-google-maps";
import { Toaster } from "@/components/ui/sonner";
import { LocationProvider } from "@/lib/location-context";
import { AuthProvider } from "@/lib/auth-context";
import { AuthSheetProvider } from "@/components/auth-sheet";

const GOOGLE_MAPS_API_KEY = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

/** Wraps children in the Google Maps JS SDK provider when a key is
 * configured, so map/route/places screens share one loaded SDK instance
 * instead of each mounting its own. No-op (renders children as-is) without
 * a key — that's how the app falls back to the stylized FakeMap. */
function MapsProvider({ children }: { children: React.ReactNode }) {
  if (!GOOGLE_MAPS_API_KEY) return <>{children}</>;
  return <APIProvider apiKey={GOOGLE_MAPS_API_KEY}>{children}</APIProvider>;
}

export function Providers({ children }: { children: React.ReactNode }) {
  const [queryClient] = useState(
    () =>
      new QueryClient({
        defaultOptions: {
          queries: {
            staleTime: 60_000,
            refetchOnWindowFocus: false,
            retry: 1,
          },
        },
      }),
  );

  return (
    <QueryClientProvider client={queryClient}>
      <MapsProvider>
        <AuthProvider>
          <AuthSheetProvider>
            <LocationProvider>
              {children}
              <Toaster position="top-center" />
            </LocationProvider>
          </AuthSheetProvider>
        </AuthProvider>
      </MapsProvider>
    </QueryClientProvider>
  );
}
