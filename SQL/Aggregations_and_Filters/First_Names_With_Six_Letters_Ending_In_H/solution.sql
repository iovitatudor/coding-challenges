-- SELECT *
-- FROM worker
-- WHERE first_name ~* '^.{5}h$';

SELECT *
FROM worker
WHERE LENGTH(first_name) = 6
  AND first_name LIKE '%h';
