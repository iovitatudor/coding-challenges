SELECT a.number                                                      AS number1,
       b.number                                                      AS number2,
       CASE WHEN a.number > b.number THEN a.number ELSE b.number END AS max_number
FROM deloitte_numbers a
         CROSS JOIN deloitte_numbers b
