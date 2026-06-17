with users as (
    
    select 
        user_id, 
        user_country, 
        current_plan

    from `saas-revenue-ops`.`analytics_layer`.`stg_users`
), 

subscriptions as (
    
    select 
        user_id, 
        monthly_revenue

    from `saas-revenue-ops`.`analytics_layer`.`stg_subscriptions`
)

select 
    users.user_id, 
    users.user_country, 
    users.current_plan, 
    subscriptions.monthly_revenue
    

from users 
left join subscriptions 
on users.user_id = subscriptions.user_id