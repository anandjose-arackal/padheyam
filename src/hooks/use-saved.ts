"use client";

import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { useAuth } from "@/lib/auth-context";
import type { SavedDTO } from "@/lib/types";

const SAVED_KEY = ["saved"];

/** The current user's saved churches (empty when signed out). */
export function useSavedChurches() {
  const { user } = useAuth();
  return useQuery({
    queryKey: SAVED_KEY,
    enabled: !!user,
    queryFn: async (): Promise<SavedDTO[]> => {
      const res = await fetch("/api/saved");
      if (res.status === 401) return [];
      if (!res.ok) throw new Error("Failed to load saved churches");
      const data = (await res.json()) as { saved: SavedDTO[] };
      return data.saved;
    },
  });
}

/** Convenience: is a given church saved? */
export function useIsSaved(churchId: string) {
  const { data } = useSavedChurches();
  return !!data?.some((s) => s.churchId === churchId);
}

/** Toggle a church's saved state with optimistic update. */
export function useToggleSave() {
  const qc = useQueryClient();

  return useMutation({
    mutationFn: async ({
      churchId,
      saved,
    }: {
      churchId: string;
      /** Current saved state — we toggle to the opposite. */
      saved: boolean;
    }) => {
      if (saved) {
        const res = await fetch(`/api/saved/${churchId}`, { method: "DELETE" });
        if (!res.ok) throw new Error("Failed to remove");
      } else {
        const res = await fetch("/api/saved", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ churchId }),
        });
        if (!res.ok) throw new Error("Failed to save");
      }
    },
    onMutate: async ({ churchId, saved }) => {
      await qc.cancelQueries({ queryKey: SAVED_KEY });
      const prev = qc.getQueryData<SavedDTO[]>(SAVED_KEY) ?? [];
      const next = saved
        ? prev.filter((s) => s.churchId !== churchId)
        : [...prev, { churchId, reminder: true }];
      qc.setQueryData(SAVED_KEY, next);
      return { prev };
    },
    onError: (_err, _vars, ctx) => {
      if (ctx?.prev) qc.setQueryData(SAVED_KEY, ctx.prev);
    },
    onSettled: () => {
      qc.invalidateQueries({ queryKey: SAVED_KEY });
    },
  });
}
