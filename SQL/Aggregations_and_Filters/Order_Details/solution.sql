SELECT o.order_date, o.order_details, o.total_order_cost, c.first_name
FROM customers c
         INNER JOIN orders o ON c.id = o.cust_id
WHERE c.first_name IN ('Jill', 'Eva')
ORDER BY c.id ASC;
