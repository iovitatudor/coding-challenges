SELECT AVG(CASE WHEN is_low_fat = 'Y' AND is_recyclable = 'Y' THEN 100.0 ELSE 0.0 END) AS percentage
FROM facebook_products;
