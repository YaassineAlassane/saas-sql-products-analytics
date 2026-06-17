
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select signup_date
from `saas-revenue-ops`.`analytics_layer`.`int_subscription_users`
where signup_date is null



  
  
      
    ) dbt_internal_test