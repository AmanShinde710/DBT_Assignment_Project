SELECT
    C.CUSTOMER_ID,
    C.CUSTOMER_MATCH_KEY,
    C1.CAMPAIGN_ID,
    CR.RESPONSE_FLAG

FROM    
    {{ref ('stg_campaign_response')}} CR 

JOIN
    {{ref ("dim_campaign")}} C1
ON
    C1.campaign_id = CR.campaign_id

JOIN
    {{ref ('dim_customers')}} C 
ON
    C.customer_id = CR.customer_id
