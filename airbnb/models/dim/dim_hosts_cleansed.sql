{{
  config(
    materialized = 'view'
    )
}}

WITH src_listings AS (
    SELECT * FROM {{ ref('src_hosts') }}
)
SELECT 
  HOST_ID,
  NVL(HOST_NAME,'Anonymous') AS HOST_NAME  
FROM
  src_hosts