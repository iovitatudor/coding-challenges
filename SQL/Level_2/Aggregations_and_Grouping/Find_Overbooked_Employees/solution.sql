WITH WeeklyMeetings AS (SELECT employee_id,
                               DATE_TRUNC('week', meeting_date) AS week_start,
                               SUM(duration_hours)              AS total_duration
                        FROM meetings
                        GROUP BY employee_id, DATE_TRUNC('week', meeting_date)
                        HAVING SUM(duration_hours) > 20),
     HeavyWeeksCount AS (SELECT employee_id,
                                COUNT(*) AS meeting_heavy_weeks
                         FROM WeeklyMeetings
                         GROUP BY employee_id
                         HAVING COUNT(*) >= 2)
SELECT h.employee_id,
       e.employee_name,
       e.department,
       h.meeting_heavy_weeks
FROM HeavyWeeksCount AS h
         JOIN employees AS e
              ON h.employee_id = e.employee_id
ORDER BY h.meeting_heavy_weeks DESC, e.employee_name ASC;
