SELECT *
FROM movie_catalogue
ORDER BY CAST(REGEXP_REPLACE(duration, '\D', '', 'g') AS INTEGER) DESC;
