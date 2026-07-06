"use client";

import { BottomNav } from "@/components/bottom-nav";
import { LocationGate } from "@/components/location-gate";

/**
 * Centered mobile phone frame (430 × 932 in the prototype). On small screens it
 * fills the viewport; on larger screens it renders as a centered device frame.
 */
export function AppFrame({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex min-h-dvh w-full items-center justify-center">
      <div className="relative h-dvh w-full max-w-[430px] overflow-hidden bg-white sm:h-[932px] sm:max-h-[100dvh] sm:rounded-none sm:shadow-[0_40px_120px_-30px_rgba(30,40,70,0.45)]">
        {children}
        <BottomNav />
        <LocationGate />
      </div>
    </div>
  );
}
