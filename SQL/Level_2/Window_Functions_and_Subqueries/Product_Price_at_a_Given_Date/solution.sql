WITH LatestPrices AS (SELECT product_id,
                             new_price AS price,
                             ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rnk
                      FROM Products
                      WHERE change_date <= '2019-08-16')
SELECT product_id, price
FROM LatestPrices
WHERE rnk = 1

UNION ALL

SELECT DISTINCT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';
