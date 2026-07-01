select ABS(
               (SELECT MAX(salary) FROM db_employee WHERE department_id = 1) -
               (SELECT MAX(salary) FROM db_employee WHERE department_id = 4)
       ) AS salary_difference;
