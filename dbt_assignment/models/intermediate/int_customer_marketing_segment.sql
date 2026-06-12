WITH customer_marketing_segment AS (
    SELECT
        customer_id,
        campaign_recieved,
        campaign_accepted,
        acceptance_rate,
        CASE
            WHEN acceptance_rate >= 70 THEN 'HIGHLY ENGAGED'
            WHEN acceptance_rate >= 40 AND acceptance_rate < 70 THEN 'MODERATELY ENGAGED'
            ELSE 'LOW ENGAGEMENT'
        END AS engagement_segment
    FROM
        {{ ref('int_customer_marketing_profile')}}
)

SELECT * FROM customer_marketing_segment