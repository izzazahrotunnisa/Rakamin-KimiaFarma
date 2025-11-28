## data_cleaning_preview.sql
-- VIEW FIRST 20 ROWS TO ASSESS DATA FORMATTING
SELECT *
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
LIMIT 20;

TO REMOVE DUPLICATES
-- CREATE OR REPLACE TABLE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_inventory_cleaned` AS
SELECT *
FROM (
  SELECT *,
    ROW_NUMBER() OVER(
      PARTITION BY product_id
      ORDER BY last_update_timestamp DESC
    ) AS rn
  FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_inventory`
)
WHERE rn = 1;
