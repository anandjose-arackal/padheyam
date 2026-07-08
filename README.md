# Padheyam — Catholic Mass Finder

A mobile-first web app that helps Catholics discover nearby churches and upcoming
Mass, Adoration, and Confession schedules based on their live location. Map-first
home screen with glass cards, color-coded church markers, smart filters, a live
"next Mass" countdown, plus church details and search screens. Fully anonymous —
no accounts, no sign-in, no personal data stored.

## Tech stack

- **Next.js 16** (App Router) + **React 19** + **TypeScript**
- **Tailwind CSS v4** + **shadcn/ui** — fonts: Fraunces (display) + Inter (UI)
- **Supabase** (Postgres) via `@supabase/supabase-js` — no ORM, no connection string, no auth
- **Google Maps** via `@vis.gl/react-google-maps` (falls back to a stylized map with no API key)
- **TanStack Query** (React Query) for data fetching

## Getting started

### 1. Environment

Copy `.env.example` to `.env.local` and fill in:

| Variable | Where to get it |
|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` / `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase → Project Settings → API |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase → Project Settings → API |
| `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY` | (optional) Google Cloud → Maps JavaScript API |
| `NEXT_PUBLIC_GOOGLE_MAPS_MAP_ID` | (optional) Google Cloud → Map Management (for Advanced Markers) |

> Only the three Supabase keys are required — the data layer uses `supabase-js`,
> not a Postgres connection string. The app boots without any keys (gate + map
> render, list empty). Without a Maps key it uses a stylized stand-in map.

### 2. Database

1. In the Supabase Dashboard → **SQL Editor**, paste and run
   [`supabase/schema.sql`](supabase/schema.sql) (creates the tables + RLS policies).
2. Seed the demo data:

   ```bash
   npm run db:seed   # inserts the 5 Wayanad churches + Mass schedules
   ```

### 3. Run

```bash
npm run dev          # http://localhost:3000
```

## Scripts

| Script | Purpose |
|---|---|
| `npm run dev` / `build` / `start` | Next.js dev / production build / serve |
| `npm run lint` | ESLint |
| `npm run db:seed` | Seed demo churches (after running `supabase/schema.sql`) |

## Project structure

```
src/
  app/
    page.tsx                 Home / Map
    search/                  Search screen
    church/[id]/             Church details
    alerts/                  Stub screen
    about/                   App info + privacy note
    api/churches/            Nearby churches + by id
  components/
    map/                     MapView (Google Maps) + stylized FakeMap fallback
    app-frame, bottom-nav, location-gate, church-icon
  lib/
    churches.ts              Server data access via supabase-js (DTO mapping + distance)
    geo.ts                   Haversine distance
    masses.ts                Upcoming-Mass engine (status, countdown, schedules)
    filters.ts               Filter-chip predicates
    status.ts                Mass-status → color design system
    supabase/admin.ts        Service-role client (server-only)
    location-context
  hooks/                     React Query hooks (churches, now)
supabase/
  schema.sql                 Tables + RLS (run once in the SQL editor)
scripts/
  seed.ts                    Seed the 5 Wayanad churches (npm run db:seed)
```

## Design source

Recreated from the high-fidelity prototype in
`design_handoff_mass_tracker/Mass Tracker.dc.html`. Design tokens (colors,
radii, shadows, keyframes) live in `src/app/globals.css`.

## Not yet built (from the product brief)

Notification delivery, Admin dashboard (church CRUD / CSV import /
image upload), and Analytics. The Alerts nav target is stubbed.
