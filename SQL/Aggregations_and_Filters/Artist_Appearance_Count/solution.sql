SELECT artist, COUNT(artist) AS numbers_of_occurrences
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY numbers_of_occurrences DESC;
