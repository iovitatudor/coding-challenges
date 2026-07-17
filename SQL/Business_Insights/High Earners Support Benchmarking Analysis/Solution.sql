SELECT first_name, last_name, department, salary
FROM techcorp_workforce
WHERE department IN ('HR', 'Admin')
  AND salary > 80000;
