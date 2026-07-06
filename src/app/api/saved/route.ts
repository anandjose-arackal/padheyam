import { NextResponse } from "next/server";
import { z } from "zod";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { getUserId } from "@/lib/supabase/server";

export const dynamic = "force-dynamic";

/** GET /api/saved — the current user's saved church ids. */
export async function GET() {
  const userId = await getUserId();
  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const { data, error } = await supabaseAdmin()
    .from("saved_churches")
    .select("church_id,reminder")
    .eq("user_id", userId);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  const saved = (data ?? []).map((r) => ({
    churchId: r.church_id as string,
    reminder: r.reminder as boolean,
  }));
  return NextResponse.json({ saved });
}

const bodySchema = z.object({
  churchId: z.string().min(1),
  reminder: z.boolean().optional(),
});

/** POST /api/saved — save a church (idempotent upsert). */
export async function POST(request: Request) {
  const userId = await getUserId();
  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const parsed = bodySchema.safeParse(await request.json().catch(() => null));
  if (!parsed.success) {
    return NextResponse.json({ error: "Invalid body" }, { status: 400 });
  }
  const { churchId, reminder = true } = parsed.data;

  const { data, error } = await supabaseAdmin()
    .from("saved_churches")
    .upsert(
      { user_id: userId, church_id: churchId, reminder },
      { onConflict: "user_id,church_id" },
    )
    .select("church_id,reminder")
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({
    saved: { churchId: data.church_id, reminder: data.reminder },
  });
}
