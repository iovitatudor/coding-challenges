SELECT DISTINCT signup_id
FROM transactions
WHERE EXTRACT(MONTH FROM transaction_start_date) IN (4, 5);
