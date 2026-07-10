SELECT p.product_category, COUNT(DISTINCT t.transaction_id) AS transaction_count, SUM(sales) AS total_sales
FROM wfm_transactions t
         INNER JOIN wfm_products p ON t.product_id = p.product_id
WHERE t.transaction_date BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY p.product_category
ORDER BY total_sales DESC;
