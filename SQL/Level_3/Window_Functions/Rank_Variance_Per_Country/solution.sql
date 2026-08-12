WITH december_rnk AS (SELECT country,
                             DENSE_RANK() OVER(ORDER BY SUM(number_of_comments) DESC) AS rnk_dec
                      FROM fb_comments_count c
                               JOIN fb_active_users u ON c.user_id = u.user_id
                      WHERE created_at BETWEEN '2019-12-01' AND '2019-12-31'
                      GROUP BY country),
     january_rnk AS (SELECT country,
                            DENSE_RANK() OVER(ORDER BY SUM(number_of_comments) DESC) AS rnk_jan
                     FROM fb_comments_count c
                              JOIN fb_Active_users u ON c.user_id = u.user_id
                     WHERE created_at BETWEEN '2020-01-01' AND '2020-01-31'
                     GROUP BY country)
SELECT country
FROM december_rnk
         FULL JOIN january_rnk USING (country)
WHERE (rnk_jan < rnk_dec)
   or rnk_dec IS NULL;
