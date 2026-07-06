"use client";

import { LogIn, LogOut, User } from "lucide-react";
import { useAuth } from "@/lib/auth-context";
import { useAuthSheet } from "@/components/auth-sheet";

export default function ProfilePage() {
  const { user, signOut } = useAuth();
  const { promptSignIn } = useAuthSheet();

  return (
    <div className="absolute inset-0 flex animate-[fadeIn_0.3s_ease] flex-col bg-screen">
      <div className="px-[22px] pb-4 pt-[58px]">
        <h1 className="font-display text-[28px] font-semibold text-ink">
          Profile
        </h1>
        <p className="mt-1 text-sm text-muted-1">
          Manage your account and preferences
        </p>
      </div>

      <div className="flex-1 px-[18px] pb-28 pt-2">
        <div className="flex items-center gap-3.5 rounded-[22px] bg-white p-4 shadow-[0_8px_22px_-16px_rgba(30,40,70,0.4)]">
          <div className="flex size-14 items-center justify-center rounded-2xl bg-[linear-gradient(160deg,#e7eefb,#cfe0fb)]">
            <User className="size-7 text-today-text" strokeWidth={1.8} />
          </div>
          <div className="min-w-0 flex-1">
            <div className="truncate font-display text-base font-semibold text-ink">
              {user ? (user.email ?? "Signed in") : "Guest"}
            </div>
            <div className="text-[12.5px] text-body-3">
              {user ? "Synced across devices" : "Sign in to sync your saves"}
            </div>
          </div>
        </div>

        <button
          onClick={user ? () => signOut() : promptSignIn}
          className="mt-3 flex h-12 w-full items-center justify-center gap-2 rounded-2xl bg-ink-2 text-sm font-bold text-white"
        >
          {user ? (
            <>
              <LogOut className="size-4" /> Sign out
            </>
          ) : (
            <>
              <LogIn className="size-4" /> Sign in
            </>
          )}
        </button>
      </div>
    </div>
  );
}
