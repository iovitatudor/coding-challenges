WITH RankedDepartment AS (SELECT id,
                                 name,
                                 salary,
                                 departmentId,
                                 DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) rnk_salary
                          FROM Employee)
SELECT Department.name         AS Department,
       RankedDepartment.name   AS Employee,
       RankedDepartment.salary AS Salary
FROM RankedDepartment
         INNER JOIN Department ON RankedDepartment.departmentId = Department.id
WHERE RankedDepartment.rnk_salary = 1;
