SELECT DISTINCT
ON(player_id) player_id, login_date
FROM players_logins
ORDER BY player_id, login_date DESC;
