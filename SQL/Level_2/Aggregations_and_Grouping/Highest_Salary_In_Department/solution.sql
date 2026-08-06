WITH top_departments AS (SELECT department,
                                MAX(salary) AS salary
                         FROM employee
                         GROUP BY department)
SELECT employee.department,
       employee.first_name,
       top_departments.salary
FROM employee
         INNER JOIN top_departments ON top_departments.department = employee.department
    AND top_departments.salary = employee.salary
