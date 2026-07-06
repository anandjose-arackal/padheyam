import { ChurchIcon } from "@/components/church-icon";
import { statusStyle, type MassStatus } from "@/lib/status";

/** Teardrop church marker (rotated 45°, icon counter-rotated). */
export function ChurchPin({
  status,
  active = false,
}: {
  status: MassStatus;
  active?: boolean;
}) {
  const color = statusStyle(status).marker;
  return (
    <div
      className="flex size-[38px] rotate-45 items-center justify-center rounded-[50%_50%_50%_4px] border-[2.5px] border-white shadow-[0_8px_18px_-4px_rgba(20,30,60,0.5)] transition-transform"
      style={{
        background: color,
        transform: `rotate(45deg) scale(${active ? 1.18 : 1})`,
      }}
    >
      <ChurchIcon className="size-[17px] -rotate-45 text-white" strokeWidth={2} />
    </div>
  );
}
