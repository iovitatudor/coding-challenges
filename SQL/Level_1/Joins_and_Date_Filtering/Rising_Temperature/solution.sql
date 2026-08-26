-- WITH CTE_Extended_Weather AS (SELECT id,
--                                      recordDate,
--                                      temperature,
--                                      LAG(recordDate) OVER(ORDER BY recordDate) AS prev_date, LAG(temperature) OVER(ORDER BY recordDate) AS prev_temp
--                               FROM Weather)
-- SELECT id
-- FROM CTE_Extended_Weather
-- WHERE recordDate = prev_date + INTERVAL '1 day'
--   AND temperature
--     > prev_temp;

SELECT a.id
FROM Weather AS a
         JOIN Weather AS B
              ON a.recordDate = b.recordDate +
    INTERVAL '1 day'
    AND a.temperature
   > b.temperature;
