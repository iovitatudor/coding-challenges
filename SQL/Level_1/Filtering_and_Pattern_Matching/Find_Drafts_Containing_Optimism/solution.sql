SELECT *
FROM google_file_store
WHERE filename LIKE 'draft%'
  AND contents LIKE '%optimism%'
