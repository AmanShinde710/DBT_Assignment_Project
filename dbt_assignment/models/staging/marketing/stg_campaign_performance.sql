-- Campiagn_performance

WITH campaign_performance AS (
    SELECT
        campaign_id,
        COUNT(*) AS total_responses,
        SUM(response_flag) as accepted_responses,
        ROUND(SUM(response_flag) * 100.0 / COUNT(*),2) AS acceptance_rate
    FROM
        {{ ref("stg_campaign_response")}}
    GROUP BY
        campaign_id

)

SELECT * FROM campaign_performance