# SQL Queries

## create_analytic_table.sql
-- TO CREATE THE FINAL ANALYSIS TABLE FROM THE 4 DATASETS PROVIDED
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


## create_tables.sql
-- TO CALCULATE YEAR-OVER-YEAR REVENUE GROWTH
  WITH yearly AS (
  SELECT 
    EXTRACT(YEAR FROM date) AS year,
    SUM(nett_sales) AS revenue
  FROM `KimiaFarma_Dataset.kf_analysis_table`
  GROUP BY year
)
SELECT
  year,
  revenue,
  ROUND(
    100 * (revenue - LAG(revenue) OVER (ORDER BY year)) 
    / LAG(revenue) OVER (ORDER BY year),
  2) AS YoY_revenue_growth
FROM yearly
ORDER BY year;

## validation_checks.sql
-- ENSURING THE DATA IS CORRECT
SELECT
  AVG(nett_sales) AS avg_nett_sales,
  AVG(nett_profit) AS avg_nett_profit
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`;

### CHECK NET SALES & NET PROFIT DISTRIBUTION
SELECT
  AVG(nett_sales) AS avg_nett_sales,
  AVG(nett_profit) AS avg_nett_profit
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`;

### PRICE DISTRIBUTION - RANGE OF PRICES 
SELECT 
  MIN(actual_price) AS min_price,
  AVG(actual_price) AS avg_price,
  MAX(actual_price) AS max_price
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`;

### TOTAL SALES REVENUE
SELECT SUM(nett_sales) AS total_sales
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`;

### TOTAL NET PROFIT 
SELECT SUM(nett_profit) AS total_net_profit
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`;

### SALES BY PROVINCE
SELECT provinsi, SUM(nett_sales) AS total_sales
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
GROUP BY provinsi
ORDER BY total_sales DESC;

### TOP 10 BEST SELLING PRODUCTS
SELECT 
  product_name,
  SUM(nett_sales) AS sales
FROM `rakaminkfanalytics-2.KimiaFarma_Dataset.kf_analysis_table`
GROUP BY product_name
ORDER BY sales DESC
LIMIT 10;
