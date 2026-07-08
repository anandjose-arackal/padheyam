-- Remove the saved_churches feature entirely: the app no longer supports
-- authentication or per-user saved/bookmarked churches. RLS policies on
-- this table are dropped automatically by Postgres when the table itself
-- is dropped, so no explicit `drop policy` statements are needed.
drop table if exists public.saved_churches cascade;
