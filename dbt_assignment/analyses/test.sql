{# select * from {{ source('sales', 'SALES')}} #}

{# SELECT COUNT(*) FROM {{ref("stg_customers_segment")}} C
join {{ref ("int_cust_sales_profile")}} S 
ON C.customer_id = S.customer_id #}

{# select count(*) from {{ref("stg_orders")}} o
join {{ref("stg_customers")}} c
on o.customer_match_key = c.customer_match_key
 #}


{# SELECT DISTINCT campaign_id
FROM {{ ref('dim_campaign') }}
ORDER BY 1 #}

{# select product_id, product_name, count(*) as count from {{ref("dim_products")}}
group by product_id, product_name #}

