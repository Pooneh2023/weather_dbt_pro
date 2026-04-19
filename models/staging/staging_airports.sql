SELECT *
FROM {{source('flights_data','airports')}} 
LEFT JOIN {{source('flights_data','regions')}} 
USING (country) 