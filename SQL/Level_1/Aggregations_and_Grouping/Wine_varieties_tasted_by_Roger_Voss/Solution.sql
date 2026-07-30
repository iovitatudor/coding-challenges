SELECT DISTINCT variety
FROM winemag_p2
WHERE taster_name ILIKE '%Roger Voss%'
    AND region_1 IS NOT NULL
    AND region_1 <> '';
