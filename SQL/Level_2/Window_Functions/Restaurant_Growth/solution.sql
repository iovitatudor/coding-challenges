WITH Daily_Sales AS (SELECT visited_on,
                            SUM(amount) AS daily_amount
                     FROM Customer
                     GROUP BY visited_on),
     Rolling_Metrics AS (SELECT visited_on,
                                SUM(daily_amount)  OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount, ROUND(
                 AVG(daily_amount) OVER (
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ),
                 2
                     ) AS average_amount,
                                LAG(visited_on, 6) OVER (ORDER BY visited_on) AS window_start
                         FROM Daily_Sales)
SELECT visited_on,
       amount,
       average_amount
FROM Rolling_Metrics
WHERE window_start IS NOT NULL
ORDER BY visited_on ASC;
