{# select * from {{ source('sales', 'SALES')}} #}

{# SELECT COUNT(*) FROM {{ref("stg_customers_segment")}} C
join {{ref ("int_cust_sales_profile")}} S 
ON C.customer_id = S.customer_id #}

select count(*) from {{ref("stg_orders")}} o
join {{ref("stg_customers")}} c
on o.customer_match_key = c.customer_match_key


