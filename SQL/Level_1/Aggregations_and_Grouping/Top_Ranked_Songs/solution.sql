SELECT
    trackname,
    COUNT(*) AS times_top_ranked
FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY trackname
ORDER BY times_top_ranked DESC;
