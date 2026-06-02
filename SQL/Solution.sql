select
    distinct
    p.*
FROM
    facebook_posts p
        INNER JOIN
    facebook_reactions r
    ON
        p.post_id = r.post_id AND
        r.reaction = 'heart';
