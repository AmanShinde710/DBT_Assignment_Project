{{ config(
    materialized='view'
)}}

WITH order_summary AS (
    SELECT
        ORDER_ID,
        CUSTOMER_ID,
        COUNT(DISTINCT QUANTITY) AS total_quantity,
        SUM(QUANTITY * PRICE) AS total_order_value

    FROM {{ ref('stg_orders') }}
    GROUP BY 
        ORDER_ID,
        CUSTOMER_ID
    ORDER BY
        TOTAL_ORDER_VALUE DESC

)

SELECT * FROM order_summary