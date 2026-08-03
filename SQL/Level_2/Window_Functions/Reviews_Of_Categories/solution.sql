-- WITH categories AS (SELECT UNNEST(STRING_TO_ARRAY(categories, ';')) AS category,
--                            review_count
--                     FROM yelp_business)
--
-- SELECT category,
--        SUM(review_count) AS review_count
-- FROM categories
-- GROUP BY category
-- ORDER BY review_count DESC;

SELECT UNNEST(STRING_TO_ARRAY(categories, ';')) AS category,
       SUM(review_count)                        AS total_reviews
FROM yelp_business
GROUP BY category
ORDER BY total_reviews DESC
