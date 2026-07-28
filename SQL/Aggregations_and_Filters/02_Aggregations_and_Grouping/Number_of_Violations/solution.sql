SELECT business_name, EXTRACT(YEAR FROM inspection_date) AS year, COUNT(violation_id) AS number_of_violation
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY EXTRACT (YEAR FROM inspection_date), business_name
ORDER BY year ASC;
