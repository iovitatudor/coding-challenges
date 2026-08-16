WITH first_date AS (SELECT player_id,
                           MIN(event_date) AS fisrt_date
                    FROM Activity
                    GROUP BY player_id)

SELECT ROUND(COUNT(b.player_id)::numeric / COUNT(*), 2) AS fraction
FROM first_date a
         LEFT JOIN Activity b
                   ON a.player_id = b.player_id
                       AND b.event_date = a.fisrt_date + 1;
