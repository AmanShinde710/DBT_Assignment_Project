-- Campaign_response View

WITH source_data AS (

    SELECT *
    FROM {{ source('marketing', 'MARKETING')}}

)

SELECT
    id as customer_id,
    customer_match_key,
    'CMP1' AS campaign_id,
    acceptedcmp1 AS response_flag
FROM source_data

UNION ALL

SELECT
    id as customer_id,
    customer_match_key,
    'CMP2' AS campaign_id,
    acceptedcmp2 AS response_flag
FROM source_data

UNION ALL

SELECT
    id as customer_id,
    customer_match_key,
    'CMP3' AS campaign_id,
    acceptedcmp3 AS response_flag
FROM source_data

UNION ALL

SELECT
    id as customer_id,
    customer_match_key,
    'CMP4' AS campaign_id,
    acceptedcmp4 AS response_flag
FROM source_data

UNION ALL

SELECT
    id as customer_id,
    customer_match_key,
    'CMP5' AS campaign_id,
    acceptedcmp5 AS response_flag
FROM source_data

UNION ALL

SELECT
    id as customer_id,
    customer_match_key,
    'CMP6' AS campaign_id,
    response AS response_flag
FROM source_data