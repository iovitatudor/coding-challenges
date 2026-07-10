SELECT u.user_id
FROM rc_users u
         LEFT JOIN rc_calls c
                   ON u.user_id = c.user_id
                       AND c.call_date BETWEEN '2020-04-01 00:00:00' AND '2020-04-30 23:59:59'
WHERE u.status = 'free'
  AND c.call_id IS NULL;
