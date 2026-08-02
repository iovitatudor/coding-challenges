SELECT 100.00 * (
    SUM(CASE WHEN customers.address IS NOT NULL THEN 1 ELSE 0 END)
    ) / COUNT(*) AS percent_shipable
FROM orders
         LEFT JOIN customers ON orders.cust_id = customers.id;
