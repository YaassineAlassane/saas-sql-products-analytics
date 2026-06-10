with date_bounds as (
    -- Borne basse : début d’activité réel dans le SaaS
    -- Borne haute : projection future indépendante pour les abonnements longs
    select 
        date_trunc(min(signup_date), month) as start_date,
        date_add(
            date_trunc(current_date(), month),
            interval 5 year
        ) as end_date
    from {{ ref('int_subscription_suser') }}
),

date_series as (
    -- Génération dynamique de l'axe temporel mensuel
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
    -- Clé primaire de la dimension
    month_date as month_start_date,

    -- Composantes temporelles numériques
    extract(year from month_date) as date_year,
    extract(month from month_date) as month_number,
    extract(quarter from month_date) as quarter_number,

    -- Labels textuels pour les rapports BI
    format_date('%B', month_date) as month_name,

    -- Clés textuelles de tri et de filtrage (Format ISO)
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