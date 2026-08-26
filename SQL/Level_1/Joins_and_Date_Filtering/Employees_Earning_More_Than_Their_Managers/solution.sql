SELECT e.name AS Employee
FROM Employee AS e
         JOIN Employee AS m
              ON e.managerId = m.id
                  AND e.salary > m.salary;
