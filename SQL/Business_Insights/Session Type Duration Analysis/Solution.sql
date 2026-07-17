SELECT
    AVG(EXTRACT(EPOCH FROM (session_end - session_start))) AS avg_duration_seconds,
    session_type
FROM twitch_sessions
GROUP BY session_type;
