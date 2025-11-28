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
