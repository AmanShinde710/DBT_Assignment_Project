-- Campaign View

WITH campaign AS (
    SELECT 'CRM1' AS campaign_id, 'Campaign 1' AS campaign_name
    UNION ALL
    SELECT 'CRM2' AS campaign_id, 'Campaign 2' AS campaign_name
    UNION ALL
    SELECT 'CRM3' AS campaign_id, 'Campaign 3' AS campaign_name
    UNION ALL
    SELECT 'CRM4' AS campaign_id, 'Campaign 4' AS campaign_name
    UNION ALL
    SELECT 'CRM5' AS campaign_id, 'Campaign 5' AS campaign_name
    UNION ALL 
    SELECT 'CRM6' AS campaign_id, 'Latest Campaign' AS campaign_name
    
)

SELECT * FROM campaign