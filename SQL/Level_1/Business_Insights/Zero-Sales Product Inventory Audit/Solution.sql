SELECT dp.prod_sku_id, dp.market_name
FROM dim_product dp
         LEFT JOIN fct_customer_sales fcs ON fcs.prod_sku_id = dp.prod_sku_id
WHERE fcs.prod_sku_id IS NULL;
