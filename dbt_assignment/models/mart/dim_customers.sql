-- Single Source of truth of customers

SELECT 
    DISTINCT C1.CUSTOMER_ID,
    C2.CUSTOMER_MATCH_KEY,
    C3.AGE,
    C.EDUCATION,
    C.INCOME,
    C1.INCOME_SEGMENT,
    C1.CUSTOMER_SEGMENT,
    C2.CUSTOMER_TENURE_DAYS AS TENURE_DAYS,
    C2.CUSTOMER_TENURE_YEARS AS TENURE_YEARS,
    C1.ACCEPTANCE_RATE AS CAMPAIGN_ACCEPTANCE_RATE

FROM 
    {{ref ('int_customers_360')}} C1
JOIN
    {{ref ('int_customers_lifecycle')}} C2
ON
    C1.customer_id = C2.customer_id
JOIN
    {{ref ('stg_customers')}} C
ON
    C2.customer_match_key = C.customer_match_key
JOIN
    {{ref ('stg_customers_demograpics')}} C3
ON 
    C.customer_match_key = C3.customer_match_key