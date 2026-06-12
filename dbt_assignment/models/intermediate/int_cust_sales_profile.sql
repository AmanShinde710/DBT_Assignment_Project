{# {{ config(
    database='ANALYTICS_DB',
    schema='ANALYTICS_SCH'
)}} #}

WITH customer_sales_profile AS (
    SELECT
        O.CUSTOMER_ID AS customer_id,
        customer_match_key,
        MIN(O.ORDER_DATE) AS first_order_date,
        MAX(O.ORDER_DATE) AS last_order_date,
        COUNT(DISTINCT O.ORDER_ID) AS total_orders,
        SUM(O.ORDER_AMOUNT) AS total_revenue
    FROM
        {{ ref("stg_orders")}} O
    GROUP BY
        O.CUSTOMER_ID,
        customer_match_key
)

SELECT * FROM customer_sales_profile