# SQL Queries

## create_analytic_table.sql
CREATE OR REPLACE TABLE
  `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table` AS

SELECT 
  t.transaction_id,
  t.date,
  t.branch_id,
  b.branch_name,
  b.kota,
  b.provinsi,
  b.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  p.product_category,
  p.price AS actual_price,
  t.discount_percentage,

  CASE
    WHEN p.price <= 50000 THEN 10
    WHEN p.price <= 100000 THEN 15
    WHEN p.price <= 300000 THEN 20
    WHEN p.price <= 500000 THEN 25
    ELSE 30
  END AS persentase_gross_laba,

  (p.price * (1 - t.discount_percentage)) AS nett_sales,

  (p.price * (1 - t.discount_percentage)) *
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price <= 100000 THEN 0.15
    WHEN p.price <= 300000 THEN 0.20
    WHEN p.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS nett_profit,

  t.rating

FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_final_transaction` AS t
LEFT JOIN `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_kantor_cabang` AS b
  ON t.branch_id = b.branch_id
LEFT JOIN `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_product_data` AS p
  ON t.product_id = p.product_id;

## validation_checks.sql
Ensuring the dataset is correct
SELECT
  AVG(nett_sales) AS avg_nett_sales,
  AVG(nett_profit) AS avg_nett_profit
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`;

## data_cleaning_preview.sql
View first 20 rows to assess data formatting
SELECT *
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
LIMIT 20;
