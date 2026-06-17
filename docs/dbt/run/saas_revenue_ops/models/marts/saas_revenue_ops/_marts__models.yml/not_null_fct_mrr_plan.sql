
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select plan
from `saas-revenue-ops`.`analytics_layer`.`fct_mrr`
where plan is null



  
  
      
    ) dbt_internal_test