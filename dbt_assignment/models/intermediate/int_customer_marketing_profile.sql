WITH customer_marketing_profile AS (
    SELECT
        customer_id,
        COUNT(*) AS campaign_recieved,
        SUM(response_flag) AS campaign_accepted,
        ROUND(SUM(response_flag) * 100.0 / COUNT(*),2) AS acceptance_rate
    FROM
        {{ ref('stg_campaign_response') }}
    GROUP BY
        customer_id
)

SELECT * FROM customer_marketing_profile