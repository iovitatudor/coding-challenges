SELECT id,
       name,
       sex,
       age,
       height,
       weight,
       team,
       noc,
       games,
       season,
       city,
       sport,
       event,
       medal
FROM olympics_athletes_events
WHERE age > 40
  AND (medal ILIKE '%bronze%' OR medal ILIKE '%silver%');
