CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
DECLARE
    M INT := N - 1;
BEGIN
    IF N < 1 THEN
        RETURN QUERY SELECT NULL::INT;
    ELSE
        RETURN QUERY (
            SELECT (
            SELECT DISTINCT employee.salary
            FROM Employee
            ORDER BY employee.salary DESC
            LIMIT 1 OFFSET M
        )
    );
    END IF;
END;
$$ LANGUAGE plpgsql;
