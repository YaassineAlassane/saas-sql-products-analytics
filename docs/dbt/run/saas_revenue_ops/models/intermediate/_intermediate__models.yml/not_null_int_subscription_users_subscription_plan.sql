
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select subscription_plan
from `saas-revenue-ops`.`analytics_layer`.`int_subscription_users`
where subscription_plan is null



  
  
      
    ) dbt_internal_test