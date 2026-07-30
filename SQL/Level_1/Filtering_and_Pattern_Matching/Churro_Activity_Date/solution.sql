SELECT activity_date, pe_description, score
FROM los_angeles_restaurant_health_inspections
WHERE facility_name ILIKE '%STREET CHURROS%' AND score < 95;
