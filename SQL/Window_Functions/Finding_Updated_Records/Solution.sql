WITH RANKED_SALARIES AS (SELECT id,
                                first_name,
                                last_name,
                                salary,
                                department_id,
                                DENSE_RANK() OVER(PARTITION BY id ORDER BY salary DESC) AS rnk
                         FROM ms_employee_salary)
SELECT id, first_name, last_name, salary, department_id
FROM RANKED_SALARIES
WHERE rnk = 1
ORDER BY id ASC;
