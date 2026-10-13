SELECT player_name,
       score
FROM Players
WHERE player_name IN (SELECT winner FROM Matches)
ORDER By score DESC LIMIT 3;
