SELECT (
    SELECT salary
        FROM (SELECT id,
                     salary,
                     DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk_number
              FROM employee)
    WHERE rnk_number = 2
) AS SecondHighestSalary

-- An alterative simpler solution:
SELECT (
           SELECT DISTINCT salary
           FROM employee
           ORDER BY salary DESC
           LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

