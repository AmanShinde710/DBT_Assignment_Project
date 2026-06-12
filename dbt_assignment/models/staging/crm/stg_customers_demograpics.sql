-- Customers_demograpics

WITH customer_demographics AS (
    SELECT
        ID AS customer_id,
        YEAR(CURRENT_DATE) -  YEAR_BIRTH AS age,
        KIDHOME,
        TEENHOME
    FROM 
        {{ source('crm', 'CRM')}}
    WHERE
        ID IS NOT NULL
)

SELECT * FROM customer_demographics