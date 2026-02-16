
SELECT *
FROM (
    SELECT
        state,
        name,
        stars,
        review_count,
        RANK() OVER (PARTITION BY state ORDER BY stars DESC, review_count DESC) AS state_rank
    FROM business_parsed
    WHERE stars IS NOT NULL
) categories_table
WHERE state_rank <= 3
ORDER BY state, state_rank;


WITH category_counts AS (
    SELECT
        state,
        category,
        COUNT(*) AS business_count
    FROM business_parsed
    WHERE category IS NOT NULL
    GROUP BY state, category
)

SELECT
    state,
    category,
    business_count,
    ROUND(business_count * 100.0 / SUM(business_count) OVER (PARTITION BY state),2) AS percentage_within_state
FROM category_counts
ORDER BY state, percentage_within_state DESC;
