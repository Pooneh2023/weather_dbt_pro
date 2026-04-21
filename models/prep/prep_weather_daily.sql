with daily_data AS(
    select *
    from {{ref('staging_weather_daily')}}
),
add_features as (
    select *
    , date_part('day', date) as date_day
    , date_part('month', date) as date_month
    , date_part('year', date) as date_year
    , date_part('week', date) as cw
    , to_char(date,'FMmonth') as month_name
    , to_char (date, 'FMday') as weakday
    from daily_data
),
add_more_features as (
    select *
    , (CASE
    when month_name in ('december', 'one_month', ' february') then 'winter'
    when month_name in ('march', 'april', 'may') then 'spring'
    when month_name in ('june', 'july', 'august') then 'summer'
    when month_name in ('september', 'october', 'november')then 'autumn'
    END) as season
    from add_features
)
select *
from add_more_features
order by date