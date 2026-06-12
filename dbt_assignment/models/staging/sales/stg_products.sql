-- Products View

WITH products AS (
    SELECT
        DISTINCT STOCKCODE AS product_id,
        DESCRIPTION AS product_name,
        PRICE AS unit_price
    FROM 
        {{ source('sales','SALES')}}

    WHERE 
        PRICE > 0 AND STOCKCODE IS NOT NULL
        AND STOCKCODE NOT REGEXP '[a-zA-Z]'

)

SELECT * FROM products