WITH 
airport_join_region AS (
SELECT
	*
FROM
	{{source ( 'flights_data','airports')}}
LEFT JOIN {{source ('flights_data','regions')}} 
using country
)
SELECT
	*
FROM
	airport_join_region