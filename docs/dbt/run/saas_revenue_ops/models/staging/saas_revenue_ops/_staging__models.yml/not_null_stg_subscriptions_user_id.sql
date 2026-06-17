
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `saas-revenue-ops`.`analytics_layer`.`stg_subscriptions`
where user_id is null



  
  
      
    ) dbt_internal_test