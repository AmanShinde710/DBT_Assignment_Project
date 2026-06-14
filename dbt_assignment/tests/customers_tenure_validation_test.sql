SELECT
    *
FROM
    {{ref ("int_customers_lifecycle")}}
WHERE
    enrollment_date > CURRENT_DATE()