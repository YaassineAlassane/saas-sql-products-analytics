with date_bounds as (
    
    select 
        date('2020-01-01') as start_date,
        date_add(
            date_trunc(current_date(), month),
            interval 5 year
        ) as end_date
),

date_series as (
    
    select month_date
    from date_bounds,
    unnest(
        generate_date_array(
            date_bounds.start_date,
            date_bounds.end_date,
            interval 1 month
        )
    ) as month_date
)

select
   
    month_date as month_start_date,

   
    extract(year from month_date) as date_year,
    extract(month from month_date) as month_number,
    extract(quarter from month_date) as quarter_number,

   
    format_date('%B', month_date) as month_name,

   
    concat(
        extract(year from month_date),
        '-',
        lpad(cast(extract(month from month_date) as string), 2, '0')
    ) as year_month,

    concat(
        extract(year from month_date),
        '-Q',
        cast(extract(quarter from month_date) as string)
    ) as year_quarter

from date_series