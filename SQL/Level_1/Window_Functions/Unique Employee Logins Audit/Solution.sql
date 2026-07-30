SELECT DISTINCT worker_id
FROM worker_logins
WHERE login_timestamp BETWEEN '2021-12-13 00:00:00' AND '2021-12-19 23:59:59';
