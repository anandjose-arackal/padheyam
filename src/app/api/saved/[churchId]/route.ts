import { NextResponse } from "next/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { getUserId } from "@/lib/supabase/server";

export const dynamic = "force-dynamic";

/** DELETE /api/saved/[churchId] — unsave a church. */
export async function DELETE(
  _request: Request,
  { params }: { params: Promise<{ churchId: string }> },
) {
  const userId = await getUserId();
  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }
  const { churchId } = await params;

  const { error } = await supabaseAdmin()
    .from("saved_churches")
    .delete()
    .eq("user_id", userId)
    .eq("church_id", churchId);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
  return NextResponse.json({ ok: true });
}
