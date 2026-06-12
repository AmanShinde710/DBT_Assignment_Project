-- Customer_segment 

WITH customer_segment AS (
    SELECT
        ID AS customer_id,
        C1.customer_match_key,
        CASE
            WHEN C.AGE BETWEEN 18 AND 25 THEN 'YOUNG ADULT'
            WHEN C.AGE BETWEEN 26 AND 35 THEN 'ADULT'
            WHEN C.AGE BETWEEN 36 AND 50 THEN 'MIDDLE AGED'
            WHEN C.AGE > 50 THEN 'SENIOR CITIZEN'
        END AS age_segment,
        INCOME,

        CASE
            WHEN INCOME > 70000 THEN 'HIGH INCOME'
            WHEN INCOME < 70000 AND INCOME >= 40000 THEN 'MEDIUM INCOME'
            ELSE 'LOW INCOME'
        END AS income_segment,

        CASE
            WHEN INCOME > 70000 THEN 'PREMIUM CUSTOMER'
            WHEN INCOME >= 30000 AND INCOME < 70000 THEN 'REGULAR CUSTOMER'
            ELSE 'BUDGET CUSTOMER'
        END AS customer_segment
    FROM 
        {{ source('crm', 'CRM')}} C1
    JOIN {{ ref("stg_customers_demograpics")}} C
    ON C1.ID = C.CUSTOMER_ID

    WHERE
        ID IS NOT NULL AND INCOME IS NOT NULL
)

SELECT * FROM customer_segment