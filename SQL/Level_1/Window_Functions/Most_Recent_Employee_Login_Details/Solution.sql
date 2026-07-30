SELECT sub.id,
       sub.worker_id,
       sub.login_timestamp,
       sub.ip_address,
       sub.country,
       sub.region,
       sub.city,
       sub.device_type
FROM (SELECT id,
             worker_id,
             login_timestamp,
             ip_address,
             country,
             region,
             city,
             device_type,
             ROW_NUMBER() OVER(
            PARTITION BY worker_id
            ORDER BY login_timestamp DESC
        ) as rn
      FROM worker_logins) AS sub
WHERE sub.rn = 1;
