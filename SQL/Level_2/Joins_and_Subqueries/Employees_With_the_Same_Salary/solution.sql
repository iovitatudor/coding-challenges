-- SELECT a.worker_id, a.first_name, a.salary
-- FROM worker a
-- INNER JOIN worker b ON a.salary = b.salary
--     AND a.worker_id != b.worker_id
-- ORDER BY a.salary DESC;

SELECT worker_id, first_name, salary
FROM worker
WHERE salary IN (SELECT salary
                 FROM worker
                 GROUP BY salary
                 HAVING COUNT(*) > 1)
ORDER BY salary DESC;
