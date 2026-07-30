SELECT cust_id, COUNT(cust_id) as presence
FROM dim_customer
GROUP BY cust_id
HAVING COUNT(cust_id) > 1;
