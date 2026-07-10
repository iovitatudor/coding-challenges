SELECT COUNT(DISTINCT u.user_id) AS users_number
FROM rc_users u
         LEFT JOIN rc_calls c ON u.user_id = c.user_id
WHERE u.status = 'paid'
  AND call_date BETWEEN '2020-04-01 00:00:00' AND '2020-05-01 00:00:00';
