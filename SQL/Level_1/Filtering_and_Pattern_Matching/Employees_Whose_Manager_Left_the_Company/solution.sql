SELECT tb1.employee_id
FROM Employees AS tb1
         LEFT JOIN Employees AS tb2
                   ON tb1.manager_id = tb2.employee_id
WHERE tb1.salary < 30000
  AND tb1.manager_id IS NOT NULL
  AND tb2.employee_id IS NULL
ORDER BY tb1.employee_id ASC;
