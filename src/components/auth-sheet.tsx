"use client";

import {
  createContext,
  useCallback,
  useContext,
  useMemo,
  useState,
} from "react";
import { toast } from "sonner";
import { Mail } from "lucide-react";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet";
import { Input } from "@/components/ui/input";
import { ChurchIcon } from "@/components/church-icon";
import { useAuth } from "@/lib/auth-context";

type AuthSheetState = { promptSignIn: () => void };
const Ctx = createContext<AuthSheetState | null>(null);

export function AuthSheetProvider({ children }: { children: React.ReactNode }) {
  const { configured, supabase } = useAuth();
  const [open, setOpen] = useState(false);
  const [email, setEmail] = useState("");
  const [sending, setSending] = useState(false);
  const [sent, setSent] = useState(false);

  const promptSignIn = useCallback(() => setOpen(true), []);

  const sendMagicLink = async () => {
    if (!supabase || !email) return;
    setSending(true);
    const { error } = await supabase.auth.signInWithOtp({
      email,
      options: { emailRedirectTo: `${window.location.origin}/auth/callback` },
    });
    setSending(false);
    if (error) {
      toast.error(error.message);
    } else {
      setSent(true);
    }
  };

  const signInWithGoogle = async () => {
    if (!supabase) return;
    await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: `${window.location.origin}/auth/callback` },
    });
  };

  const value = useMemo(() => ({ promptSignIn }), [promptSignIn]);

  return (
    <Ctx.Provider value={value}>
      {children}
      <Sheet open={open} onOpenChange={setOpen}>
        <SheetContent
          side="bottom"
          className="mx-auto max-w-[430px] rounded-t-3xl border-0 px-6 pb-10"
        >
          <SheetHeader className="items-center text-center">
            <div className="mb-2 flex size-16 items-center justify-center rounded-3xl bg-[linear-gradient(160deg,#f3ddae,#cda35f)]">
              <ChurchIcon className="size-8 text-navy-1" strokeWidth={1.8} />
            </div>
            <SheetTitle className="font-display text-2xl text-ink">
              Sign in to save churches
            </SheetTitle>
            <SheetDescription className="text-body-3">
              Save your favourite parishes and get reminders before each Holy
              Mass.
            </SheetDescription>
          </SheetHeader>

          {!configured ? (
            <p className="rounded-2xl bg-screen px-4 py-3 text-center text-sm text-body-2">
              Authentication isn&apos;t configured yet. Add your Supabase keys to
              <code className="mx-1 rounded bg-surface-alt px-1">.env.local</code>
              to enable sign-in.
            </p>
          ) : sent ? (
            <p className="rounded-2xl bg-now-bg px-4 py-3 text-center text-sm font-medium text-now-text">
              Check your inbox — we sent a magic link to {email}.
            </p>
          ) : (
            <div className="flex flex-col gap-3">
              <Input
                type="email"
                inputMode="email"
                placeholder="you@example.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="h-12 rounded-2xl"
              />
              <button
                onClick={sendMagicLink}
                disabled={sending || !email}
                className="flex h-12 items-center justify-center gap-2 rounded-2xl bg-ink-2 text-sm font-bold text-white disabled:opacity-60"
              >
                <Mail className="size-4" />
                {sending ? "Sending…" : "Email me a magic link"}
              </button>
              <button
                onClick={signInWithGoogle}
                className="flex h-12 items-center justify-center gap-2 rounded-2xl bg-surface-alt text-sm font-bold text-ink-3"
              >
                Continue with Google
              </button>
            </div>
          )}
        </SheetContent>
      </Sheet>
    </Ctx.Provider>
  );
}

export function useAuthSheet() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error("useAuthSheet must be used within AuthSheetProvider");
  return ctx;
}
