-- Test data: more churches across Wayanad (Mananthavady, Kalpetta, Vythiri,
-- Sulthan Bathery, Vazhavatta) on top of the 5 already in scripts/seed.ts.
-- Run in the Supabase Dashboard → SQL Editor (after supabase/schema.sql).

do $$
declare
  church_id uuid;
begin
  -- ── Mananthavady ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Holy Family Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Edavaka, Mananthavady, Wayanad', 11.8503, 76.0201, '+91 4935 245 112',
    'A hillside Latin parish serving the Edavaka estate community near Mananthavady, with a well-attended Sunday evening novena.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 1050, 'English', 'Evening Mass'),
    (church_id, 3, 1080, 'Malayalam', 'Novena');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Sebastian''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Panamaram, Mananthavady, Wayanad', 11.7333, 76.0500, '+91 4935 220 456',
    'A Syro-Malabar parish in Panamaram known for its January feast of St. Sebastian and daily morning Qurbana.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 345, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 495, 'English', 'Holy Qurbana'),
    (church_id, 1, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 2, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 4, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 5, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Thomas Orthodox Church', 'Wayanad Malankara Parish', 'MALANKARA',
    'Mananthavady Town, Wayanad', 11.7950, 75.9950, '+91 4935 240 789',
    'A small Malankara congregation in Mananthavady town offering Sunday Holy Qurbana and a Friday evening prayer meeting.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 390, 'Malayalam', 'Holy Qurbana'),
    (church_id, 5, 1080, 'Malayalam', 'Evening Prayer');

  -- ── Kalpetta ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Thomas Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Muttil, Kalpetta, Wayanad', 11.6414, 76.0980, '+91 4936 202 890',
    'A Syro-Malabar parish in Muttil near Kalpetta with a large Sunday school and multiple weekday Qurbanas.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 345, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 480, 'English', 'Holy Qurbana'),
    (church_id, 0, 1035, 'Malayalam', 'Evening Qurbana'),
    (church_id, 2, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 5, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Infant Jesus Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Chundale, Kalpetta, Wayanad', 11.6350, 76.0700, '+91 4936 204 331',
    'A Latin-rite parish in Chundale with a dedicated children''s Mass on the first Sunday of each month.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 600, 'English', 'Family Mass'),
    (church_id, 4, 1080, 'Malayalam', 'Evening Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. George Orthodox Church', 'Wayanad Malankara Parish', 'MALANKARA',
    'Kalpetta, Wayanad', 11.6100, 76.0900, '+91 4936 205 667',
    'A Malankara parish in Kalpetta town offering Sunday Holy Qurbana and a monthly youth fellowship gathering.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 375, 'Malayalam', 'Holy Qurbana'),
    (church_id, 0, 540, 'English', 'Holy Qurbana');

  -- ── Vythiri ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Vythiri, Wayanad', 11.5666, 76.0977, '+91 4936 255 210',
    'A hill-country Syro-Malabar parish in Vythiri serving plantation workers and estate families with daily Qurbana.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 345, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 1020, 'Malayalam', 'Evening Qurbana'),
    (church_id, 1, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Lourde Matha Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Lakkidi, Vythiri, Wayanad', 11.6115, 76.0550, '+91 4936 256 448',
    'A Latin parish near the scenic Lakkidi viewpoint, popular with travelers passing through the Wayanad ghat road.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 375, 'Malayalam', 'Holy Mass'),
    (church_id, 0, 570, 'English', 'Holy Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Antony''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Meppadi, Vythiri, Wayanad', 11.5480, 76.1350, '+91 4936 257 095',
    'A Syro-Malabar parish in Meppadi with a much-loved Tuesday St. Antony novena drawing visitors from across Wayanad.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 1050, 'Malayalam', 'Evening Qurbana'),
    (church_id, 2, 1080, 'Malayalam', 'St. Antony Novena');

  -- ── Sulthan Bathery ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Mary''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Ambalavayal, Sulthan Bathery, Wayanad', 11.6280, 76.2270, '+91 4936 260 774',
    'A Syro-Malabar parish in Ambalavayal, near the Wayanad Heritage Museum, with a strong daily-Mass attendance.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 345, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 1020, 'Malayalam', 'Evening Qurbana'),
    (church_id, 4, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Holy Cross Church', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Kenichira, Sulthan Bathery, Wayanad', 11.6800, 76.2800, '+91 4936 261 332',
    'A Latin parish in Kenichira on the eastern edge of Wayanad, close to the Karnataka border, with a September feast of the Holy Cross.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 600, 'English', 'Holy Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. George Orthodox Church', 'Wayanad Malankara Parish', 'MALANKARA',
    'Sulthan Bathery, Wayanad', 11.6600, 76.2650, '+91 4936 262 918',
    'A Malankara parish in Sulthan Bathery town with Sunday Holy Qurbana and an active Sunday school.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 375, 'Malayalam', 'Holy Qurbana'),
    (church_id, 0, 540, 'English', 'Holy Qurbana');

  -- ── Vazhavatta ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Joseph''s Church', 'Eparchy of Mananthavady', 'SYRO_MALABAR',
    'Vazhavatta, Wayanad', 11.6300, 76.0650, '+91 4936 208 543',
    'A small parish community in Vazhavatta, a quiet locality near Kalpetta, with a warm Wednesday evening prayer service.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 1080, 'Malayalam', 'Evening Prayer & Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Sacred Heart Chapel', 'Diocese of Mananthavady (Latin)', 'LATIN',
    'Vazhavatta, Wayanad', 11.6320, 76.0680, '+91 4936 209 176',
    'A small roadside chapel in Vazhavatta serving nearby estate families, with a single well-attended Sunday Mass.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 480, 'Malayalam', 'Sunday Mass');
end $$;
