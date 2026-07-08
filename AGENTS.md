# Padheyam — Agent Guide

Catholic Mass/Adoration/Confession finder. Next.js (App Router) + React + Google Maps + Supabase.

## Role

Act as a senior React/Next.js engineer. Favor small, targeted diffs over rewrites. Match existing patterns in the file you're editing before introducing a new one.

## Stack

- **Next.js 16 (App Router, Turbopack)**, React 19, TypeScript.
- **Styling**: Tailwind CSS v4 (`@theme` tokens in `src/app/globals.css`), no separate `tailwind.config` — tokens/utilities are defined inline via `@theme` / `@utility`. `shadcn` components live in `src/components/ui`.
- **Data fetching**: `@tanstack/react-query` for client-side server-state (see `src/hooks/use-*.ts`). Route handlers under `src/app/api/*` are the only server boundary the client talks to.
- **Maps**: `@vis.gl/react-google-maps`. `src/components/map/map-view.tsx` renders the real map when `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY` is set; `src/components/map/fake-map.tsx` is a CSS/SVG stand-in used when it isn't (keep both working when touching map props/behavior).
- **Database**: Supabase Postgres, accessed via `@supabase/supabase-js` directly (`src/lib/supabase/admin.ts` for server-side/service-role access) — **no Prisma/ORM**. Schema lives in `supabase/schema.sql`; changes go through new files in `supabase/migrations/` (timestamp-prefixed, additive — don't edit past migrations).
- **Validation**: `zod` for parsing external input (API route bodies/query params).
- **Icons**: `lucide-react`, consistent stroke widths per component.

## Conventions

- Client components are marked `"use client"` at the top; keep data-fetching hooks (`use-churches.ts`, `use-now.ts`, etc.) as the boundary between UI and React Query/Supabase.
- Location state flows through `src/lib/location-context.tsx` (`useActiveCoords`, `useActiveLocationLabel`) — don't read geolocation directly in components.
- Mass-time logic (status, countdowns, filters) is centralized in `src/lib/masses.ts`, `src/lib/filters.ts`, `src/lib/status.ts` — extend these rather than duplicating date/time math in components.
- Styling uses inline Tailwind arbitrary values and the custom `glass`/`glass-strong`/`no-scrollbar` utilities defined in `globals.css`, plus themed color tokens (`text-ink`, `text-primary-blue`, `bg-accent-blue`, etc.) rather than raw hex in `className` where a token exists.
- Server secrets (`GOOGLE_MAPS_SERVER_KEY`, `SUPABASE_SERVICE_ROLE_KEY`) are only ever read in route handlers / `server-only` modules, never exposed to client components.

## Before making changes

- Check `package.json` for the actual installed versions (Next 16, React 19) — don't assume older App Router or Pages Router behavior.
- Prefer editing existing hooks/components in `src/lib` and `src/hooks` over adding new ad-hoc state.
- Run `npm run lint` after non-trivial changes.
