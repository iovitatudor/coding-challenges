SELECT SUM(order_total)
FROM amazon_sales
WHERE EXTRACT(YEAR FROM order_date) = 2021;
