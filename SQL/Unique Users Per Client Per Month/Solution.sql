SELECT DATE_PART('month', time_id) AS month, client_id, COUNT(DISTINCT user_id) AS users_qty
FROM fact_events
GROUP BY DATE_PART('month', time_id), client_id;
