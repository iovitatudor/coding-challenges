-- WITH AverageSalaries AS(
--     SELECT department, AVG(salary) AS average_salary
--     FROM employee
--     GROUP BY department
-- )

-- SELECT e.department, e.first_name, e.salary, a.average_salary
-- FROM employee e
-- INNER JOIN AverageSalaries a ON a.department = e.department;

SELECT  department,
        first_name,
        salary,
        AVG(salary) OVER(PARTITION BY department) AS average_salary
FROM employee;
