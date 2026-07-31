WITH first_purchases AS (SELECT user_id,
                                MIN(created_at) AS first_date
                         FROM amazon_transactions
                         GROUP BY user_id)
SELECT DISTINCT a.user_id
FROM amazon_transactions a
         JOIN first_purchases f
              ON a.user_id = f.user_id
WHERE a.created_at > f.first_date
  AND a.created_at <= f.first_date + INTERVAL '7 days'
ORDER BY a.user_id;
