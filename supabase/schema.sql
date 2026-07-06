-- Mass Tracker — Supabase schema.
-- Run this once in the Supabase Dashboard → SQL Editor, then `npm run db:seed`.

-- ── Enums ──
do $$
begin
  if not exists (select 1 from pg_type where typname = 'rite') then
    create type rite as enum ('SYRO_MALABAR', 'LATIN', 'MALANKARA');
  end if;
end$$;

-- ── Tables ──
create table if not exists public.churches (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  diocese     text not null,
  rite        rite not null,
  address     text not null,
  latitude    double precision not null,
  longitude   double precision not null,
  phone       text,
  image_url   text,
  description text,
  created_at  timestamptz not null default now()
);
create index if not exists churches_lat_lng_idx on public.churches (latitude, longitude);

create table if not exists public.mass_schedules (
  id          uuid primary key default gen_random_uuid(),
  church_id   uuid not null references public.churches (id) on delete cascade,
  day_of_week int not null check (day_of_week between 0 and 6), -- 0 = Sunday
  start_min   int not null check (start_min between 0 and 1439), -- minutes from midnight
  language    text not null,
  label       text
);
create index if not exists mass_schedules_church_day_idx
  on public.mass_schedules (church_id, day_of_week);

create table if not exists public.saved_churches (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid not null references auth.users (id) on delete cascade,
  church_id  uuid not null references public.churches (id) on delete cascade,
  reminder   boolean not null default true,
  created_at timestamptz not null default now(),
  unique (user_id, church_id)
);
create index if not exists saved_churches_user_idx on public.saved_churches (user_id);

-- ── Row Level Security ──
-- The app's server uses the service-role key (bypasses RLS) and scopes every
-- query by the verified user id. These policies are a backstop for any direct
-- anon/authenticated access.
alter table public.churches       enable row level security;
alter table public.mass_schedules enable row level security;
alter table public.saved_churches enable row level security;

-- Churches & schedules: public read.
drop policy if exists "churches public read" on public.churches;
create policy "churches public read" on public.churches
  for select using (true);

drop policy if exists "mass_schedules public read" on public.mass_schedules;
create policy "mass_schedules public read" on public.mass_schedules
  for select using (true);

-- Saved churches: each user can only see/modify their own rows.
drop policy if exists "saved owner select" on public.saved_churches;
create policy "saved owner select" on public.saved_churches
  for select using (auth.uid() = user_id);

drop policy if exists "saved owner insert" on public.saved_churches;
create policy "saved owner insert" on public.saved_churches
  for insert with check (auth.uid() = user_id);

drop policy if exists "saved owner update" on public.saved_churches;
create policy "saved owner update" on public.saved_churches
  for update using (auth.uid() = user_id);

drop policy if exists "saved owner delete" on public.saved_churches;
create policy "saved owner delete" on public.saved_churches
  for delete using (auth.uid() = user_id);
