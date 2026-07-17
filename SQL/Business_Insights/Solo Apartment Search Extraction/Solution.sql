SELECT *
FROM airbnb_search_details
WHERE LOWER(property_type) = 'apartment'
  AND accommodates = 1;
