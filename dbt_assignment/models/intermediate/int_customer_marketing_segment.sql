WITH customer_marketing_segment AS (
    SELECT
        customer_id,
        customer_match_key,
        campaign_recieved,
        campaign_accepted,
        acceptance_rate,
        CASE
            WHEN acceptance_rate >= 50 THEN 'HIGHLY ENGAGED'
            WHEN acceptance_rate >= 20 AND acceptance_rate < 50 THEN 'MODERATELY ENGAGED'
            ELSE 'LOW ENGAGEMENT'
        END AS engagement_segment
    FROM
        {{ ref('int_customer_marketing_profile')}}
)

SELECT * FROM customer_marketing_segment