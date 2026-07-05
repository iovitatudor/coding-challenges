SELECT platform, COUNT(DISTINCT user_id) as number_of_users
FROM user_sessions
GROUP BY platform;
