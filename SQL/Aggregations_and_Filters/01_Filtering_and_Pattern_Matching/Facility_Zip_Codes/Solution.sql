SELECT facility_id,
       facility_name,
       facility_address,
       facility_city,
       facility_state,
       facility_zip
FROM los_angeles_restaurant_health_inspections
WHERE facility_zip IN ('90049', '90034', '90045');
