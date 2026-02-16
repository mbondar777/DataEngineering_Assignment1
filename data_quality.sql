SELECT
    COUNT(*) AS total_rows,
    COUNT(business_id) AS non_null_business_id,
    COUNT(name) AS non_null_name,
    COUNT(city) AS non_null_city,
    COUNT(state) AS non_null_state,
    COUNT(stars) AS non_null_stars,
    COUNT(review_count) AS non_null_review_count
FROM business_parsed;

SELECT
    business_id,
    category,
    COUNT(*) AS duplicate_count
FROM business_parsed
GROUP BY business_id, category
HAVING COUNT(*) > 1;

SELECT *
FROM business_parsed
WHERE stars < 0 OR stars > 5;

SELECT *
FROM business_parsed
WHERE review_count < 0;

SELECT *
FROM business_parsed
WHERE category IS NULL OR category = '';
