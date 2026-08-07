SELECT TRIM(BOTH '.,' FROM LOWER(UNNEST(STRING_TO_ARRAY(contents, ' ')))) AS word,
       COUNT(*)                                                           AS occurrences
FROM google_file_store
GROUP BY word
ORDER BY occurrences DESC;

