-- Seed data: Eparchy of Mananthavady parishes (Mass, Adoration, and
-- Confession schedules) crawled from mananthavadydiocese.com, geocoded via
-- Google's Geocoding API. Only parishes with a confident geocode match are
-- included (see geocode-mass-times.js) -- 101 of the crawled
-- parishes met that bar; the rest need manual coordinates before import.
-- Run in the Supabase Dashboard → SQL Editor (after supabase/schema.sql and
-- the 20260706110000_add_schedule_category.sql migration).

do $$
declare
  church_id uuid;
begin
  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Martin De Pores Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Ambalavayal, Kerala 673593, India', 11.6183694, 76.2111642
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Chithragiri, Vaduvanchal, Kerala 673581, India', 11.546889, 76.2261852
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Francis Assisi Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Chulliyode, Sultan Bathery, Kerala 673592, India', 11.5982277, 76.2437671
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kallumukku, Kerala 673592, India', 11.6814506, 76.33767859999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 5, 420, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'confession'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Christ the King Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Karani, Kerala, India', 11.6815843, 76.1116997
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'confession'),
    (church_id, 0, 480, null, null, 'adoration'),
    (church_id, 0, 510, null, null, 'mass'),
    (church_id, 5, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Francis Assisi Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Christ Nagar, 54, Meenangadi, Kerala 673591, India', 11.6592134, 76.1744252
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 3, 450, null, null, 'adoration'),
    (church_id, 1, 450, null, null, 'adoration'),
    (church_id, 6, 450, null, null, 'adoration'),
    (church_id, 2, 450, null, null, 'adoration'),
    (church_id, 5, 450, null, null, 'adoration'),
    (church_id, 4, 450, null, null, 'adoration'),
    (church_id, 0, 510, null, null, 'mass'),
    (church_id, 0, 1140, null, null, 'adoration');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Jude''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Moolankavu, Kerala 673592, India', 11.6728538, 76.2891832
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 405, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'adoration'),
    (church_id, 0, 465, null, null, 'mass'),
    (church_id, 0, 585, null, null, 'mass'),
    (church_id, 5, 960, null, null, 'confession'),
    (church_id, 5, 960, null, null, 'adoration'),
    (church_id, 5, 990, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Assumption of our Lady Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Sultan Bathery, Kerala 673592, India', 11.6629136, 76.2570217
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 370, null, null, 'confession'),
    (church_id, 5, 370, null, null, 'adoration'),
    (church_id, 3, 370, null, null, 'adoration'),
    (church_id, 2, 370, null, null, 'adoration'),
    (church_id, 1, 370, null, null, 'adoration'),
    (church_id, 0, 370, null, null, 'confession'),
    (church_id, 4, 370, null, null, 'adoration'),
    (church_id, 6, 370, null, null, 'adoration'),
    (church_id, 2, 370, null, null, 'confession'),
    (church_id, 3, 370, null, null, 'confession'),
    (church_id, 4, 370, null, null, 'confession'),
    (church_id, 5, 370, null, null, 'confession'),
    (church_id, 6, 370, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass'),
    (church_id, 0, 960, null, null, 'mass'),
    (church_id, 6, 990, null, null, 'mass'),
    (church_id, 5, 990, null, null, 'mass'),
    (church_id, 4, 990, null, null, 'mass'),
    (church_id, 3, 990, null, null, 'mass'),
    (church_id, 2, 990, null, null, 'mass'),
    (church_id, 1, 990, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Thomaattuchaal, Kerala 673581, India', 11.5694794, 76.2196665
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Vadakkanad, Kidanganad, Kerala 673592, India', 11.7284274, 76.2739795
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 405, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Antony Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Vakery, Kerala 673592, India', 11.6978006, 76.21604479999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'WRGM+G39, Adakkathode, Kerala 670674, India', 11.9262921, 75.83273630000001
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'confession'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'VV7Q+VMH, Malayora Hwy, Ambayathode, Kelakam, Kottiyoor, Kerala 670651, India', 11.8646814, 75.889231
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Fathima Matha Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'VRRG+2JW, Mananthavady Bypass Rd, Chungakkunnu Town, Kerala, 670674, India', 11.8901169, 75.82658599999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 345, null, null, 'mass'),
    (church_id, 6, 345, null, null, 'mass'),
    (church_id, 5, 345, null, null, 'mass'),
    (church_id, 4, 345, null, null, 'mass'),
    (church_id, 3, 345, null, null, 'mass'),
    (church_id, 2, 345, null, null, 'mass'),
    (church_id, 1, 345, null, null, 'mass'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass'),
    (church_id, 0, 960, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kelakam, Kerala 670674, India', 11.8944531, 75.8098141
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Peravoor - Kottiyoor Road, Kannur District, VVH2+3VJ, Kottiyoor, Kerala 670651, India', 11.8777057, 75.8521354
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 330, null, null, 'confession'),
    (church_id, 2, 330, null, null, 'confession'),
    (church_id, 1, 330, null, null, 'confession'),
    (church_id, 0, 330, null, null, 'confession'),
    (church_id, 4, 330, null, null, 'confession'),
    (church_id, 5, 330, null, null, 'confession'),
    (church_id, 6, 330, null, null, 'confession'),
    (church_id, 4, 345, null, null, 'mass'),
    (church_id, 6, 345, null, null, 'mass'),
    (church_id, 5, 345, null, null, 'mass'),
    (church_id, 3, 345, null, null, 'mass'),
    (church_id, 2, 345, null, null, 'mass'),
    (church_id, 1, 345, null, null, 'mass'),
    (church_id, 0, 345, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'adoration'),
    (church_id, 2, 390, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'adoration'),
    (church_id, 4, 390, null, null, 'adoration'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 5, 420, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 0, 465, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 0, 960, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastians Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'P2M5+2RR, Kommayad Rd, Porunnanore, Kerala 670645, India', 11.7326036, 76.009528
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Holy Face Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'PX33+F6P, Mananthavady, Kerala 670731, India', 11.7037242, 75.9530915
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 525, null, null, 'mass'),
    (church_id, 5, 990, null, null, 'confession'),
    (church_id, 5, 990, null, null, 'adoration'),
    (church_id, 5, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Q2G2+R8V, Thonichal, Nalloornad, Kerala 670645, India', 11.7771097, 76.00079410000001
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Ozhkkanmoola, Kerala 670731, India', 11.7268847, 75.9688408
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Vilambukandam, Kerala 670721, India', 11.7126773, 76.0377403
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 406, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass'),
    (church_id, 1, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Edavaka Post,Mananthavady, QX86+7M2, Via, Kallody, Kerala 670645, India', 11.7656486, 75.9616341
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 345, null, null, 'adoration'),
    (church_id, 5, 345, null, null, 'adoration'),
    (church_id, 4, 345, null, null, 'adoration'),
    (church_id, 3, 345, null, null, 'adoration'),
    (church_id, 2, 345, null, null, 'adoration'),
    (church_id, 1, 345, null, null, 'adoration'),
    (church_id, 0, 345, null, null, 'adoration'),
    (church_id, 3, 350, null, null, 'confession'),
    (church_id, 0, 350, null, null, 'confession'),
    (church_id, 6, 350, null, null, 'confession'),
    (church_id, 5, 350, null, null, 'confession'),
    (church_id, 4, 350, null, null, 'confession'),
    (church_id, 2, 350, null, null, 'confession'),
    (church_id, 1, 350, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 465, null, null, 'mass'),
    (church_id, 0, 585, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Karimbil, Thondernad, Kerala, India', 11.7741909, 75.8780855
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 555, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Jude''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'St.Jude Church, SH54, Makkiyad, Thondernad, Kerala 670731, India', 11.7425903, 75.8972356
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass'),
    (church_id, 4, 960, null, null, 'confession'),
    (church_id, 4, 990, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Elias Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Niravilpuzha, Kerala 670731, India', 11.743045, 75.8664672
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Chavara Kuriakose Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'XQGJ+HC9, Keezhpally, Aralam, Kerala 670704, India', 11.9764138, 75.7811084
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'adoration'),
    (church_id, 4, 390, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'adoration'),
    (church_id, 2, 390, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 4, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Vanhode, Makkiyad, Kanjirangad, Kerala 670731, India', 11.7601462, 75.90277139999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 580, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Charity, Vythiri, Kunnathidavaka, Kerala 673576, India', 11.5375665, 76.0411627
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '18/539, near Edappetty Juma Masjid, Kalpetta, Kerala 673122, India', 11.6344059, 76.1002615
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'adoration'),
    (church_id, 2, 390, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'adoration'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Vincent Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'J32J+784, Manivayal, Madiyur, Kalpetta, Kerala 673121, India', 11.6006406, 76.0808339
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 5, 330, null, null, 'mass'),
    (church_id, 1, 345, null, null, 'adoration'),
    (church_id, 2, 345, null, null, 'adoration'),
    (church_id, 3, 345, null, null, 'adoration'),
    (church_id, 4, 345, null, null, 'adoration'),
    (church_id, 6, 345, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'mass'),
    (church_id, 5, 360, null, null, 'mass'),
    (church_id, 4, 360, null, null, 'mass'),
    (church_id, 3, 360, null, null, 'mass'),
    (church_id, 2, 360, null, null, 'mass'),
    (church_id, 1, 360, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 510, null, null, 'mass'),
    (church_id, 5, 990, null, null, 'adoration'),
    (church_id, 0, 990, null, null, 'mass'),
    (church_id, 5, 1050, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'M46C+4C6, Varyad - Kolavayal Rd, Muttil North, Kerala 673122, India', 11.6602878, 76.1210167
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 405, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'adoration'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Moses Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Sh 29, opp. Karinthandan Temple, Lakkidi, Vythiri, Kunnathidavaka, Kerala 673576, India', 11.5177752, 76.0204895
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'confession'),
    (church_id, 0, 480, null, null, 'adoration'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Nedumbala, Thrikkaipatta part, Kerala 673577, India', 11.5835749, 76.15228789999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 495, null, null, 'mass'),
    (church_id, 5, 900, null, null, 'adoration');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Olivumala, Kerala, India', 11.5565783, 76.05369569999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Rippon, Muppainad, Kerala 673577, India', 11.5386863, 76.17112829999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 435, null, null, 'adoration'),
    (church_id, 0, 465, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Fathima Matha Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Theneri, Kakkavayal, Muttil South, Kerala 673122, India', 11.6385511, 76.1406925
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'St Sebastian''s Church, Kuzhivayal Rd, PO, Kottathara, Muttil South, Kerala 673122, India', 11.6177932, 76.1638114
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 465, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'confession'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'G2XQ+CR6, NH 766, Vythiri, Kunnathidavaka, Kerala 673576, India', 11.5485478, 76.0395312
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 5, 1020, null, null, 'confession'),
    (church_id, 5, 1020, null, null, 'adoration'),
    (church_id, 5, 1050, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'SH59, Alattil, Kerala 670644, India', 11.8394349, 75.88995179999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Holy Family Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Holy Family Church Rd, Boys Town, Kerala 670644, India', 11.8410647, 75.9196849
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'confession'),
    (church_id, 0, 435, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Infant Jesus Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Karimani Road, Thavinhal, Kerala 670644, India', 11.8182869, 75.94145329999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 4, 330, null, null, 'confession'),
    (church_id, 5, 330, null, null, 'confession'),
    (church_id, 1, 330, null, null, 'confession'),
    (church_id, 6, 330, null, null, 'confession'),
    (church_id, 3, 330, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Xavier Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kuttimoola, Kerala 670645, India', 11.8326956, 75.9913141
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 0, 645, null, null, 'confession');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Peter & Paul Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Mananthavady, Kerala 670645, India', 11.8029358, 76.00385539999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 1, 435, null, null, 'adoration'),
    (church_id, 2, 435, null, null, 'adoration'),
    (church_id, 3, 435, null, null, 'adoration'),
    (church_id, 4, 435, null, null, 'adoration'),
    (church_id, 5, 435, null, null, 'adoration'),
    (church_id, 6, 435, null, null, 'adoration'),
    (church_id, 0, 540, null, null, 'mass'),
    (church_id, 5, 570, null, null, 'confession'),
    (church_id, 1, 990, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Little Flower Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'QWXR+XG3, Thavinhal, Kerala 670644, India', 11.7998979, 75.9413057
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 6, 385, null, null, 'mass'),
    (church_id, 5, 385, null, null, 'mass'),
    (church_id, 4, 385, null, null, 'mass'),
    (church_id, 3, 385, null, null, 'mass'),
    (church_id, 2, 385, null, null, 'mass'),
    (church_id, 1, 385, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 555, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kaattimoola Rd, Porur, Valat, Kerala 670644, India', 11.802176, 75.92623739999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Our Lady of Mt. Carmel Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Thavinhal, Kerala, India', 11.84881, 75.95213
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Thavinhal, Kerala, India', 11.84881, 75.95213
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church Valad', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'QVXP+5GP, Peria Korome Rd, Valat, Kerala 670644, India', 11.7979682, 75.8863161
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 400, null, null, 'confession'),
    (church_id, 1, 400, null, null, 'adoration'),
    (church_id, 2, 400, null, null, 'adoration'),
    (church_id, 3, 400, null, null, 'adoration'),
    (church_id, 4, 400, null, null, 'adoration'),
    (church_id, 5, 400, null, null, 'adoration'),
    (church_id, 6, 400, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'confession'),
    (church_id, 5, 405, null, null, 'confession'),
    (church_id, 4, 405, null, null, 'confession'),
    (church_id, 3, 405, null, null, 'confession'),
    (church_id, 2, 405, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 5, 420, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Christ the King Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '98CJ+76F, Manimooly, Kerala 679333, India', 11.3706822, 76.33055089999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 330, null, null, 'adoration'),
    (church_id, 6, 340, null, null, 'adoration'),
    (church_id, 5, 340, null, null, 'adoration'),
    (church_id, 4, 340, null, null, 'adoration'),
    (church_id, 3, 340, null, null, 'adoration'),
    (church_id, 2, 340, null, null, 'adoration'),
    (church_id, 1, 340, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 630, null, null, 'mass'),
    (church_id, 0, 960, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '98RC+F22, Mamankara Road, Palad, Kerala 679333, India', 11.3911273, 76.32001389999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Malappuram Dist, 8856+C3H, Palankara Rd, Nilambur, Kerala 679330, India', 11.3085599, 76.3102305
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 5, 1020, null, null, 'adoration');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '98J2+XG6, Kerala 679331, India', 11.3824242, 76.3012613
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Pathiripadam, Kerala, India', 11.3674901, 76.2739795
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 6, 420, null, null, 'confession'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass'),
    (church_id, 5, 1080, null, null, 'adoration');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Irulam, Kerala, India', 11.7505225, 76.1991529
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 690, null, null, 'mass'),
    (church_id, 0, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Marys Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'St.Mary''s Church Kabanigiri, Kabinigiri (PO), Kabinigiri, Marakkadavu - Pullappally Rd, Kabanigiri, Padichira, Kerala 673579, India', 11.8547087, 76.18027579999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Q4PW+H45, Nadavayal - Pulpally Rd, Veliyambam, Pulpally, Kerala 673579, India', 11.7863981, 76.1453605
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Marakkadavu, Padichira, Kerala 673579, India', 11.8630234, 76.18127199999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass'),
    (church_id, 5, 990, null, null, 'adoration'),
    (church_id, 5, 990, null, null, 'confession'),
    (church_id, 5, 1050, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary'' s Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R596+RXX, Mullenkolly, Kerala 673579, India', 11.819602, 76.1624908
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 330, null, null, 'confession'),
    (church_id, 5, 330, null, null, 'confession'),
    (church_id, 4, 330, null, null, 'confession'),
    (church_id, 2, 330, null, null, 'confession'),
    (church_id, 3, 330, null, null, 'confession'),
    (church_id, 6, 330, null, null, 'adoration'),
    (church_id, 5, 330, null, null, 'adoration'),
    (church_id, 4, 330, null, null, 'adoration'),
    (church_id, 3, 330, null, null, 'adoration'),
    (church_id, 2, 330, null, null, 'adoration'),
    (church_id, 1, 330, null, null, 'adoration'),
    (church_id, 0, 330, null, null, 'adoration'),
    (church_id, 1, 330, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'mass'),
    (church_id, 5, 360, null, null, 'mass'),
    (church_id, 4, 360, null, null, 'mass'),
    (church_id, 3, 360, null, null, 'mass'),
    (church_id, 2, 360, null, null, 'mass'),
    (church_id, 1, 360, null, null, 'mass'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 5, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 0, 465, null, null, 'mass'),
    (church_id, 0, 585, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R5PH+G3R, Marakkadavu - Pullappally Rd, Padichira, Kerala 673579, India', 11.8363697, 76.1776345
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Sacred Heart Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R47P+P52, Sultan Bathery, Kerala 673579, India', 11.8142722, 76.1353867
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 0, null, null, 'mass'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Seethamount, Kerala 673579, India', 11.8404326, 76.2030061
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Infant Jesus Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R58W+JQ7, Kerala 673579, India', 11.8165285, 76.1969179
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 1, 435, null, null, 'confession'),
    (church_id, 2, 435, null, null, 'confession'),
    (church_id, 3, 435, null, null, 'confession'),
    (church_id, 4, 435, null, null, 'confession'),
    (church_id, 5, 435, null, null, 'confession'),
    (church_id, 6, 435, null, null, 'confession'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Arinchermala, Wayanad, Kerala, India', 11.7070906, 76.0652985
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 370, null, null, 'adoration'),
    (church_id, 5, 370, null, null, 'adoration'),
    (church_id, 4, 370, null, null, 'adoration'),
    (church_id, 3, 370, null, null, 'adoration'),
    (church_id, 2, 370, null, null, 'adoration'),
    (church_id, 1, 370, null, null, 'confession'),
    (church_id, 2, 370, null, null, 'confession'),
    (church_id, 3, 370, null, null, 'confession'),
    (church_id, 4, 370, null, null, 'confession'),
    (church_id, 5, 370, null, null, 'confession'),
    (church_id, 6, 370, null, null, 'confession'),
    (church_id, 1, 370, null, null, 'adoration'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 630, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Cherukattoor, Kerala 670721, India', 11.7721995, 76.06094759999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 555, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'M2QX+7GQ, Pallikkunnu Eachome Rd, Pallikkunnu, Wayanad, Kerala 670721, India', 11.6882211, 76.0488532
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'confession'),
    (church_id, 0, 480, null, null, 'adoration'),
    (church_id, 0, 510, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kalluvayal, Kerala 670703, India', 12.0134639, 75.6491753
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 460, null, null, 'mass'),
    (church_id, 0, 585, null, null, 'mass'),
    (church_id, 5, 990, null, null, 'adoration');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kaniyambetta, Kerala, India', 11.7005871, 76.1041436
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'adoration');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kenichira, Kerala 673596, India', 11.7251237, 76.1493891
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'mass'),
    (church_id, 2, 360, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 415, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass'),
    (church_id, 0, 640, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Jude''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kurumbalakotta, Wayanad, Kerala 670721, India', 11.6968112, 76.0344142
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'HOLY CROSS MAJOR ARCHIEPISCOPAL PILGRIM CENTRE', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Nadavayal, Kerala 670721, India', 11.7395833, 76.12072940000002
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 330, null, null, 'confession'),
    (church_id, 4, 330, null, null, 'adoration'),
    (church_id, 3, 330, null, null, 'adoration'),
    (church_id, 2, 330, null, null, 'adoration'),
    (church_id, 1, 330, null, null, 'adoration'),
    (church_id, 0, 330, null, null, 'adoration'),
    (church_id, 6, 330, null, null, 'confession'),
    (church_id, 5, 330, null, null, 'confession'),
    (church_id, 4, 330, null, null, 'confession'),
    (church_id, 2, 330, null, null, 'confession'),
    (church_id, 1, 330, null, null, 'confession'),
    (church_id, 0, 330, null, null, 'confession'),
    (church_id, 6, 330, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'mass'),
    (church_id, 1, 360, null, null, 'mass'),
    (church_id, 2, 360, null, null, 'mass'),
    (church_id, 3, 360, null, null, 'mass'),
    (church_id, 5, 360, null, null, 'mass'),
    (church_id, 6, 360, null, null, 'mass'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 0, 465, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 1, 690, null, null, 'mass'),
    (church_id, 2, 690, null, null, 'mass'),
    (church_id, 1, 720, null, null, 'mass'),
    (church_id, 0, 990, null, null, 'mass'),
    (church_id, 5, 1110, null, null, 'adoration'),
    (church_id, 0, 1410, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Jude''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'P3MF+84Q, Panamaram, Kerala 670721, India', 11.7333423, 76.0728706
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 1, 960, null, null, 'confession'),
    (church_id, 1, 960, null, null, 'adoration'),
    (church_id, 1, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Paralikunnu, Kerala 673124, India', 11.6711228, 76.0895886
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Valavayal, Kerala 673596, India', 11.7081465, 76.1877021
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mother Theresa church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Q352+QC3, Wayanad, Kerala 670721, India', 11.7593951, 76.05104709999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 0, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 0, 525, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Holy Family Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '68GF+72F, State Highway 70, Chokkad, Kerala 679332, India', 11.2256825, 76.3225483
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '858X+4MG, Kerala 679329, India', 11.3153243, 76.1991978
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 600, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Moolepadam, Kerala, India', 11.3298614, 76.18127199999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 3, 990, null, null, 'confession'),
    (church_id, 3, 990, null, null, 'adoration'),
    (church_id, 3, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Little Flower Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '76JM+F7F, SH28, Janathapadi Padikunnu, Nilambur, Kozhikode, Kerala 679329, India', 11.2811923, 76.2331683
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'mass'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 0, 660, null, null, 'adoration'),
    (church_id, 0, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Pookkottumpadam, Kerala, India', 11.2440753, 76.3000419
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 374, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 6, 1125, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'St.George Catholic Church, Poolappadam School Rd, Poolappadam, Kerala 679334, India', 11.3911135, 76.2361459
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 460, null, null, 'confession'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '69QG+328, Amarambalam, Kerala 679332, India', 11.2376586, 76.37508179999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 450, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass'),
    (church_id, 6, 1020, null, null, 'confession'),
    (church_id, 6, 1050, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Thelpara, Kerala 679332, India', 11.2536503, 76.3496188
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Francis of Assisi Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    '7652+F6P, SH28, Vadapuram, Mampad, Kerala 676542, India', 11.2587132, 76.2005721
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 495, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'FATHIMA MATHA CHURCH KAYYUNNI', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'H725+8P3, Sulthan Bathery - Chulliyode - Pandalur - Gudalur Rd, Kayyunni, Erumad, Tamil Nadu 643205, India', 11.5507689, 76.25929959999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 6, 425, null, null, 'mass'),
    (church_id, 5, 425, null, null, 'mass'),
    (church_id, 4, 425, null, null, 'mass'),
    (church_id, 3, 425, null, null, 'mass'),
    (church_id, 2, 425, null, null, 'mass'),
    (church_id, 1, 425, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'W26P+37Q, Appapara, Kerala 670646, India', 11.9102171, 76.0357231
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 510, null, null, 'confession'),
    (church_id, 0, 510, null, null, 'adoration'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Q2WG+P84, Mananthavady, Kerala 670645, India', 11.7967637, 76.02584259999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 435, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Joseph''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Bavali, Kerala, India', 11.8520258, 76.1138744
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 480, null, null, 'confession'),
    (church_id, 0, 480, null, null, 'adoration'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Chavara Kuriakose Elias Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'QX4H+89Q, Puthiyidamkunnu, Edavaka, Kerala 670645, India', 11.7558386, 75.97848669999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'adoration'),
    (church_id, 4, 390, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'adoration'),
    (church_id, 2, 390, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 5, 420, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'adoration'),
    (church_id, 0, 480, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Little Flower Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Koyileri Rd, Kammana, Q2JH+CRC, Nalloornad, Kerala 670645, India', 11.7810598, 76.0295249
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Martin De Porres Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Ondayangadi, Mananthavady, Kerala, India', 11.8231649, 76.0232338
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 345, null, null, 'adoration'),
    (church_id, 5, 345, null, null, 'adoration'),
    (church_id, 4, 345, null, null, 'adoration'),
    (church_id, 3, 345, null, null, 'adoration'),
    (church_id, 2, 345, null, null, 'adoration'),
    (church_id, 1, 345, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 0, 525, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Alphonsa Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R3CH+62W, Kuruva Dweep Rd, Kerala 670646, India', 11.820624, 76.0775891
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 345, null, null, 'adoration'),
    (church_id, 5, 345, null, null, 'adoration'),
    (church_id, 4, 345, null, null, 'adoration'),
    (church_id, 3, 345, null, null, 'adoration'),
    (church_id, 2, 345, null, null, 'adoration'),
    (church_id, 1, 345, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Catherine''s Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R364+H27, Kuruva Dweep Rd, Arattuthara, Payyampally, Kerala 670646, India', 11.8114146, 76.0550331
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 365, null, null, 'adoration'),
    (church_id, 5, 365, null, null, 'adoration'),
    (church_id, 4, 365, null, null, 'adoration'),
    (church_id, 3, 365, null, null, 'adoration'),
    (church_id, 2, 365, null, null, 'adoration'),
    (church_id, 1, 365, null, null, 'adoration'),
    (church_id, 0, 375, null, null, 'adoration'),
    (church_id, 6, 400, null, null, 'mass'),
    (church_id, 5, 400, null, null, 'mass'),
    (church_id, 4, 400, null, null, 'mass'),
    (church_id, 3, 400, null, null, 'mass'),
    (church_id, 2, 400, null, null, 'mass'),
    (church_id, 1, 400, null, null, 'mass'),
    (church_id, 0, 405, null, null, 'mass'),
    (church_id, 0, 570, null, null, 'mass'),
    (church_id, 0, 1020, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'R2XG+8Q8, Thrissilery Rd, Kerala 670646, India', 11.8482831, 76.02694629999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'adoration'),
    (church_id, 0, 420, null, null, 'confession'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 585, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'ST SEBASTIAN CHURCH', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'MX3X+3H8, SH54, Chennalode, Thariyode, Kerala 673575, India', 11.6526685, 75.9989547
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 0, 345, null, null, 'adoration'),
    (church_id, 1, 345, null, null, 'adoration'),
    (church_id, 2, 345, null, null, 'adoration'),
    (church_id, 3, 345, null, null, 'adoration'),
    (church_id, 4, 345, null, null, 'adoration'),
    (church_id, 5, 345, null, null, 'adoration'),
    (church_id, 6, 345, null, null, 'adoration'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 540, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'M2V8+J58, Kurumani Rd, Mananthavady, Kerala 670645, India', 11.6940425, 76.0154433
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'adoration'),
    (church_id, 5, 375, null, null, 'adoration'),
    (church_id, 4, 375, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'adoration'),
    (church_id, 2, 375, null, null, 'adoration'),
    (church_id, 1, 375, null, null, 'adoration'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'mass'),
    (church_id, 0, 690, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'Christ the king church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Puthussery Kadav, Kerala 670645, India', 11.7037354, 75.98364699999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Thariyode, Kerala 673575, India', 11.6291676, 75.9903846
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 0, 360, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Mary''s Church Marutha', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Marutha, Kerala 679333, India', 11.4211713, 76.32465169999999
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 390, null, null, 'confession'),
    (church_id, 6, 390, null, null, 'adoration'),
    (church_id, 5, 390, null, null, 'adoration'),
    (church_id, 4, 390, null, null, 'adoration'),
    (church_id, 3, 390, null, null, 'adoration'),
    (church_id, 2, 390, null, null, 'adoration'),
    (church_id, 1, 390, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'confession'),
    (church_id, 5, 390, null, null, 'confession'),
    (church_id, 4, 390, null, null, 'confession'),
    (church_id, 2, 390, null, null, 'confession'),
    (church_id, 1, 390, null, null, 'confession'),
    (church_id, 5, 420, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 6, 420, null, null, 'mass'),
    (church_id, 0, 465, null, null, 'confession'),
    (church_id, 0, 480, null, null, 'adoration'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St Alphonsa Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Muttiyel, Adyanpara Rd, Nilambur, Kerala 679334, India', 11.3525351, 76.215969
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 3, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 4, 375, null, null, 'confession'),
    (church_id, 2, 375, null, null, 'confession'),
    (church_id, 1, 375, null, null, 'confession'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 4, 405, null, null, 'mass'),
    (church_id, 3, 405, null, null, 'mass'),
    (church_id, 2, 405, null, null, 'mass'),
    (church_id, 1, 405, null, null, 'mass'),
    (church_id, 0, 480, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. Sebastian church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'G523+QXH, Chooralmala, Kerala 673577, India', 11.5019364, 76.1549802
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 3, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'confession'),
    (church_id, 4, 360, null, null, 'confession'),
    (church_id, 3, 360, null, null, 'confession'),
    (church_id, 2, 360, null, null, 'confession'),
    (church_id, 1, 360, null, null, 'confession'),
    (church_id, 5, 360, null, null, 'adoration'),
    (church_id, 6, 360, null, null, 'adoration'),
    (church_id, 4, 360, null, null, 'adoration'),
    (church_id, 2, 360, null, null, 'adoration'),
    (church_id, 1, 360, null, null, 'adoration'),
    (church_id, 6, 390, null, null, 'mass'),
    (church_id, 5, 390, null, null, 'mass'),
    (church_id, 4, 390, null, null, 'mass'),
    (church_id, 3, 390, null, null, 'mass'),
    (church_id, 2, 390, null, null, 'mass'),
    (church_id, 1, 390, null, null, 'mass'),
    (church_id, 0, 510, null, null, 'mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude)
  values (
    'St. George Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Edavaka Post,Mananthavady, QX86+7M2, Via, Kallody, Kerala 670645, India', 11.7656486, 75.9616341
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label, category) values
    (church_id, 5, 375, null, null, 'confession'),
    (church_id, 6, 375, null, null, 'confession'),
    (church_id, 0, 390, null, null, 'adoration'),
    (church_id, 5, 405, null, null, 'mass'),
    (church_id, 6, 405, null, null, 'mass'),
    (church_id, 0, 420, null, null, 'mass'),
    (church_id, 1, 420, null, null, 'mass'),
    (church_id, 2, 420, null, null, 'mass'),
    (church_id, 3, 420, null, null, 'mass'),
    (church_id, 4, 420, null, null, 'mass'),
    (church_id, 0, 450, null, null, 'confession'),
    (church_id, 0, 540, null, null, 'mass');
end $$;
