SELECT AVG(CASE WHEN op.promotion_id IS NOT NULL THEN 100.0 ELSE 0.0 END) as percentage
FROM online_orders oo
         FULL OUTER JOIN online_promotions op ON op.promotion_id = oo.promotion_id;
