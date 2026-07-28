SELECT service_name, status_of_order, SUM(number_of_orders) AS order_count
FROM uber_orders
GROUP BY service_name, status_of_order
ORDER BY service_name DESC;
