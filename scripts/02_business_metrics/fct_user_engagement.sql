/* ===============================================================================
MODÈLE : fct_user_engagement
DESCRIPTION : Table de faits regroupant l'activité synthétique par utilisateur.
DÉPENDANCES : raw_layer.subscriptions, raw_layer.events_saas
===============================================================================
*/

CREATE OR REPLACE TABLE saas-revenue-ops.analytics_layer.fct_user_engagement AS
WITH users_activity_stats AS (
SELECT 
  s.user_id, 
  s.revenue, 
  SUM( CASE WHEN e.event_type = 'login' THEN 1 ELSE 0 END) AS nb_login, 
  SUM (CASE WHEN e.event_type LIKE 'feature_%' THEN 1 ELSE 0 END) AS nb_feature, 
  COUNT (e.event_type) AS total_events, 
  MIN (DATE (e.event_date)) AS first_active_date, 
  MAX(DATE(e.event_date)) AS last_active_date

FROM  AS s
LEFT JOIN  AS e
ON s.user_id = e.user_id
GROUP BY 1,2

)

SELECT *
FROM users_activity_stats
ORDER BY total_events
