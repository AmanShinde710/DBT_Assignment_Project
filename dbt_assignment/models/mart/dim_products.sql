-- All product info
WITH products AS (
    SELECT  
        PRODUCT_ID,
        PRODUCT_NAME,
        UNIT_PRICE,

        ROW_NUMBER() OVER(
            PARTITION BY PRODUCT_ID
            ORDER BY PRODUCT_NAME
        )
        AS rno
    FROM
        {{ref ("stg_products")}}
)

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    UNIT_PRICE

FROM 
    products
WHERE
    rno = 1
