{# {{ config(
    database='ANALYTICS_DB',
    schema='ANALYTICS_SCH'
)}} #}

WITH customer_sales_profile AS (
    SELECT
        CUSTOMER_ID AS customer_id,
        customer_match_key,
        MIN(ORDER_DATE) AS first_order_date,
        MAX(ORDER_DATE) AS last_order_date,
        COUNT(DISTINCT ORDER_ID) AS total_orders,
        SUM(ORDER_AMOUNT) AS total_revenue
    FROM
        {{ ref("stg_orders")}}
    GROUP BY
        CUSTOMER_ID,
        customer_match_key
)

SELECT * FROM customer_sales_profile