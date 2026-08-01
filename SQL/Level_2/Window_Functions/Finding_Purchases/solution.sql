WITH first_purchases AS (SELECT user_id,
                                created_at AS         tx_date,
                                LAG(created_at::date) OVER(PARTITION BY user_id ORDER BY created_at) AS prev_tx_date
                         FROM amazon_transactions)

SELECT DISTINCT user_id
FROM first_purchases
WHERE prev_tx_date IS NOT NULL
  AND tx_date - prev_tx_date > 0
  AND tx_date - prev_tx_date <= 7;
