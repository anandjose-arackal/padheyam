"use client";

import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
} from "react";
import { useReverseGeocode } from "@/hooks/use-reverse-geocode";

export type Coords = { latitude: number; longitude: number };

/** Default map center — Kalpetta, Wayanad (matches the prototype copy). */
export const DEFAULT_COORDS: Coords = { latitude: 11.6086, longitude: 76.083 };
const DEFAULT_LABEL = "Kalpetta, Wayanad";

export type CustomLocation = { coords: Coords; label: string };

type LocationState = {
  /** Resolved user coordinates, or null until granted/dismissed. */
  coords: Coords | null;
  /** A manually picked location that overrides GPS/default when set. */
  customLocation: CustomLocation | null;
  /** Whether the permission gate should still be shown. */
  showGate: boolean;
  /** True while a geolocation request is in flight. */
  requesting: boolean;
  /** Error message from the last geolocation attempt, if any. */
  error: string | null;
  requestLocation: () => void;
  dismissGate: () => void;
  setCustomLocation: (coords: Coords, label: string) => void;
  clearCustomLocation: () => void;
};

const LocationContext = createContext<LocationState | null>(null);

const STORAGE_KEY = "mt:coords";
const GATE_KEY = "mt:gateDismissed";
const CUSTOM_KEY = "mt:customLocation";

export function LocationProvider({ children }: { children: React.ReactNode }) {
  const [coords, setCoords] = useState<Coords | null>(null);
  const [customLocation, setCustomLocationState] = useState<CustomLocation | null>(null);
  const [showGate, setShowGate] = useState(true);
  const [requesting, setRequesting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Hydrate from localStorage on mount. This must run after mount (not in a
  // lazy initializer) to avoid an SSR/client hydration mismatch — the synchronous
  // setState here is the intended "read from external store once" pattern.
  useEffect(() => {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      const dismissed = localStorage.getItem(GATE_KEY) === "1";
      const rawCustom = localStorage.getItem(CUSTOM_KEY);
      if (raw) {
        // eslint-disable-next-line react-hooks/set-state-in-effect
        setCoords(JSON.parse(raw) as Coords);
        setShowGate(false);
      } else if (dismissed) {
        setShowGate(false);
      }
      if (rawCustom) {
        setCustomLocationState(JSON.parse(rawCustom) as CustomLocation);
      }
    } catch {
      /* ignore */
    }
  }, []);

  const setCustomLocation = useCallback((next: Coords, label: string) => {
    const value = { coords: next, label };
    setCustomLocationState(value);
    try {
      localStorage.setItem(CUSTOM_KEY, JSON.stringify(value));
    } catch {
      /* ignore */
    }
  }, []);

  const clearCustomLocation = useCallback(() => {
    setCustomLocationState(null);
    try {
      localStorage.removeItem(CUSTOM_KEY);
    } catch {
      /* ignore */
    }
  }, []);

  const requestLocation = useCallback(() => {
    setError(null);
    if (typeof navigator === "undefined" || !navigator.geolocation) {
      setError("Geolocation is not supported on this device.");
      setCoords(DEFAULT_COORDS);
      setShowGate(false);
      return;
    }
    setRequesting(true);

    // Some mobile browsers silently block the Geolocation API on insecure
    // (non-HTTPS, non-localhost) origins without ever invoking either
    // callback — the browser's own `timeout` option never engages in that
    // case, so this independent fallback guarantees the gate can't hang
    // forever regardless of what the browser does.
    let settled = false;
    const fallback = setTimeout(() => {
      if (settled) return;
      settled = true;
      setError(
        "Location request timed out — using default location. (Geolocation needs HTTPS; it may be silently blocked over a plain http:// address.)",
      );
      setCoords(DEFAULT_COORDS);
      setShowGate(false);
      setRequesting(false);
    }, 12000);

    navigator.geolocation.getCurrentPosition(
      (pos) => {
        if (settled) return;
        settled = true;
        clearTimeout(fallback);
        const next: Coords = {
          latitude: pos.coords.latitude,
          longitude: pos.coords.longitude,
        };
        setCoords(next);
        setShowGate(false);
        setRequesting(false);
        try {
          localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
        } catch {
          /* ignore */
        }
      },
      (err) => {
        if (settled) return;
        settled = true;
        clearTimeout(fallback);
        setError(err.message || "Unable to retrieve your location.");
        setCoords(DEFAULT_COORDS);
        setShowGate(false);
        setRequesting(false);
      },
      { enableHighAccuracy: true, timeout: 10000, maximumAge: 60000 },
    );
  }, []);

  const dismissGate = useCallback(() => {
    setShowGate(false);
    setCoords((c) => c ?? DEFAULT_COORDS);
    try {
      localStorage.setItem(GATE_KEY, "1");
    } catch {
      /* ignore */
    }
  }, []);

  const value = useMemo<LocationState>(
    () => ({
      coords,
      customLocation,
      showGate,
      requesting,
      error,
      requestLocation,
      dismissGate,
      setCustomLocation,
      clearCustomLocation,
    }),
    [
      coords,
      customLocation,
      showGate,
      requesting,
      error,
      requestLocation,
      dismissGate,
      setCustomLocation,
      clearCustomLocation,
    ],
  );

  return (
    <LocationContext.Provider value={value}>
      {children}
    </LocationContext.Provider>
  );
}

export function useLocation() {
  const ctx = useContext(LocationContext);
  if (!ctx) {
    throw new Error("useLocation must be used within a LocationProvider");
  }
  return ctx;
}

/** Coordinates to use for queries — a manually picked location wins over
 * GPS, which wins over the default center. */
export function useActiveCoords(): Coords {
  const { coords, customLocation } = useLocation();
  return customLocation?.coords ?? coords ?? DEFAULT_COORDS;
}

/** Human-readable label for the active location. A custom pick already has
 * a label (from the place the user searched); GPS/default coords are
 * reverse-geocoded, short-circuiting to the static default label when
 * nothing has resolved yet (no network call). */
export function useActiveLocationLabel(): { label: string; isLoading: boolean } {
  const { coords, customLocation } = useLocation();
  const base = coords ?? DEFAULT_COORDS;
  const isDefault = !customLocation && !coords;

  const geocode = useReverseGeocode(base, !isDefault && !customLocation);

  if (customLocation) return { label: customLocation.label, isLoading: false };
  if (isDefault) return { label: DEFAULT_LABEL, isLoading: false };
  return { label: geocode.data ?? DEFAULT_LABEL, isLoading: geocode.isLoading };
}
