with source as (

    select *
    from {{ source('raw_saas_data', 'users') }}

),

renamed as (

    select

        -- User identifier standardized as STRING across the entire warehouse
        cast(user_id as string) as user_id,

        -- User's country of registration (used for segmentation and reporting)
        country as user_country,

        -- Current active plan layer for the user
        plan as current_plan,

        -- User conversion and registration date
        signup_date

    from source

)

select *
from renamed