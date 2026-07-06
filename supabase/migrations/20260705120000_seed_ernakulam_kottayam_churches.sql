-- Test data: churches + mass schedules near Ernakulam and Kottayam.
-- Run in the Supabase Dashboard → SQL Editor (after supabase/schema.sql).

do $$
declare
  church_id uuid;
begin
  -- ── Ernakulam ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Santa Cruz Basilica', 'Archdiocese of Verapoly (Latin)', 'LATIN',
    'Fort Kochi, Ernakulam', 9.9658, 76.2424, '+91 484 221 5259',
    'A minor basilica in Fort Kochi with Portuguese-era origins, known for its ornate ceiling art and daily evening Mass.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Mass'),
    (church_id, 0, 540, 'English', 'Holy Mass'),
    (church_id, 1, 1080, 'English', 'Evening Mass'),
    (church_id, 2, 1080, 'English', 'Evening Mass'),
    (church_id, 3, 1080, 'Malayalam', 'Evening Mass'),
    (church_id, 4, 1080, 'English', 'Evening Mass'),
    (church_id, 5, 1080, 'Malayalam', 'Evening Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. George Orthodox Church', 'Ernakulam Malankara Archdiocese', 'MALANKARA',
    'Elamkulam, Ernakulam', 9.9714, 76.2911, '+91 484 236 1024',
    'A Malankara parish serving Elamkulam with Sunday Holy Qurbana and a well-attended Wednesday evening service.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 375, 'Malayalam', 'Holy Qurbana'),
    (church_id, 0, 540, 'English', 'Holy Qurbana'),
    (church_id, 3, 1050, 'Malayalam', 'Evening Prayer & Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Mary''s Syro-Malabar Church', 'Archdiocese of Ernakulam-Angamaly', 'SYRO_MALABAR',
    'Kadavanthra, Ernakulam', 9.9558, 76.3006, '+91 484 240 5588',
    'A busy urban parish in Kadavanthra offering multiple daily Qurbanas and dedicated youth and family ministries.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 330, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 480, 'English', 'Holy Qurbana'),
    (church_id, 0, 1050, 'Malayalam', 'Evening Qurbana'),
    (church_id, 1, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 2, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 4, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 5, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 6, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Our Lady of Ransom Church', 'Archdiocese of Verapoly (Latin)', 'LATIN',
    'Vallarpadam, Ernakulam', 10.0173, 76.2472, '+91 484 240 1234',
    'A pilgrimage church on Vallarpadam island, famous for its annual feast and popular Saturday evening novena.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 400, 'Malayalam', 'Holy Mass'),
    (church_id, 6, 1080, 'Malayalam', 'Novena & Mass');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Christ the King Church', 'Archdiocese of Ernakulam-Angamaly', 'SYRO_MALABAR',
    'Kaloor, Ernakulam', 10.0021, 76.2953, '+91 484 235 7788',
    'A large parish in Kaloor with an active choir and multiple English-language Masses for working professionals.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 465, 'English', 'Holy Qurbana'),
    (church_id, 0, 1035, 'English', 'Evening Qurbana'),
    (church_id, 1, 1110, 'Malayalam', 'Evening Qurbana'),
    (church_id, 4, 1110, 'Malayalam', 'Evening Qurbana');

  -- ── Kottayam ──

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Mary''s Orthodox Valiapally', 'Kottayam Malankara Diocese', 'MALANKARA',
    'Thirunakkara, Kottayam', 9.5896, 76.5222, '+91 481 256 3111',
    'One of the oldest Malankara churches in Kottayam, with historical Portuguese-cross artifacts and daily evening prayers.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Holy Qurbana'),
    (church_id, 0, 540, 'Malayalam', 'Holy Qurbana'),
    (church_id, 2, 1080, 'Malayalam', 'Evening Prayer'),
    (church_id, 5, 1080, 'Malayalam', 'Evening Prayer');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Thomas Syro-Malabar Cathedral', 'Diocese of Kottayam', 'SYRO_MALABAR',
    'Kottayam Town, Kottayam', 9.5926, 76.5233, '+91 481 256 3428',
    'The cathedral church of the Diocese of Kottayam, offering multiple daily Qurbanas and a perpetual adoration chapel.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 330, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 480, 'English', 'Holy Qurbana'),
    (church_id, 0, 1050, 'Malayalam', 'Evening Qurbana'),
    (church_id, 1, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 2, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 3, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 4, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 5, 375, 'Malayalam', 'Morning Qurbana'),
    (church_id, 6, 375, 'Malayalam', 'Morning Qurbana');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'CSI Christ Church', 'CSI Diocese of Madhya Kerala', 'LATIN',
    'Kottayam Town, Kottayam', 9.5934, 76.5215, '+91 481 256 3025',
    'A Protestant heritage church in the heart of Kottayam town, known for its Sunday choir service and English liturgy.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 450, 'English', 'Sunday Service'),
    (church_id, 0, 600, 'Malayalam', 'Sunday Service');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'St. Joseph''s Church, Changanassery Road', 'Archdiocese of Changanassery', 'SYRO_MALABAR',
    'Nagampadam, Kottayam', 9.5766, 76.5311, '+91 481 256 8890',
    'A neighbourhood parish near Nagampadam with a strong Sunday school and Friday adoration hour.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 375, 'Malayalam', 'Holy Qurbana'),
    (church_id, 0, 540, 'English', 'Holy Qurbana'),
    (church_id, 4, 1020, 'Malayalam', 'Adoration Hour');

  insert into public.churches (name, diocese, rite, address, latitude, longitude, phone, description)
  values (
    'Manarcad St. Mary''s Church', 'Archdiocese of Changanassery', 'SYRO_MALABAR',
    'Manarcad, Kottayam', 9.6394, 76.5536, '+91 481 259 2223',
    'A major Marian pilgrim centre near Kottayam famous for its annual eight-day feast and daily rosary devotions.'
  ) returning id into church_id;
  insert into public.mass_schedules (church_id, day_of_week, start_min, language, label) values
    (church_id, 0, 360, 'Malayalam', 'Morning Qurbana'),
    (church_id, 0, 1020, 'Malayalam', 'Evening Qurbana & Rosary'),
    (church_id, 3, 1020, 'Malayalam', 'Evening Rosary');
end $$;
