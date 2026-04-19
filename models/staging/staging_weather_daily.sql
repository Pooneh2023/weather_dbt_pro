WITH 
daily_raw AS (
SELECT
	airport_code,
	station_id,
	json_array_elements (extracted_data -> 'data') AS json_data
FROM
	{{source ('weather_data','weather_daily_raw'}}
),
extracted_weather_data AS (
SELECT
	airport_code,
	station_id,
	(json_data ->> 'date') :: date AS date ,
	(json_data ->> 'tavg') :: NUMERIC AS temp_avg,
	(json_data ->> 'tmin'):: NUMERIC AS temp_min,
	(json_data ->> 'tmax'):: NUMERIC AS temp_max,
	(json_data ->> 'prcp') :: NUMERIC AS percipitation_mm,
	(json_data ->> 'snow') :: NUMERIC AS max_snow_mm,
	(json_data ->> 'wdir') :: NUMERIC AS avg_wind_direction,
	(json_data ->> 'wspd') :: NUMERIC AS avg_wind_speed_kmh,
	(json_data ->> 'wpgt') :: NUMERIC AS wind_peakgust_kmh,
	(json_data ->> 'pres') :: NUMERIC AS avg_pressure_hpa,
	(json_data ->> 'tsun') :: integer AS sun_minutes
FROM
	daily_raw
)
SELECT
	*
FROM
	extracted_weather_data;