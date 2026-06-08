with source as (    
    select *
    from {{source('raw_saas_data', 'subscriptions')}}
), 

renamed as (
    select 

       
        cast(user_id as string) as user_id,  
        subscription_status, 
        plan as subscription_plan,
        revenue as monthly_revenue,    
        churn_date

    from source

)

    select * from renamed