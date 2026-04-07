WITH raw_reviews AS (
    SELECT
        LISTING_ID       AS listing_id,
        DATE             AS review_date,
        REVIEWER_NAME    AS reviewer_name,
        COMMENTS         AS review_text,
        SENTIMENT        AS review_sentiment
    FROM AIRBNB.RAW.RAW_REVIEWS
)
SELECT
    listing_id,
    review_date,
    reviewer_name,
    review_text,
    review_sentiment
FROM raw_reviews