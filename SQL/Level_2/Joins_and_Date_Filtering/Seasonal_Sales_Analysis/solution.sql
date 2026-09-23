WITH SeasonalAggregates AS (SELECT CASE
                                       WHEN EXTRACT(MONTH FROM s.sale_date) IN (12, 1, 2) THEN 'Winter'
                                       WHEN EXTRACT(MONTH FROM s.sale_date) IN (3, 4, 5) THEN 'Spring'
                                       WHEN EXTRACT(MONTH FROM s.sale_date) IN (6, 7, 8) THEN 'Summer'
                                       WHEN EXTRACT(MONTH FROM s.sale_date) IN (9, 10, 11) THEN 'Fall'
                                       END                   AS season,
                                   p.category,
                                   SUM(s.quantity)           AS total_quantity,
                                   SUM(s.quantity * s.price) AS total_revenue
                            FROM sales AS s
                                     JOIN products AS p
                                          ON s.product_id = p.product_id
                            GROUP BY 1, p.category),
     RankedCategories AS (SELECT season,
                                 category,
                                 total_quantity,
                                 total_revenue,
                                 DENSE_RANK() OVER (
                PARTITION BY season
                ORDER BY total_quantity DESC, total_revenue DESC, category ASC
            ) AS rnk
                          FROM SeasonalAggregates)
SELECT season,
       category,
       total_quantity,
       total_revenue
FROM RankedCategories
WHERE rnk = 1
ORDER BY season ASC;
