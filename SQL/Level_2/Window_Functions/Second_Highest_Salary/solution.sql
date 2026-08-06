WITH salary_rank AS (
    SELECT
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk_number
    FROM employee
)

SELECT salary
FROM salary_rank
WHERE rnk_number = 2;
