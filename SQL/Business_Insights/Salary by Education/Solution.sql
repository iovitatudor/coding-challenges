SELECT education, AVG(salary) as avg_salary
FROM google_salaries
GROUP BY education;
