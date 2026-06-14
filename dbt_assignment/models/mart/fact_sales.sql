SELECT
    O.ORDER_ID,
    C.CUSTOMER_ID,
    C.CUSTOMER_MATCH_KEY,
    P.PRODUCT_ID,
    D.DATE_KEY,
    O.QUANTITY,
    OI.TOTAL_PRICE AS REVENUE

FROM
    {{ref ("stg_orders")}} O

JOIN
    {{ref ("dim_dates")}} D 
ON
    O.order_date = D.full_date

JOIN 
    {{ref ("dim_customers")}} C
ON
    C.customer_match_key = O.customer_match_key

JOIN
    {{ ref ('dim_products')}} P
ON
    P.product_id = O.product_id

JOIN
    {{ref ('stg_order_items')}} OI 
ON 
    OI.order_id = O.order_id

