WITH sent_requests AS (SELECT
    date
   , user_id_sender
   , user_id_receiver
FROM fb_friend_requests
WHERE action = 'sent'
    )
    , accepted_requests AS (
SELECT
    date, user_id_sender, user_id_receiver
FROM fb_friend_requests
WHERE action = 'accepted'
    )

SELECT s.date,
       COUNT(a.user_id_receiver) ::numeric / COUNT(s.user_id_sender)::numeric AS percentage_acceptance
FROM sent_requests s
         LEFT JOIN accepted_requests a
                   ON s.user_id_sender = a.user_id_sender
                       AND s.user_id_receiver = a.user_id_receiver
GROUP BY s.date
HAVING COUNT(a.user_id_receiver) > 0;
