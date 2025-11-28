-- EXTRACT YEAR, MONTH FOR TIME-SERIES ANALYSIS
ALTER TABLE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
ADD COLUMN year INTEGER;

UPDATE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
SET year = EXTRACT(YEAR FROM date);

ALTER TABLE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
ADD COLUMN month INTEGER;

UPDATE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
SET month = EXTRACT(MONTH FROM date);

-- CREATE PROVINCE-LEVEL PROFITABILITY CLASSIFICATION
ALTER TABLE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
ADD COLUMN profitability_segment STRING;

UPDATE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
SET profitability_segment =
  CASE
    WHEN nett_profit >= 200000 THEN 'High'
    WHEN nett_profit >= 75000 THEN 'Medium'
    ELSE 'Low'
  END;

-- CREATE DISCOUNT-VALUE BUCKET FOR SEGMENTATION
ALTER TABLE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
ADD COLUMN discount_bucket STRING;

UPDATE `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
SET discount_bucket =
  CASE
    WHEN discount_percentage = 0 THEN '0%'
    WHEN discount_percentage <= 0.10 THEN '0–10%'
    WHEN discount_percentage <= 0.30 THEN '10–30%'
    ELSE '30%+'
  END;
