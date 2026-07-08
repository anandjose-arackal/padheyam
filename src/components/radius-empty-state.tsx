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
    <div className="glass rounded-2xl p-4 text-center text-[13px] text-text-secondary shadow-[0_16px_40px_-16px_rgba(22,58,107,0.3)]">
      <p>No churches found within {radiusKm} km.</p>
      {next != null ? (
        <button
          onClick={() => onWiden(next)}
          className="mt-2.5 inline-flex h-9 items-center rounded-xl bg-[linear-gradient(135deg,#69b7ff,#2f80ed)] px-4 text-[13px] font-bold text-white shadow-[0_8px_20px_-8px_rgba(47,128,237,0.55)] transition-transform active:scale-[0.98]"
        >
          Search within {next} km
        </button>
      ) : (
        <p className="mt-1 text-muted-1">Try changing your location.</p>
      )}
    </div>
  );
}
