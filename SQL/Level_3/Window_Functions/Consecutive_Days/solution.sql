WITH distinct_events AS (SELECT user_id,
                                record_date
                         FROM sf_events),
     orderd_days AS (SELECT user_id,
                            LAG(record_date, 1)  OVER(PARTITION BY user_id ORDER BY record_date) AS prev_date, record_date,
                            LEAD(record_date, 1) OVER(PARTITION BY user_id ORDER BY record_date) AS next_date
                     FROM distinct_events)

SELECT DISTINCT user_id
FROM orderd_days
WHERE record_date - prev_date = 1
  AND next_date - record_date = 1;
