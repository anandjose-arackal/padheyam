import { Clock, MapPin } from "lucide-react";

export function ChurchBadges({
  isClosest,
  isSoonest,
}: {
  isClosest: boolean;
  isSoonest: boolean;
}) {
  if (!isClosest && !isSoonest) return null;

  return (
    <div className="mt-1 flex flex-wrap gap-1.5">
      {isClosest && (
        <span className="inline-flex h-6 items-center gap-1 rounded-lg bg-[rgba(243,221,174,0.92)] px-2 text-[10px] font-bold uppercase tracking-[0.3px] text-gold-ink">
          <MapPin className="size-3" strokeWidth={2.5} />
          Closest
        </span>
      )}
      {isSoonest && (
        <span className="inline-flex h-6 items-center gap-1 rounded-lg bg-[#fde8ef] px-2 text-[10px] font-bold uppercase tracking-[0.3px] text-[#be123c]">
          <Clock className="size-3" strokeWidth={2.5} />
          Next Mass
        </span>
      )}
    </div>
  );
}
