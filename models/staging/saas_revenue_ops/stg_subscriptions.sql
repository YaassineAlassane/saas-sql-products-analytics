with source as (    
    select *
    from {{source('raw_saas_data', 'subscriptions')}}
), 

renamed as (
    select 

        -- User identifier standardized as STRING across the entire warehouse
        cast(user_id as string) as user_id, 

        -- Subscription state machine status
        subscription_status, 

        -- Monthly recurring revenue contribution
        revenue as monthly_revenue, 

        -- Customer attrition and cancellation date
        churn_date

    from source

)

    select * from renamed