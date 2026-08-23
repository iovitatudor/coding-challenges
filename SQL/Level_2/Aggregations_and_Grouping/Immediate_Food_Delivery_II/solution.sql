WITH RankedDeliveries AS (SELECT customer_id,
                                 order_date,
                                 customer_pref_delivery_date,
                                 RANK() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS rnk
                          FROM Delivery)
SELECT ROUND(
               AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 100.0 ELSE 0.0 END),
               2
       ) AS immediate_percentage
FROM RankedDeliveries
WHERE rnk = 1;
