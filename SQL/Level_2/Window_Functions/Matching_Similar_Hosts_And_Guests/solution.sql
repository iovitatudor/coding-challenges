SELECT DISTINCT hosts.host_id,
                guests.guest_id
FROM airbnb_hosts hosts
         INNER JOIN airbnb_guests guests
                    ON hosts.gender = guests.gender
                        AND hosts.nationality = guests.nationality;
