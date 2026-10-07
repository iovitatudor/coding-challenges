WITH RankedInventory AS (SELECT store_id,
                                product_name,
                                quantity,
                                price,
                                COUNT(*) OVER (PARTITION BY store_id) AS total_products, ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY price DESC) AS exp_rnk, ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY price ASC) AS cheap_rnk
                         FROM inventory),
     StoreExtremes AS (SELECT store_id,
                              MAX(CASE WHEN exp_rnk = 1 THEN product_name END)   AS most_exp_product,
                              MAX(CASE WHEN exp_rnk = 1 THEN quantity END)       AS most_exp_qty,
                              MAX(CASE WHEN cheap_rnk = 1 THEN product_name END) AS cheapest_product,
                              MAX(CASE WHEN cheap_rnk = 1 THEN quantity END)     AS cheapest_qty,
                              MAX(total_products)                                AS total_products
                       FROM RankedInventory
                       GROUP BY store_id)
SELECT s.store_id,
       s.store_name,
       s.location,
       e.most_exp_product,
       e.cheapest_product,
       ROUND(e.cheapest_qty::numeric / e.most_exp_qty, 2) AS imbalance_ratio
FROM StoreExtremes AS e
         JOIN stores AS s
              ON e.store_id = s.store_id
WHERE e.total_products >= 3
  AND e.most_exp_qty < e.cheapest_qty
ORDER BY imbalance_ratio DESC, s.store_name ASC;
