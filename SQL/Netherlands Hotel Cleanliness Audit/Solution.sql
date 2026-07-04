SELECT *
FROM hotel_reviews
WHERE negative_review ILIKE '%dirty%' AND hotel_address ILIKE '%Netherlands%'
