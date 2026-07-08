SELECT TO_CHAR(shipment_date, 'YYYY-MM')                AS formatted_date,
       COUNT(DISTINCT CONCAT(shipment_id, '-', sub_id)) AS number_of_shipment
FROM amazon_shipment
GROUP BY TO_CHAR(shipment_date, 'YYYY-MM');
