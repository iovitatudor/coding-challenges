SELECT sub.shipment_id, sub.weight
FROM (SELECT shipment_id,
             weight,
             ROW_NUMBER() OVER(
            PARTITION BY shipment_id
            ORDER BY shipment_date ASC
        ) as rn
      FROM amazon_shipment) AS sub
WHERE sub.rn = 1;
