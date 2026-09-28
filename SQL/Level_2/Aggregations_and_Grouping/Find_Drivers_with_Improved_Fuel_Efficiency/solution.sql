WITH trips_improvements AS (SELECT driver_id,
                                   AVG(distance_km / fuel_consumed) FILTER (WHERE EXTRACT(MONTH FROM trip_date) BETWEEN 1 AND 6) AS raw_first_avg, AVG(distance_km / fuel_consumed) FILTER (WHERE EXTRACT(MONTH FROM trip_date) BETWEEN 7 AND 12) AS raw_second_avg
                            FROM trips
                            GROUP BY driver_id)
SELECT t.driver_id,
       d.driver_name,
       ROUND(t.raw_first_avg, 2)                    AS first_half_avg,
       ROUND(t.raw_second_avg, 2)                   AS second_half_avg,
       ROUND(t.raw_second_avg - t.raw_first_avg, 2) AS efficiency_improvement
FROM trips_improvements AS t
         JOIN drivers AS d
              ON t.driver_id = d.driver_id
WHERE t.raw_first_avg IS NOT NULL
  AND t.raw_second_avg IS NOT NULL
  AND t.raw_second_avg > t.raw_first_avg
ORDER BY efficiency_improvement DESC, d.driver_name ASC;
