SELECT COUNT(*) AS number_of_employees
FROM worker
WHERE EXTRACT(MONTH FROM joining_date) >= 4
  AND LOWER(department) = 'admin';
