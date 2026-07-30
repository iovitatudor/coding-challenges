WITH dec_users AS (SELECT account_id, COUNT(DISTINCT user_id) AS dec_count
                   FROM sf_events
                   WHERE record_date BETWEEN '2020-12-01' AND '2020-12-31'
                   GROUP BY account_id),
     jan_users AS (SELECT account_id, COUNT(DISTINCT user_id) AS jan_count
                   FROM sf_events
                   WHERE record_date BETWEEN '2021-01-01' AND '2021-01-31'
                   GROUP BY account_id)
SELECT jan.account_id,
       (jan.jan_count * 1.0 / dec.dec_count) AS growth_rate
FROM jan_users jan
         JOIN dec_users dec
ON jan.account_id = dec.account_id;
