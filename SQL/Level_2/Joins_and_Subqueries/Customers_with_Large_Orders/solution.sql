SELECT DISTINCT customers.customer_id, customers.customer_name
FROM online_store_customers customers
         INNER JOIN online_store_orders orders
                    ON orders.customer_id = customers.customer_id
                        AND orders.amount > 100
ORDER BY customers.customer_id ASC;
