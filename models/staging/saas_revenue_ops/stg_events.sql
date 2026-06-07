with source as (
    select *
    from {{source ('raw_saas_data', 'events_saas')}}

), 

renamed as (
    select 

        -- User identifier standardized as STRING across the entire warehouse
        cast(user_id as string) as user_id, 

        -- Timestamp of when the specific user action occurred
        event_date, 

        -- Type of interaction or event performed by the user
        event_type 
        
    from source
)

select * from renamed