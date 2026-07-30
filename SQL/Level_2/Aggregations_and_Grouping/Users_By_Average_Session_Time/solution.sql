WITH sessions AS (SELECT user_id,
                         timestamp ::date                                       AS session_date,
                         MAX(CASE WHEN action = 'page_load' THEN timestamp END) as latest_load,
                         MIN(CASE WHEN action = 'page_exit' THEN timestamp END) as earliest_exit
                  FROM facebook_web_log
                  WHERE action IN ('page_load', 'page_exit')
GROUP BY user_id, timestamp :: date
    )


SELECT user_id, AVG(earliest_exit - latest_load) AS session_duration
FROM sessions
WHERE latest_load IS NOT NULL
  AND earliest_exit IS NOT NULL
  AND earliest_exit > latest_load
GROUP BY user_id;
