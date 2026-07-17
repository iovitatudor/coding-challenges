SELECT user_id
FROM twitch_sessions
WHERE session_type IN ('streamer', 'viewer')
GROUP BY user_id
HAVING COUNT(DISTINCT session_type) = 2;
