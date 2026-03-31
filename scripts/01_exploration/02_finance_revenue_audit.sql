/* PROJECT: SaaS Product Analytics
   DEPARTMENT: Finance
   OBJECTIVE: Basic Audit of total revenue and global ARPU.
   SCOPE: Raw Layer exploration (Exercise 2).
*/

SELECT 
    SUM(revenue) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT user_id), 2) AS global_arpu
FROM `saas-revenue-ops.raw_layer.subscriptions`;
