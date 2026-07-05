SELECT user_id
FROM loans
WHERE type IN ('Refinance', 'InSchool')
GROUP BY user_id
HAVING COUNT(DISTINCT type) = 2
