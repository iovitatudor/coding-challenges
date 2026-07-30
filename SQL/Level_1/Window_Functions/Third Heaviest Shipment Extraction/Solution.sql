WITH aggreagated_shipments AS (SELECT shipment_id, SUM(weight) as total_weight
                               FROM amazon_shipment
                               GROUP BY shipment_id),
     ranked_shipments AS (SELECT shipment_id,
                                 total_weight,
                                 DENSE_RANK() OVER(ORDER BY total_weight DESC) AS rnk
                          FROM aggreagated_shipments)

SELECT shipment_id, total_weight
FROM ranked_shipments
WHERE rnk = 3;
