SELECT TO_CHAR(started_at, 'YYYY-MM') AS year_month, COUNT(signup_id) AS registration_count
FROM noom_signups
GROUP BY year_month;
