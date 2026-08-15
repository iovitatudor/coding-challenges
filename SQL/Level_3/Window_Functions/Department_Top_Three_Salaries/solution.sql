WITH Ranked_Employee AS (SELECT id,
                                name,
                                salary,
                                departmentId,
                                DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk_salary
                         FROM Employee)
SELECT d.name   AS Department,
       e.name   AS Employee,
       e.salary AS Salary
FROM Ranked_Employee e
         INNER JOIN Department d ON d.id = e.departmentId
WHERE rnk_salary <= 3;
