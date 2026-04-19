WITH 
airport_join_region AS (
SELECT
	*
FROM
	{{source ( 'flights_data','airports')}}
LEFT JOIN {{source ('flights_data','regions')}} 
ON
	airports.COUNTRY = regions.COUNTRY 
)
SELECT
	*
FROM
	airport_join_region