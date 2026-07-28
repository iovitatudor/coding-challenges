SELECT bike_number, MAX(end_time)
FROM dc_bikeshare_q1_2012
GROUP BY bike_number, end_time
ORDER BY end_time DESC;
