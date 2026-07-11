SELECT e.first_name, e.last_name, e.hire_date, e.termination_date
FROM uber_employees e
         LEFT JOIN uber_annual_review ar ON ar.emp_id = e.id
WHERE ar.emp_id IS NULL
ORDER BY e.hire_date DESC;
