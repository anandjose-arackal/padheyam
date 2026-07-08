"use client";

import { Bell } from "lucide-react";

export default function AlertsPage() {
  return (
    <div className="absolute inset-0 flex animate-[fadeIn_0.3s_ease] flex-col bg-screen">
      <div className="px-[22px] pb-4 pt-[58px]">
        <h1 className="font-display text-[28px] font-semibold text-ink">Alerts</h1>
        <p className="mt-1 text-sm text-muted-1">
          Reminders before Mass at churches near you
        </p>
      </div>
      <div className="flex flex-1 flex-col items-center justify-center px-10 pb-28 text-center">
        <div className="flex size-16 items-center justify-center rounded-3xl bg-[linear-gradient(160deg,#fff6ea,#fdeed7)]">
          <Bell className="size-7 text-gold-ink-2" strokeWidth={1.8} />
        </div>
        <h2 className="mt-4 font-display text-xl font-semibold text-ink">
          Notifications coming soon
        </h2>
        <p className="mt-2 text-sm text-body-3">
          We&apos;ll remind you before every Holy Mass at the churches near you.
        </p>
      </div>
    </div>
  );
}
