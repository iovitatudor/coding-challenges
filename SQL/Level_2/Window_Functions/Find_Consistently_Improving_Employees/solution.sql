WITH cte1 AS (SELECT employee_id,
                     review_date,
                     rating,
                     ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS rnk
              FROM performance_reviews),
     cte2 AS (SELECT employee_id,
                     MAX(CASE WHEN rnk = 3 THEN rating END) AS rnk1,
                     MAX(CASE WHEN rnk = 2 THEN rating END) AS rnk2,
                     MAX(CASE WHEN rnk = 1 THEN rating END) AS rnk3
              FROM cte1
              WHERE rnk <= 3
              GROUP BY employee_id
              HAVING COUNT(*) = 3)

SELECT pr.employee_id,
       e.name,
       (pr.rnk3 - pr.rnk1) AS improvement_score
FROM cte2 AS pr
         JOIN employees AS e
              ON pr.employee_id = e.employee_id
WHERE pr.rnk1 < pr.rnk2
  AND pr.rnk2 < pr.rnk3
ORDER BY improvement_score DESC, e.name ASC;
