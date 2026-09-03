SELECT managers.employee_id,
       managers.name,
       COUNT(employees.employee_id) AS reports_count,
       ROUND(AVG(employees.age))    AS average_age
FROM Employees AS employees
         JOIN Employees AS managers
              ON employees.reports_to = managers.employee_id
GROUP BY managers.employee_id, managers.name
ORDER BY employee_id;
