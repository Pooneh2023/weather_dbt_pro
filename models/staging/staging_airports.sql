SELECT *
FROM {{source('flights_data','AIRPORTS')}} 
LEFT JOIN {{source('flights_data','REGIONS')}} 
USING (country) 