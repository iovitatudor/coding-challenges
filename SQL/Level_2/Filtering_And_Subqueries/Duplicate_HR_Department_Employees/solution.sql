WITH HR_workers AS (SELECT first_name,
                           department
                    FROM worker
                    WHERE department = 'HR')

SELECT *
FROM HR_workers
UNION ALL
SELECT *
FROM HR_workers;
