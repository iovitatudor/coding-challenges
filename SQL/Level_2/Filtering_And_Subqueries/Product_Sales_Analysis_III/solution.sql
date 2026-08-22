WITH Ranked_Sales AS (SELECT product_id,
    year
   , quantity
   , price
   , RANK() OVER(PARTITION BY product_id ORDER BY year) AS rank_number
FROM Sales
    )
SELECT product_id, year AS first_year, quantity, price
FROM Ranked_Sales
WHERE rank_number = 1;
