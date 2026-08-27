-- WITH Ranked_Orders AS (SELECT customer_number,
--                               DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk_number
--                        FROM Orders
--                        GROUP BY customer_number)
-- SELECT customer_number
-- FROM Ranked_Orders
-- WHERE rnk_number = 1;

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC LIMIT 1;
