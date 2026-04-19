WITH 
hourly_raw AS (
SELECT
	airport_code,
	station_id,
	json_array_elements (extracted_data -> 'data') AS json_data
FROM
	{{source('weather_data','weather_hourly_raw')}},
hourly_data AS (
SELECT
	airport_code,
	station_id,
	(json_data ->> 'time') :: date AS date,
	(json_data ->> 'temp'):: NUMERIC AS TEMP_c,
	(json_data ->> 'dwpt'):: NUMERIC AS dewpoint_c,
	(json_data ->> 'rhum'):: NUMERIC AS humidity_perc,
	(json_data ->> 'prcp')::NUMERIC AS percipitation_mm,
	(json_data ->> 'snow')::integer AS snow_mm,
	((json_data ->> 'wdir'):: NUMERIC):: integer AS wind_direction,
	(json_data ->> 'wspd'):: NUMERIC AS wind_speed_kmh,
	(json_data ->> 'wpgt')::NUMERIC AS wind_peakgust_kmh,
	(json_data ->> 'pres')::NUMERIC AS pressure_hpa,
	(json_data ->> 'tsun'):: integer AS sun_minutes,
	(json_data ->> 'coco'):: integer AS condition_code
FROM
	hourly_raw
)
SELECT
	*
FROM
	hourly_data