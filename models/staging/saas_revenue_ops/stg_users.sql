with source as (

    select *
    from {{ source('raw_saas_data', 'users') }}

),

renamed as (

    select
        cast(user_id as string) as user_id,
        country as user_country,
        plan as current_plan,
        signup_date
    from source

)

select *
from renamed