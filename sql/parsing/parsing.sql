CREATE OR REPLACE TABLE business_parsed AS
SELECT
    business_id,
    name,
    city,
    state,
    CAST(stars AS DOUBLE) AS stars,
    CAST(review_count AS INTEGER) AS review_count,
    hours.Monday AS monday_hours,
    attributes->>'RestaurantsTakeOut' AS restaurants_takeout,
    TRIM(category) AS category
FROM business,
UNNEST(string_split(categories, ',')) AS categories_table(category)
WHERE categories IS NOT NULL;
