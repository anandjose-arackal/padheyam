-- Test data: even more Wayanad churches, covering additional localities not
-- yet in scripts/seed.ts or the earlier Wayanad migration (Kaniyambetta,
-- Padinjarathara, Thariode, Pozhuthana, Nadavayal, Thirunelly, Noolpuzha,
-- Kottathara, Vellamunda, Thondernad, Mullankolli, Cheeral).
-- Run in the Supabase Dashboard → SQL Editor (after supabase/schema.sql).

do $$
declare
  church_id uuid;
begin
  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Joseph Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kaniyambetta, Wayanad', 11.6500, 76.0450, '+91 4936 210 221',
    'A Syro-Malabar parish in Kaniyambetta serving a farming community, with an early-morning Qurbana popular with dairy farmers.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 330, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 1020, 'Malayalam', 'Evening Qurbana'),
    (church_id, 4, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Christ the King Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Padinjarathara, Wayanad', 11.7200, 76.1700, '+91 4936 211 458',
    'A Latin parish in Padinjarathara at the edge of the Muthanga forest range, with a well-known May-month Marian procession.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 570, 'English', 'Holy Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Sebastian''s Orthodox Church', 'Wayanad Malankara Parish', 'MALANKARA',
    'Thariode, Wayanad', 11.6600, 76.1100, '+91 4936 212 673',
    'A Malankara congregation in Thariode with a modest Sunday Holy Qurbana and a growing youth choir.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 390, 'Malayalam', 'Holy Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Our Lady of Fatima Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Pozhuthana, Wayanad', 11.5900, 76.1450, '+91 4936 213 890',
    'A Latin parish in Pozhuthana on the banks of the Kabini river, with a lively Fatima-feast procession every May 13th.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 600, 'English', 'Holy Mass'),
    (church_id, 5, 1080, 'Malayalam', 'Evening Novena');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Mary''s Forane Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Nadavayal, Wayanad', 11.7500, 76.1000, '+91 4935 250 112',
    'One of the older forane churches in northern Wayanad, in Nadavayal, with a large feast celebration each January.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 345, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 495, 'English', 'Holy Qurbana'),
    (church_id, 0, 1035, 'Malayalam', 'Evening Qurbana'),
    (church_id, 2, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Thirunelly, Wayanad', 11.9350, 76.0200, '+91 4935 260 445',
    'A remote Syro-Malabar parish near the Thirunelly temple town, close to the Kerala-Karnataka border, with a Sunday-only Qurbana.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 375, 'Malayalam', 'Holy Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Antony''s Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Noolpuzha, Wayanad', 11.6350, 76.4100, '+91 4936 214 227',
    'A Latin parish in Noolpuzha near the Muthanga Wildlife Sanctuary, serving a small forest-fringe farming community.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 2, 1080, 'Malayalam', 'St. Antony Novena');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Holy Trinity Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Kottathara, Wayanad', 11.6950, 76.1350, '+91 4936 215 663',
    'A Syro-Malabar parish in Kottathara with three daily Qurbanas and a dedicated adoration chapel open all day.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 330, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 480, 'English', 'Holy Qurbana'),
    (church_id, 0, 1020, 'Malayalam', 'Evening Qurbana'),
    (church_id, 1, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 5, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. George Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Vellamunda, Wayanad', 11.8650, 76.0850, '+91 4935 265 331',
    'A Latin parish in Vellamunda, northern Wayanad, with an April feast of St. George drawing devotees from nearby villages.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 600, 'English', 'Holy Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Peter''s Orthodox Church', 'Wayanad Malankara Parish', 'MALANKARA',
    'Thondernad, Wayanad', 11.6250, 76.1700, '+91 4936 216 894',
    'A small Malankara parish in Thondernad with a close-knit congregation and a monthly fellowship meal after Sunday Qurbana.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 390, 'Malayalam', 'Holy Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Jude''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Mullankolli, Wayanad', 11.7150, 76.0450, '+91 4935 270 112',
    'A Syro-Malabar parish in Mullankolli with a popular Thursday St. Jude novena for the sick and troubled.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 1080, 'Malayalam', 'St. Jude Novena');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Sacred Heart Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Cheeral, Sulthan Bathery, Wayanad', 11.6450, 76.2400, '+91 4936 217 559',
    'A Latin parish in Cheeral, on the outskirts of Sulthan Bathery, with a small but active parish council and weekly catechism classes.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 1050, 'Malayalam', 'Evening Mass');
end $$;
