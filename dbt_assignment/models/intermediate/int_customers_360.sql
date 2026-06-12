SELECT 
    C.customer_id,
    C.income_segment,
    C.customer_segment,

    S.TOTAL_ORDERS,
    S.TOTAL_REVENUE,

    M.campaign_recieved,
    M.campaign_accepted,
    M.acceptance_rate

FROM
    {{ref('stg_customers_segment')}} C 

LEFT JOIN 
    {{ref ('int_cust_sales_profile')}} S 
ON
    C.customer_match_key = S.customer_match_key

LEFT JOIN
    {{ref ('int_customer_marketing_profile')}} M
ON 
    C.customer_match_key = M.customer_match_key
