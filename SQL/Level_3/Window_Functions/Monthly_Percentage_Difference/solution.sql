WITH cte_1 AS (SELECT TO_CHAR(created_at, 'YYYY-MM') AS year_mounth,
                      SUM(value)                     AS mounth_value,
                      LAG(SUM(value), 1, 0)             OVER(ORDER BY TO_CHAR(created_at, 'YYYY-MM') ASC) AS previous_month_value
               FROM sf_transactions
               GROUP BY year_mounth
               ORDER BY year_mounth ASC)

SELECT year_mounth,
       round((mounth_value - previous_month_value):: numeric / previous_month_value * 100, 2) AS revenue_diff_pct
FROM cte_1
WHERE previous_month_value > 0;
