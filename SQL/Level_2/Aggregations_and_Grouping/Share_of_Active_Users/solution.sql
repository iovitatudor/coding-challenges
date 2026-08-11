SELECT
    (COUNT(*) FILTER(WHERE status = 'open' AND country LIKE '%US%') * 100)::float / COUNT(*) AS fb_active_users
FROM fb_active_users;

-- OR

SELECT
    AVG((status = 'open' AND country LIKE '%US%')::int) * 100 AS fb_active_users
FROM fb_active_users;
