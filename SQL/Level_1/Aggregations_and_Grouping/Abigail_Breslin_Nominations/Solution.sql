SELECT COUNT(DISTINCT movie) AS number_of_movies
FROM oscar_nominees
WHERE TRIM(nominee) ILIKE 'Abigail Breslin';
