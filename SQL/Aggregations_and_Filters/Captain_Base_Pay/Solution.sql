SELECT employeename, basepay
FROM sf_public_salaries
WHERE jobtitle ILIKE '%captain%'
  AND jobtitle ILIKE '%police%';
