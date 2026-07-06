"use client";

import { toast } from "sonner";
import { useAuth } from "@/lib/auth-context";
import { useAuthSheet } from "@/components/auth-sheet";
import { useIsSaved, useToggleSave } from "@/hooks/use-saved";

/**
 * Save/unsave a church, prompting sign-in when the user is anonymous.
 * Returns the current saved state and a toggle handler.
 */
export function useSaveAction(churchId: string) {
  const { user } = useAuth();
  const { promptSignIn } = useAuthSheet();
  const saved = useIsSaved(churchId);
  const toggle = useToggleSave();

  const onToggle = () => {
    if (!user) {
      promptSignIn();
      return;
    }
    toggle.mutate(
      { churchId, saved },
      {
        onSuccess: () =>
          toast.success(saved ? "Removed from saved" : "Church saved"),
        onError: () => toast.error("Something went wrong"),
      },
    );
  };

  return { saved, onToggle, pending: toggle.isPending };
}
