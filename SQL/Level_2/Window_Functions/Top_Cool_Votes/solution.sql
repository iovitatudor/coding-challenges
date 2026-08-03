SELECT business_name, review_text
FROM yelp_reviews
WHERE cool IN (SELECT MAX(cool) FROM yelp_reviews);
