-- WITH CTE_Duplicates AS (SELECT id,
--                                email,
--                                ROW_NUMBER() OVER(PARTITION BY email ORDER BY id ASC) AS rnk_number
--                         FROM Person)
--
-- DELETE
-- FROM Person
-- WHERE id IN (SELECT id
--              FROM CTE_Duplicates
--              WHERE rnk_number > 1);

DELETE
FROM Person AS p1 USING Person AS p2
WHERE p1.email = p2.email
  AND p1.id
    > p2.id;
