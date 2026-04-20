WITH phone_cleaning AS (
    SELECT
        customer_id,
        company_name,
        contact_name,
        contact_title,
        country,
        region,
        city,
        postal_code,
        CASE
            WHEN phone LIKE '00%' THEN 
                '+' || SUBSTRING(REGEXP_REPLACE(phone, '[^0-9]', '', 'g') FROM 3)
            ELSE 
                REGEXP_REPLACE(phone, '[^0-9]', '', 'g')
        END AS phone_clean,
                CASE
            WHEN fax LIKE '00%' THEN 
                '+' || SUBSTRING(REGEXP_REPLACE(fax, '[^0-9]', '', 'g') FROM 3)
            ELSE 
                REGEXP_REPLACE(fax, '[^0-9]', '', 'g')
        END AS fax_clean
    FROM {{source('northwild_data','customers')}}
)
SELECT *
FROM phone_cleaning