"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { ChevronLeft, LocateFixed, Search } from "lucide-react";
import { useMapsLibrary } from "@vis.gl/react-google-maps";
import { useLocation } from "@/lib/location-context";

const HAS_MAPS_KEY = !!process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

export default function LocationPickerPage() {
  const router = useRouter();
  const {
    coords,
    customLocation,
    requestLocation,
    setCustomLocation,
    clearCustomLocation,
  } = useLocation();
  const placesLib = useMapsLibrary("places");
  const [resolving, setResolving] = useState(false);

  const [query, setQuery] = useState("");
  const [suggestions, setSuggestions] = useState<
    google.maps.places.AutocompleteSuggestion[]
  >([]);
  const [searching, setSearching] = useState(false);
  const sessionTokenRef = useRef<google.maps.places.AutocompleteSessionToken | null>(
    null,
  );

  const getSessionToken = () => {
    if (!placesLib) return null;
    if (!sessionTokenRef.current) {
      sessionTokenRef.current = new placesLib.AutocompleteSessionToken();
    }
    return sessionTokenRef.current;
  };

  useEffect(() => {
    if (!placesLib) return;
    const trimmed = query.trim();
    if (!trimmed) {
      setSuggestions([]);
      return;
    }
    setSearching(true);
    const timer = setTimeout(async () => {
      try {
        const token = getSessionToken();
        const { suggestions: results } =
          await placesLib.AutocompleteSuggestion.fetchAutocompleteSuggestions({
            input: trimmed,
            sessionToken: token ?? undefined,
          });
        setSuggestions(results);
      } catch {
        setSuggestions([]);
      } finally {
        setSearching(false);
      }
    }, 300);
    return () => clearTimeout(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query, placesLib]);

  const onSelectSuggestion = async (
    suggestion: google.maps.places.AutocompleteSuggestion,
  ) => {
    const prediction = suggestion.placePrediction;
    if (!prediction) return;
    setResolving(true);
    try {
      const place = prediction.toPlace();
      await place.fetchFields({
        fields: ["location", "displayName", "formattedAddress"],
      });
      if (place.location) {
        const label =
          place.displayName ?? place.formattedAddress ?? "Selected location";
        setCustomLocation(
          { latitude: place.location.lat(), longitude: place.location.lng() },
          label,
        );
        router.push("/");
      }
    } finally {
      setResolving(false);
      setSuggestions([]);
      setQuery("");
      sessionTokenRef.current = null;
    }
  };

  const useCurrentLocation = () => {
    clearCustomLocation();
    if (!coords) requestLocation();
    router.push("/");
  };

  return (
    <div className="absolute inset-0 flex animate-[fadeIn_0.3s_ease] flex-col bg-screen">
      <div className="flex items-center gap-3 px-[18px] pb-3 pt-[54px]">
        <button
          onClick={() => router.push("/")}
          className="flex size-11 shrink-0 items-center justify-center rounded-[15px] bg-white shadow-[0_6px_16px_-10px_rgba(30,40,70,0.4)]"
        >
          <ChevronLeft className="size-[22px] text-ink-3" strokeWidth={2.2} />
        </button>
        <div className="font-display text-lg font-semibold text-ink">
          Change Location
        </div>
      </div>

      <div className="no-scrollbar flex-1 overflow-y-auto px-[18px] pb-28 pt-1.5">
        <button
          onClick={useCurrentLocation}
          className="mb-5 flex w-full items-center gap-3.5 rounded-[20px] bg-white p-3.5 text-left shadow-[0_8px_22px_-16px_rgba(30,40,70,0.4)]"
        >
          <div className="flex size-[42px] shrink-0 items-center justify-center rounded-2xl bg-[linear-gradient(160deg,#e7eefb,#cfe0fb)]">
            <LocateFixed className="size-5 text-today-text" strokeWidth={2} />
          </div>
          <div className="min-w-0 flex-1">
            <div className="font-display text-[15px] font-semibold text-ink">
              Use Current Location
            </div>
            <div className="mt-0.5 text-xs text-body-3">
              {customLocation ? "Switch back to GPS" : "Already active"}
            </div>
          </div>
        </button>

        {HAS_MAPS_KEY ? (
          <>
            <div className="mx-1 mb-2.5 text-xs font-bold uppercase tracking-[0.5px] text-muted-1">
              Search for a place
            </div>
            <div className="flex h-12 items-center gap-2.5 rounded-2xl bg-white px-[15px] shadow-[0_6px_16px_-10px_rgba(30,40,70,0.3)]">
              <Search className="size-[18px] text-muted-1" strokeWidth={2.2} />
              <input
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Search for a city, town, or landmark…"
                className="w-full bg-transparent text-[15px] text-ink outline-none placeholder:text-muted-1"
              />
            </div>

            {searching && (
              <p className="mt-3 text-center text-xs text-body-3">Searching…</p>
            )}

            {suggestions.length > 0 && (
              <div className="mt-3 flex flex-col gap-[9px]">
                {suggestions.map((s, i) => {
                  const prediction = s.placePrediction;
                  if (!prediction) return null;
                  return (
                    <button
                      key={prediction.placeId ?? i}
                      onClick={() => onSelectSuggestion(s)}
                      className="flex items-center gap-3.5 rounded-[20px] bg-white p-3.5 text-left shadow-[0_8px_22px_-16px_rgba(30,40,70,0.4)]"
                    >
                      <div className="min-w-0 flex-1">
                        <div className="truncate font-display text-[15px] font-semibold text-ink">
                          {prediction.mainText?.text ?? prediction.text.text}
                        </div>
                        {prediction.secondaryText && (
                          <div className="mt-0.5 truncate text-xs text-body-3">
                            {prediction.secondaryText.text}
                          </div>
                        )}
                      </div>
                    </button>
                  );
                })}
              </div>
            )}

            {resolving && (
              <p className="mt-3 text-center text-xs text-body-3">
                Loading location…
              </p>
            )}
          </>
        ) : (
          <p className="mt-4 text-center text-sm text-body-3">
            Search needs a Google Maps API key configured — you can still use your
            current location.
          </p>
        )}
      </div>
    </div>
  );
}
