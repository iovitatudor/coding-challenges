SELECT SUM(COALESCE(cost_in_dollars, 0)) AS total_revenue
FROM online_orders o
         INNER JOIN online_customers c
                    ON o.customer_id = c.id
                        AND c.state = 'Oregon'
WHERE date_sold >= '2022-04-01'
  AND date_sold <= '2022-04-30';
