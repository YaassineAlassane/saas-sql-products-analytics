
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select month_start_date
from `saas-revenue-ops`.`analytics_layer`.`dim_month`
where month_start_date is null



  
  
      
    ) dbt_internal_test