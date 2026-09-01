SELECT u.name,
       SUM(amount) AS balance
FROM Users AS u
         JOIN Transactions AS t
              ON u.account = t.account
GROUP BY u.account, u.name
HAVING SUM(amount) > 10000;
