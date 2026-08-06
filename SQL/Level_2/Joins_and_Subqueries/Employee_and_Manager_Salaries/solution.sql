SELECT e.first_name, e.salary
FROM employee e
         LEFT JOIN employee m
                   ON e.manager_id = m.id
WHERE e.salary > m.salary;
