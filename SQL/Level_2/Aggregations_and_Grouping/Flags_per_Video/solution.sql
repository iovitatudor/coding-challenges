SELECT video_id,
       COUNT(DISTINCT CONCAT_WS(', ', user_firstname, user_lastname)) AS num_unique_users
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id;
