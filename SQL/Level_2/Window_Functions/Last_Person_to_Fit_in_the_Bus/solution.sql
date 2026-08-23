WITH Queue_With_Total_Weight AS (SELECT *, SUM(weight) OVER(ORDER BY turn) AS total_weight
                                 FROM Queue
                                 ORDER BY turn)
SELECT person_name
FROM Queue_With_Total_Weight
WHERE total_weight <= 1000
ORDER BY total_weight DESC LIMIT 1;
