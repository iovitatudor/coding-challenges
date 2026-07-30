SELECT event_name, COUNT(*) AS number_of_users
FROM playbook_events
WHERE device ILIKE '%macbook%' AND device ILIKE '%pro%'
GROUP BY event_name
ORDER BY number_of_users DESC;
