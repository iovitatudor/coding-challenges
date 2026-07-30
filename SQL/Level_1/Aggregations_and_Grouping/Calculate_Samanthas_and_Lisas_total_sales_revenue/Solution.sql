SELECT salesperson, SUM(sales_revenue) AS total_sales_revenue
FROM sales_performance
WHERE salesperson IN ('Samantha', 'Lisa')
GROUP BY salesperson;
