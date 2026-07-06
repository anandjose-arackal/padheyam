"use client";

import { useMemo } from "react";
import { useRouter } from "next/navigation";
import { Bell, Bookmark, LogIn } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { useAuth } from "@/lib/auth-context";
import { useAuthSheet } from "@/components/auth-sheet";
import { useActiveCoords } from "@/lib/location-context";
import { useNearbyChurches } from "@/hooks/use-churches";
import { useSavedChurches } from "@/hooks/use-saved";
import { useNow } from "@/hooks/use-now";
import { formatTimeLabel, getUpcomingMass } from "@/lib/masses";
import { RITE_LABEL } from "@/lib/status";

export default function SavedPage() {
  const router = useRouter();
  const { user } = useAuth();
  const { promptSignIn } = useAuthSheet();
  const coords = useActiveCoords();
  const now = useNow();
  const { data: saved = [] } = useSavedChurches();
  const { data: churches = [] } = useNearbyChurches(coords, 100_000);

  const savedChurches = useMemo(() => {
    const ids = new Set(saved.map((s) => s.churchId));
    return churches.filter((c) => ids.has(c.id));
  }, [saved, churches]);

  return (
    <div className="absolute inset-0 flex animate-[fadeIn_0.3s_ease] flex-col bg-screen">
      <div className="px-[22px] pb-4 pt-[58px]">
        <h1 className="font-display text-[28px] font-semibold text-ink">
          Saved Churches
        </h1>
        <p className="mt-1 text-sm text-muted-1">
          Get notified before each Holy Mass
        </p>
      </div>

      <div className="no-scrollbar flex-1 overflow-y-auto px-[18px] pb-28 pt-1.5">
        {!user ? (
          <SignInPrompt onSignIn={promptSignIn} />
        ) : savedChurches.length === 0 ? (
          <EmptyState />
        ) : (
          <div className="flex flex-col gap-[11px]">
            {savedChurches.map((c) => {
              const next = getUpcomingMass(c.masses, now).nextMass;
              return (
                <button
                  key={c.id}
                  onClick={() => router.push(`/church/${c.id}`)}
                  className="rounded-[22px] bg-white p-4 text-left shadow-[0_8px_22px_-16px_rgba(30,40,70,0.4)]"
                >
                  <div className="flex items-center gap-3.5">
                    <div className="flex size-[50px] shrink-0 items-center justify-center rounded-[15px] bg-[linear-gradient(160deg,#e7eefb,#cfe0fb)]">
                      <ChurchIcon
                        className="size-[23px] text-today-text"
                        strokeWidth={1.8}
                      />
                    </div>
                    <div className="min-w-0 flex-1">
                      <div className="truncate font-display text-base font-semibold text-ink">
                        {c.name}
                      </div>
                      <div className="mt-[3px] text-[12.5px] text-body-3">
                        {c.address.split(",")[0]} · {RITE_LABEL[c.rite]}
                      </div>
                    </div>
                    <Bookmark
                      className="size-5 text-gold-2"
                      fill="currentColor"
                      strokeWidth={2}
                    />
                  </div>
                  <div className="mt-3 flex items-center gap-2.5 rounded-[14px] bg-[linear-gradient(120deg,#fff6ea,#fdeed7)] p-[11px_14px]">
                    <Bell className="size-[18px] text-gold-ink-2" strokeWidth={2} />
                    <span className="text-[13px] font-semibold text-gold-ink-2">
                      Next Mass{" "}
                      {next ? formatTimeLabel(next.startMin) : "—"} · reminder set
                    </span>
                  </div>
                </button>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
}

function SignInPrompt({ onSignIn }: { onSignIn: () => void }) {
  return (
    <div className="mt-10 flex flex-col items-center px-6 text-center">
      <div className="flex size-16 items-center justify-center rounded-3xl bg-[linear-gradient(160deg,#e7eefb,#cfe0fb)]">
        <Bookmark className="size-7 text-today-text" strokeWidth={1.8} />
      </div>
      <h2 className="mt-4 font-display text-xl font-semibold text-ink">
        Sign in to save churches
      </h2>
      <p className="mt-2 text-sm text-body-3">
        Keep your favourite parishes in one place and get a reminder before every
        Holy Mass.
      </p>
      <button
        onClick={onSignIn}
        className="mt-5 flex h-12 items-center justify-center gap-2 rounded-2xl bg-ink-2 px-6 text-sm font-bold text-white"
      >
        <LogIn className="size-4" />
        Sign in
      </button>
    </div>
  );
}

function EmptyState() {
  return (
    <div className="mt-10 flex flex-col items-center px-6 text-center">
      <div className="flex size-16 items-center justify-center rounded-3xl bg-surface-alt">
        <Bookmark className="size-7 text-muted-1" strokeWidth={1.8} />
      </div>
      <h2 className="mt-4 font-display text-xl font-semibold text-ink">
        No saved churches yet
      </h2>
      <p className="mt-2 text-sm text-body-3">
        Tap the bookmark on any church to save it here and set Mass reminders.
      </p>
    </div>
  );
}
