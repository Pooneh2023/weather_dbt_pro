SELECT *
FROM {{source('flights_data','AIRPORTS')}} 
LEFT JOIN {{source('flight_data','REGIONS')}} 
using country 