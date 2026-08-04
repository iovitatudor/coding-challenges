WITH ranked_business AS (SELECT name,
                                review_count,
                                RANK() OVER(ORDER BY review_count DESC) AS ranked_number
                         FROM yelp_business)
SELECT name, review_count
FROM ranked_business
WHERE ranked_number <= 5;
