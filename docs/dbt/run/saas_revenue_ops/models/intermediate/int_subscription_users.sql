

  create or replace view `saas-revenue-ops`.`analytics_layer`.`int_subscription_users`
  OPTIONS()
  as with users as (
    
    select 
        user_id, 
        user_country, 
        signup_date
    from `saas-revenue-ops`.`analytics_layer`.`stg_users`
), 

subscriptions as (
    
    select 
        user_id, 
        subscription_status, 
        subscription_plan, 
        monthly_revenue, 
        churn_date

    from `saas-revenue-ops`.`analytics_layer`.`stg_subscriptions`
)

select 
    
    s.user_id,
    u.user_country,
    u.signup_date, 
    s.subscription_status,
    s.subscription_plan,
    s.monthly_revenue,
    s.churn_date
    

from subscriptions s 
left join users u
on s.user_id = u.user_id;

