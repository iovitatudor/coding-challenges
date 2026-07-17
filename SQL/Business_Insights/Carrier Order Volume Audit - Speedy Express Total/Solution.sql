SELECT COUNT(*) as total_shipped_orders
FROM shopify_orders so
         JOIN shopify_carriers sc ON so.carrier_id = sc.id
WHERE sc.name = 'Speedy Express';
