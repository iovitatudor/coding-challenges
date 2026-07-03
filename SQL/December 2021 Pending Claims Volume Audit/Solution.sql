SELECT COUNT(*) AS pending_claims_count
FROM cvs_claims
WHERE (date_submitted BETWEEN '2021-12-01' AND '2021-12-31')
  AND date_accepted IS NULL
  AND date_rejected IS NULL;
