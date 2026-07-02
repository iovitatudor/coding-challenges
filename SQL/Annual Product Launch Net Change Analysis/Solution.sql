SELECT
    company_name,
    (COUNT(DISTINCT CASE WHEN year = 2020 THEN product_name END) -
     COUNT(DISTINCT CASE WHEN year = 2019 THEN product_name END)) AS net_difference
FROM car_launches
GROUP BY company_name;
