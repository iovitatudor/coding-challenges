SELECT user_id, SUM(number_of_comments) as total_number_of_comments
FROM fb_comments_count
WHERE (created_at BETWEEN '2020-01-12' AND '2020-02-10')
  AND (number_of_comments > 0)
GROUP BY user_id;
