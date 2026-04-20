{{config (materialize='table')}}

WITH category_clean AS(
SELECT
	categoryid::integer AS category_id,
	categoryname::varchar(255) AS category_name,
	description:: varchar(255) AS cat_descriptoin,
	picture AS cat_pic
FROM
	{{source('northwild_data','categories')}}
	)
	SELECT *
	FROM category_clean
