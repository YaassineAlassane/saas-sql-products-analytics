/* PROJECT: SaaS Product Analytics
  DEPARTMENT: Marketing
  OBJECTIVE: Audit of total unique users and top 3 geographic markets.
*/

-- 1. Total unique user volume
SELECT 
    COUNT(DISTINCT user_id) AS total_unique_users
FROM ;

-- 2. Top 3 countries by user acquisition
SELECT 
    country, 
    COUNT(DISTINCT user_id) AS user_count
FROM 
GROUP BY country
ORDER BY user_count DESC
LIMIT 3;
