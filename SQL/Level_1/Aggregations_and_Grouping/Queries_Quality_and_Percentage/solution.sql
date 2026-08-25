SELECT query_name,
       ROUND(SUM((rating * 1.0) / position) / COUNT(*), 2) AS quality,
       ROUND(
               SUM(CASE WHEN rating < 3 THEN 1.0 ELSE 0.0 END) * 100 / COUNT(*), 2)
                                                           AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;
