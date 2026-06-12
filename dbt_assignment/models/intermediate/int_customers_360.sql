SELECT 
    C.customer_id,
    C.income_band,
    C.customer_segment,

    S.TOTAL_ORDERS,
    S.TOTAL_REVENUE,

    M.campaign_recieved,
    M.campaign_accepted,
    M.acceptance_rate

FROM
    {{ref('stg_customers_segment')}} C 

JOIN 
    {{ref ('int_cust_sales_profile')}} S 
ON
    C.customer_id = S.customer_id

JOIN
    {{ref ('int_customer_marketing_profile')}} M
ON 
    M.customer_id = S.customer_id