CREATE OR REPLACE TABLE business AS
SELECT *
FROM read_json_auto('C:/Users/Admin/Downloads/yelp_dataset/yelp_academic_dataset_business.json');
