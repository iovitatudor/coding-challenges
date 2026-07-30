SELECT
        january.source_currency,
        (july.exchange_rate - january.exchange_rate) AS exchange_diffrence
FROM sf_exchange_rate january
         JOIN sf_exchange_rate july
              ON january.source_currency = july.source_currency
WHERE january.date = '2020-01-01'
  AND july.date = '2020-07-01';
