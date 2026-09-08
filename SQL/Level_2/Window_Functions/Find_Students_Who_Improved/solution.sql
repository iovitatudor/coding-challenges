-- SELECT tb1.student_id,
--        tb1.subject,
--        tb1.score AS first_score,
--        tb2.score AS latest_score
-- FROM Scores AS tb1
--          INNER JOIN Scores AS tb2
--                     ON tb1.student_id = tb2.student_id
--                         AND tb1.subject = tb2.subject
--                         AND tb1.exam_date != tb2.exam_date
--     AND tb1.exam_date < tb2.exam_date
-- WHERE tb1.score < tb2.score

WITH RankedScores AS (SELECT student_id,
                             subject,
                             score,
                             ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC) AS rn_first, ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rn_latest, COUNT(*) OVER(PARTITION BY student_id, subject) AS exam_count
                      FROM Scores)

SELECT f.student_id,
       f.subject,
       f.score AS first_score,
       l.score AS latest_score
FROM RankedScores f
         JOIN RankedScores l
              ON f.student_id = l.student_id
                  AND f.subject = l.subject
WHERE f.rn_first = 1
  AND l.rn_latest = 1
  AND f.exam_count >= 2
  AND l.score > f.score
ORDER BY f.student_id ASC,
         f.subject ASC;
