-- WITH cte AS (SELECT patient_id,
--                     result,
--                     LEAD(result)    OVER(PARTITION BY patient_id ORDER BY test_date ASC) AS next_result, test_date,
--                     LEAD(test_date) OVER(PARTITION BY patient_id ORDER BY test_date ASC) - test_date as next_test_date
--              FROM covid_tests
--              WHERE result IN ('Positive', 'Negative'))
--
-- SELECT ct.patient_id,
--        p.patient_name,
--        p.age,
--        next_test_date AS recovery_time
-- FROM cte AS ct
--          JOIN patients AS p
--               ON ct.patient_id = p.patient_id
-- WHERE ct.result = 'Positive'
--   AND ct.next_result = 'Negative'
-- ORDER BY recovery_time ASC, p.patient_name ASC;


WITH FirstPositive AS (SELECT patient_id,
                              MIN(test_date) AS first_pos_date
                       FROM covid_tests
                       WHERE result = 'Positive'
                       GROUP BY patient_id),
     FirstNegativeAfterPositive AS (SELECT fp.patient_id,
                                           fp.first_pos_date,
                                           MIN(ct.test_date) AS first_neg_date
                                    FROM FirstPositive AS fp
                                             JOIN covid_tests AS ct
                                                  ON fp.patient_id = ct.patient_id
                                                      AND ct.result = 'Negative'
                                                      AND ct.test_date > fp.first_pos_date
                                    GROUP BY fp.patient_id, fp.first_pos_date)
SELECT fn.patient_id,
       p.patient_name,
       p.age,
       (fn.first_neg_date - fn.first_pos_date) AS recovery_time
FROM FirstNegativeAfterPositive AS fn
         JOIN patients AS p
              ON fn.patient_id = p.patient_id
ORDER BY recovery_time ASC, p.patient_name ASC;
