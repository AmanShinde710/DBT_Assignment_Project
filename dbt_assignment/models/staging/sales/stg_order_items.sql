-- Order_items View

WITH order_items AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['INVOICE', 'STOCKCODE'])}} AS order_item_id,
        INVOICE AS order_id,
        STOCKCODE AS product_id,
        QUANTITY AS quantity,
        PRICE AS unit_price,
        QUANTITY * PRICE AS total_price,
        INVOICEDATE AS invoice_date
    FROM 
        {{ source('sales','SALES')}}

    WHERE
        PRICE > 0 AND QUANTITY >= 1
        AND ORDER_ID IS NOT NULL AND PRODUCT_ID IS NOT NULL

)

SELECT * FROM order_items