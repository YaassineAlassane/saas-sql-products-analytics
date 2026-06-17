
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select financial_month
from `saas-revenue-ops`.`analytics_layer`.`fct_mrr`
where financial_month is null



  
  
      
    ) dbt_internal_test