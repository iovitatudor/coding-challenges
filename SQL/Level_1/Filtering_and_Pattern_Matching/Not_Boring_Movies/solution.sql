SELECT id,
       movie,
       description,
       rating
FROM Cinema
WHERE description NOT ILIKE '%boring%'
    AND id % 2 = 1
ORDER BY rating DESC;
