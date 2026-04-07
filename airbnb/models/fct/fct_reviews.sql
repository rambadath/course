{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
WITH src_reviews AS (
  SELECT LISTING_ID,
	REVIEW_DATE,
	REVIEWER_NAME,
	REVIEW_TEXT,
	REVIEW_SENTIMENT FROM {{ ref('src_reviews') }}
)
SELECT
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
  listing_id,
  review_date,
  reviewer_name,
  review_text,
  review_sentiment
WHERE review_text is not null

{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}