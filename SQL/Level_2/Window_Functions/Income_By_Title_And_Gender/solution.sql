WITH total_bonuses AS (SELECT worker_ref_id,
                              SUM(bonus) AS total_bonus
                       FROM sf_bonus
                       GROUP BY worker_ref_id)

SELECT employee.employee_title                  AS employee_title,
       employee.sex                             AS sex,
       AVG(employee.salary + bonus.total_bonus) AS avg_compensation
FROM sf_employee employee
         INNER JOIN total_bonuses bonus
                    ON employee.id = bonus.worker_ref_id
GROUP BY employee.employee_title, employee.sex;
