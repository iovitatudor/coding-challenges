WITH highest_salaries AS (
    SELECT t.worker_title, w.salary
    FROM worker w
             INNER JOIN title t ON w.worker_id = t.worker_ref_id
)
SELECT worker_title
FROM highest_salaries
WHERE salary = (SELECT MAX(salary) FROM highest_salaries);
