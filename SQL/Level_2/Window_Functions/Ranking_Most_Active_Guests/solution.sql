-- WITH ordered_guests AS (
--     SELECT  id_guest,
--             SUM(n_messages) AS sum_n_messages
--     FROM airbnb_contacts
--     GROUP BY id_guest
-- )
--
-- SELECT DENSE_RANK() OVER(ORDER BY sum_n_messages DESC) AS ranking,
--     id_guest,
--        sum_n_messages
-- FROM ordered_guests
-- ORDER BY ranking ASC;

SELECT
    DENSE_RANK() OVER(ORDER BY sum(n_messages) DESC) as ranking,
    id_guest,
    sum(n_messages) as sum_n_messages
FROM airbnb_contacts
GROUP BY id_guest
ORDER BY sum_n_messages DESC
