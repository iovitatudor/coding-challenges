WITH cte AS (SELECT description,
                    DATE_PART('month', invoicedate) AS month,
                    SUM (quantity * unitprice) AS total_paid, ROW_NUMBER() OVER(PARTITION BY DATE_PART('month', invoicedate) ORDER BY SUM (quantity * unitprice) DESC) AS rnk
FROM online_retail
WHERE quantity > 0 AND description IS NOT NULL
GROUP BY month, description
    )

SELECT month, description, total_paid AS total_paid_amount
FROM cte
WHERE rnk = 1;
