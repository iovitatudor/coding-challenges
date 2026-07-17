SELECT *
FROM airbnb_search_details
WHERE (property_type = 'Villa' OR property_type = 'House')
  AND amenities ILIKE '%Wireless Internet%';
