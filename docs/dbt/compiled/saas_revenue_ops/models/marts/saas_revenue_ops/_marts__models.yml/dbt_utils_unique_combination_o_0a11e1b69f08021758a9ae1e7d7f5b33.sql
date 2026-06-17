





with validation_errors as (

    select
        financial_month, user_id
    from `saas-revenue-ops`.`analytics_layer`.`fct_mrr`
    group by financial_month, user_id
    having count(*) > 1

)

select *
from validation_errors


