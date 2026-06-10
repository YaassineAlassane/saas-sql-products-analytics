with calendar as (

    select month_start_date 
    from {{ ref('dim_month') }}

),

subscription_base as (

    select 
        user_id,
        user_country,
        subscription_plan,
        monthly_revenue,
        date_trunc(signup_date, month) as signup_month,
        date_trunc(churn_date, month) as churn_month
    from {{ ref('int_subscription_users') }}

)

select

    c.month_start_date as financial_month,
    s.user_id,
    s.user_country,
    s.subscription_plan,
    s.monthly_revenue as mrr

from calendar c

inner join subscription_base s
    on c.month_start_date >= s.signup_month
    and (s.churn_month is null or c.month_start_date < s.churn_month)

where s.subscription_plan != 'free'