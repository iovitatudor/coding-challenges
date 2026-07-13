-- SELECT
--     a.shipment_id,
--     a.sub_id,
--     a.weight,
--     a.shipment_date,
--     COALESCE(o.sum_weight, 0) AS total_weight
-- FROM amazon_shipment a
-- LEFT JOIN (
--     SELECT shipment_id, SUM(weight) AS sum_weight FROM amazon_shipment
--     GROUP BY shipment_id
-- ) o ON a.shipment_id = o.shipment_id;

SELECT
    shipment_id,
    sub_id,
    weight,
    shipment_date,
    SUM(weight) OVER(PARTITION BY shipment_id) AS total_weight
FROM amazon_shipment;
