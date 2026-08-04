WITH ranked_employes AS (
    SELECT
        first_name,
        target,
        RANK() OVER(ORDER BY target DESC) AS rank_number
    FROM salesforce_employees
    WHERE manager_id = 13
)
SELECT first_name, target
FROM ranked_employes
WHERE rank_number = 1;
