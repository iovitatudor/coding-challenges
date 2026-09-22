-- WITH UserPaid AS (SELECT user_id,
--                          ROUND(AVG(activity_duration), 2) AS paid_avg_duration
--                   FROM UserActivity
--                   WHERE activity_type = 'paid'
--                   GROUP BY user_id),
--      UserTrial AS (SELECT user_id,
--                           ROUND(AVG(activity_duration), 2) AS trial_avg_duration
--                    FROM UserActivity
--                    WHERE activity_type = 'free_trial'
--                    GROUP BY user_id)
--
-- SELECT pu.user_id,
--        tu.trial_avg_duration,
--        pu.paid_avg_duration
-- FROM UserPaid AS pu
--          LEFT JOIN UserTrial AS tu
--                    ON pu.user_id = tu.user_id
-- ORDER BY user_id ASC;

SELECT user_id,
       ROUND(AVG(activity_duration) FILTER(WHERE activity_type = 'free_trial'), 2) AS trial_avg_duration,
       ROUND(AVG(activity_duration) FILTER(WHERE activity_type = 'paid'), 2)       AS paid_avg_duration
FROM UserActivity
GROUP BY user_id
HAVING COUNT(*) FILTER(WHERE activity_type = 'free_trial') > 0
    AND COUNT(*) FILTER(WHERE activity_type = 'paid') > 0
ORDER BY user_id ASC;
