WITH raw_hosts AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_HOSTS
)
SELECT 
    ID AS HOST_ID,
    NAME AS HOST_NAME
FROM
    raw_hosts