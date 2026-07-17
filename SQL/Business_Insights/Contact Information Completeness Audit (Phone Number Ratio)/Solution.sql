SELECT SUM(CASE WHEN phone_number IS NULL THEN 1.0 ELSE 0.0 END) / COUNT(*) as employees_ratio
FROM techcorp_workforce;
