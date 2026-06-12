-- All The Info on Orders

WITH orders AS (
    SELECT
        INVOICE AS order_id,
        COALESCE(CUSTOMERID, 0000) AS customer_id,
        INVOICEDATE AS order_date,
        STOCKCODE AS product_id,
        QUANTITY AS quantity,
        PRICE AS price
    FROM 
        {{ source('sales','SALES')}}
    WHERE
        PRICE > 0 AND QUANTITY > 0
        AND INVOICE IS NOT NULL AND INVOICEDATE IS NOT NULL
        AND STOCKCODE IS NOT NULL AND CUSTOMERID IS NOT NULL
        
)

SELECT * FROM orders