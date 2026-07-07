SELECT id, SUBSTRING(id, 2, 1) AS handled_id
FROM random_id
ORDER BY SUBSTRING(id, 2, 1) ASC;
