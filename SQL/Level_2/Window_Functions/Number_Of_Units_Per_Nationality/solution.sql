SELECT host.nationality,
       COUNT(DISTINCT apartment.unit_id) AS apartment_count
FROM airbnb_hosts host
         INNER JOIN airbnb_units apartment
                    ON host.host_id = apartment.host_id
WHERE host.age < 30
  AND apartment.unit_type = 'Apartment'
GROUP BY host.nationality
ORDER BY apartment_count DESC;
