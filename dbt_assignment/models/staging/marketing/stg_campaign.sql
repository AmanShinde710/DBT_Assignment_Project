-- Campaign View

WITH campaign AS (
    SELECT 'CMP1' AS campaign_id, 'Campaign 1' AS campaign_name
    UNION ALL
    SELECT 'CMP2' AS campaign_id, 'Campaign 2' AS campaign_name
    UNION ALL
    SELECT 'CMP3' AS campaign_id, 'Campaign 3' AS campaign_name
    UNION ALL
    SELECT 'CMP4' AS campaign_id, 'Campaign 4' AS campaign_name
    UNION ALL
    SELECT 'CMP5' AS campaign_id, 'Campaign 5' AS campaign_name
    UNION ALL 
    SELECT 'CMP6' AS campaign_id, 'Latest Campaign' AS campaign_name
    
)

SELECT * FROM campaign