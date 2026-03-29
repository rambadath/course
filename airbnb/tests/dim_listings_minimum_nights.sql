SELECT
    *
FROM
    {{ ref('dim_list_cleansed') }}
WHERE minimum_nights < 1
LIMIT 10