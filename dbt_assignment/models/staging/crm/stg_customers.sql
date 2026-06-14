-- Customers View

WITH customers AS (
    SELECT
        ID AS customer_id,
        customer_match_key,
        EDUCATION AS education,
        TO_DATE(dt_customer,'DD-MM-YYYY') AS enrollment_date,
        MARITAL_STATUS,
        INCOME

    FROM {{ source('crm', 'CRM')}}

    WHERE ID IS NOT NULL AND INCOME IS NOT NULL
)

SELECT * FROM customers