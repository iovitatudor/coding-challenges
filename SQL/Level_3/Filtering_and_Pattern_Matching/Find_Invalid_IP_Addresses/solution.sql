SELECT ip,
       COUNT(*) AS invalid_count
FROM logs
WHERE CARDINALITY(STRING_TO_ARRAY(ip, '.')) != 4
    OR
    EXISTS(
        SELECT 1
        FROM UNNEST(STRING_TO_ARRAY(ip, '.')) AS octet
        WHERE (octet ~ '^0\d+')
            OR (octet !~ '^\d+$')
            OR (octet::BIGINT > 255)
    )
GROUP BY ip
ORDER BY invalid_count, ip DESC;
