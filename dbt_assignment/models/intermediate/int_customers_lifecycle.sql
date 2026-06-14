-- To track customers tenure.

SELECT
    customer_id,
    customer_match_key,
    ENROLLMENT_DATE,

    DATEDIFF(DAY, ENROLLMENT_DATE, CURRENT_DATE()) AS customer_tenure_days,

    DATEDIFF(YEAR, ENROLLMENT_DATE, CURRENT_DATE()) AS customer_tenure_years

FROM 
    {{ref ('stg_customers')}}