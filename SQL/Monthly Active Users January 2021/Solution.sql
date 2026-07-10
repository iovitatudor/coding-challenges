SELECT account_id, COUNT(DISTINCT user_id) AS monthly_count
FROM sf_events
WHERE record_date BETWEEN '2021-01-01'
GROUP BY account_id;
