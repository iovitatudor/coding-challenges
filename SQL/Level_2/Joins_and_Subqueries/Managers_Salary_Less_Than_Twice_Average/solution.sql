SELECT hierarchy.manager_empl_id AS manager_empl_id,
       managers.salary           AS manager_salary,
       AVG(employee.salary)      AS avg_employee_salary
FROM map_employee_hierarchy hierarchy
         INNER JOIN dim_employee managers ON hierarchy.manager_empl_id = managers.empl_id
         INNER JOIN dim_employee employee ON hierarchy.empl_id = employee.empl_id
GROUP BY hierarchy.manager_empl_id, managers.salary
HAVING managers.salary < 2 * AVG(employee.salary);
