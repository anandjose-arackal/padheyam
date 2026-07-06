-- Add category to mass_schedules to support Adoration and Confession alongside Mass.
-- Existing rows default to 'mass' so no backfill is required.

alter table public.mass_schedules
  add column if not exists category text not null default 'mass';

alter table public.mass_schedules
  drop constraint if exists mass_schedules_category_check;
alter table public.mass_schedules
  add constraint mass_schedules_category_check
  check (category in ('mass', 'adoration', 'confession'));

-- language is Mass-specific; Adoration/Confession rows may omit it.
alter table public.mass_schedules
  alter column language drop not null;

-- Weekly-schedule queries commonly filter by category too.
create index if not exists mass_schedules_church_day_category_idx
  on public.mass_schedules (church_id, day_of_week, category);
