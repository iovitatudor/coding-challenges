SELECT price,
       CASE
           WHEN number_of_reviews = 0 THEN 'NO'
           WHEN number_of_reviews >= 1 AND number_of_reviews <= 5 THEN 'FEW'
           WHEN number_of_reviews >= 6 AND number_of_reviews <= 15 THEN 'SOME'
           WHEN number_of_reviews >= 16 AND number_of_reviews <= 40 THEN 'MANY'
           ELSE 'A LOT'
           END AS review_category
FROM airbnb_search_details;
