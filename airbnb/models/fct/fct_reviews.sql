{{ config(
    materialized = 'incremental',
    on_schema_change = 'fail',
    unique_key = 'review_id'
) }}

WITH src_reviews AS (
    SELECT
        listing_id,
        review_date,
        reviewer_name,
        review_text,
        review_sentiment
    FROM {{ ref('src_reviews') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'listing_id',
        'review_date',
        'reviewer_name',
        'review_text'
    ]) }} AS review_id,
    listing_id,
    review_date,
    reviewer_name,
    review_text,
    review_sentiment
FROM src_reviews
WHERE review_text IS NOT NULL

{% if is_incremental() %}
  AND review_date > (SELECT max(review_date) FROM {{ this }})
{% endif %}