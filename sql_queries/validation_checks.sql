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
