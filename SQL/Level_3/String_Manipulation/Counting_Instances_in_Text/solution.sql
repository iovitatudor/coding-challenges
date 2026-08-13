-- WITH cte_1 AS (SELECT TRIM(UNNEST(STRING_TO_ARRAY(LOWER(contents), ' '))) AS word
--                FROM google_file_store)
-- SELECT word,
--        COUNT(*) AS nentry
-- FROM cte_1
-- WHERE word IN ('bull', 'bear')
-- GROUP BY word;

SELECT 'bull' AS word,
       COUNT(*) AS nentry
FROM google_file_store,
     LATERAL regexp_matches(LOWER(contents), '\m(bull)\M', 'g')
UNION ALL
SELECT 'bear' AS word,
       COUNT(*) AS nentry
FROM google_file_store,
     LATERAL regexp_matches(LOWER(contents), '\m(bear)\M', 'g');
