-- Customers View

WITH customers AS (
    SELECT
        ID AS customer_id,
        customer_match_key,
        EDUCATION AS education,
        DT_CUSTOMER AS enrollment_date,
        MARITAL_STATUS,
        INCOME

    FROM {{ source('crm', 'CRM')}}

    WHERE ID IS NOT NULL AND INCOME IS NOT NULL
)

SELECT * FROM customers