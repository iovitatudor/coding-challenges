SELECT p.product_name,
       SUM(o.unit) AS unit
FROM Products AS p
         JOIN Orders AS o
              ON o.product_id = p.product_id
                  AND order_date >= '2020-02-01' AND order_date < '2020-03-01'
GROUP BY product_name
HAVING SUM(unit) >= 100
