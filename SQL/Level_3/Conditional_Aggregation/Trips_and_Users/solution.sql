WITH UnbannedUsers AS (SELECT *
                       FROM Users
                       WHERE banned = 'No')

SELECT trip.request_at AS Day,
        ROUND(
            SUM(CASE WHEN trip.status != 'completed' THEN 1.0 ELSE 0.0 END) / COUNT(*), 2)
            AS "Cancellation Rate"
FROM Trips trip
    JOIN UnbannedUsers client
ON client.users_id = trip.client_id
    JOIN UnbannedUsers driver ON driver.users_id = trip.driver_id
WHERE trip.request_at >= '2013-10-01' AND trip.request_at <= '2013-10-03'
GROUP BY trip.request_at;
