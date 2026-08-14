SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT id,
             num,
             LAG(num, 1) OVER(ORDER BY id) AS prev_num, LEAD(num, 1) OVER(ORDER BY id) AS next_num
      FROM Logs)
WHERE num = prev_num
  AND num = next_num;
