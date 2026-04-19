{{config (materialize='view')}}

with flights_one_month as (
    select *
    from {{source('flights_data' , 'flights')}}
    where date_part ('month', flight_date)=9
)
select * from flights_one_month