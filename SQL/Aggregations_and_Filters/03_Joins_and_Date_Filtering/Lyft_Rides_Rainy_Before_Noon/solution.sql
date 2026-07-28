SELECT *
FROM lyft_rides
WHERE weather ILIKE '%rainy%' AND hour < 12;
