SELECT department  AS name,
       COUNT(*)    AS headcount,
       SUM(salary) AS total_payroll,
       AVG(salary) AS avg_salary
FROM techcorp_workforce
WHERE EXTRACT(YEAR FROM joining_date) >= 2020
GROUP BY department
HAVING COUNT(*) >= 5;
