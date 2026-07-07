import { nextRadiusTier } from "@/lib/radius";

export function RadiusEmptyState({
  radiusKm,
  onWiden,
}: {
  radiusKm: number;
  onWiden: (radiusKm: number) => void;
}) {
  const next = nextRadiusTier(radiusKm);

  return (
    <div className="rounded-2xl bg-white p-4 text-center text-[13px] text-body-3 shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]">
      <p>No churches found within {radiusKm} km.</p>
      {next != null ? (
        <button
          onClick={() => onWiden(next)}
          className="mt-2.5 inline-flex h-9 items-center rounded-xl bg-ink-2 px-4 text-[13px] font-bold text-white"
        >
          Search within {next} km
        </button>
      ) : (
        <p className="mt-1 text-muted-1">Try changing your location.</p>
      )}
    </div>
  );
}
