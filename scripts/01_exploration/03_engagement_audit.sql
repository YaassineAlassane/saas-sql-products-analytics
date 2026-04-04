/* PROJECT: SaaS Product Analytics
   DEPARTMENT: Product
   OBJECTIVE: Engagement audit (Total volume & Event distribution).
   SCOPE: Raw Layer exploration.
*/

-- 1. Global Activity Volume
SELECT 
    COUNT(*) AS total_events_recorded
FROM ;

-- 2. Event Distribution by Frequency
SELECT 
    event_type,
    COUNT(*) AS event_count
FROM 
GROUP BY event_type
ORDER BY event_count DESC;
