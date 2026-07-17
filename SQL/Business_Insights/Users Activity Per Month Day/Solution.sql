SELECT EXTRACT(MONTH FROM post_date) AS month_number, COUNT(*) AS total_number_of_posts
FROM facebook_posts
GROUP BY EXTRACT(MONTH FROM post_date);
