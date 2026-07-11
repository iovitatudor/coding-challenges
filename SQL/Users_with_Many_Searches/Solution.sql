SELECT COUNT(*) as num_users
FROM (SELECT user_id
      FROM fb_searches
      WHERE date >= '2021-08-01' AND date <= '2021-08-31'
      GROUP BY user_id
      HAVING COUNT (search_id) > 5) AS qualifying_users;
