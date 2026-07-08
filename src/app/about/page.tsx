"use client";

import { ShieldCheck } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";

export default function AboutPage() {
  return (
    <div className="absolute inset-0 flex animate-[fadeIn_0.3s_ease] flex-col bg-screen">
      <div className="px-[22px] pb-4 pt-[58px]">
        <h1 className="font-display text-[28px] font-semibold text-ink">
          About
        </h1>
        <p className="mt-1 text-sm text-muted-1">Padheyam is anonymous — no account needed</p>
      </div>

      <div className="flex-1 overflow-y-auto px-[18px] pb-28 pt-2">
        <div className="rounded-[20px] bg-white p-[18px] shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]">
          <div className="mb-3 flex size-12 items-center justify-center rounded-2xl bg-[linear-gradient(160deg,#e7eefb,#cfe0fb)]">
            <ChurchIcon className="size-6 text-today-text" strokeWidth={1.8} />
          </div>
          <div className="font-display text-base font-semibold text-ink">
            Padheyam
          </div>
          <p className="mt-2 text-[13px] leading-relaxed text-body-2">
            Padheyam helps Catholics discover nearby churches and their
            upcoming Mass, Adoration, and Confession schedules based on live
            location. Find what&apos;s happening now, what&apos;s coming up, and how
            to get there — all in one map-first view.
          </p>
        </div>

        <div className="mt-3.5 rounded-[20px] bg-white p-[18px] shadow-[0_6px_18px_-14px_rgba(30,40,70,0.3)]">
          <div className="mb-3 flex size-12 items-center justify-center rounded-2xl bg-[#ecfbf1]">
            <ShieldCheck className="size-6 text-now-text" strokeWidth={1.8} />
          </div>
          <div className="font-display text-base font-semibold text-ink">
            Your privacy
          </div>
          <p className="mt-2 text-[13px] leading-relaxed text-body-2">
            Padheyam doesn&apos;t require an account and doesn&apos;t store any
            personal data. Your location is used only in your browser to
            find nearby churches and is never saved on our servers.
          </p>
        </div>
      </div>
    </div>
  );
}
