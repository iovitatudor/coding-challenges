SELECT DISTINCT type, AVG(processed::int) OVER(PARTITION BY type) AS processed_rate
FROM facebook_complaints;
