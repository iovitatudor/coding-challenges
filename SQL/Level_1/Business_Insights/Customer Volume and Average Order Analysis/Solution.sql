SELECT COUNT(DISTINCT customer_id) as customers_qty, AVG(amount) as average_order_amount
FROM postmates_orders;
