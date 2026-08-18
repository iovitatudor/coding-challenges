WITH Combined AS (SELECT requester_id AS id
                  FROM RequestAccepted
                  UNION ALL
                  SELECT accepter_id AS id
                  FROM RequestAccepted),
     Grouped AS (SELECT id, COUNT(*) AS num
                 FROM Combined
                 GROUP BY id)
SELECT id, num
FROM Grouped
WHERE num = (SELECT MAX(num) FROM cte2);
