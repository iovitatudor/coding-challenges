SELECT content_id,
       content_text                                                              AS original_text,
       REGEXP_REPLACE(INITCAP(LOWER(content_text)), '(-)([a-z])', '\1\U\2', 'g') AS converted_text
FROM user_content;
