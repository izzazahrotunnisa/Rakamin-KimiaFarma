# Rakamin-KimiaFarma
Rakaman PBI Final Project

# Kimia Farma Business Performance Analysis 2020–2023
This project analyzes Kimia Farma’s business performance from 2020 to 2023 using data integrated through Google BigQuery. After importing and aggregating four datasets into a single analytical table containing key attributes such as transaction_id, date, branch_id, and branch_name, the data was connected to Google Looker Studio as the primary visualization source. The resulting interactive dashboard presents financial, operational, and branch-level insights over the four-year period, with a design tailored to support clear trend identification and decision-oriented interpretation.

---

## Project Background and Problem Statement
The dashboard addresses key analytical questions surrounding Kimia Farma’s branch-level performance and revenue progression over time. Specifically, it investigates year-over-year revenue trends, identifies the top provincial branches in terms of transaction volume and net sales, and highlights branches that maintain strong customer ratings despite low transaction counts. Additionally, a geo-spatial view of total profit by province provides a geographical perspective on profitability distribution across Indonesia. This enables a deeper understanding of performance disparities, operational efficiency, and strategic growth opportunities within the organization. 

---

## Dataset Information  
The datasets used in this project were provided through the assignment materials, consisting of four source files: `kf_final_transaction.csv`, `kf_inventory.csv`, `kf_kantor_cabang.csv`, and `kf_product.csv`. Together, these datasets form an analytical table with approximately **33 million rows and 17 columns**, processed within Google BigQuery. The combined dataset includes key variables such as `transaction_id`, `date`, `branch_id`, `branch_name`, `kota`, `provinsi`, `rating`, `rating_cabang`, `product_id`, `product_name`, `product_category`, `actual_price`, and `discount_percentage`. These variables enable detailed transactional, product-level, and branch-level analysis essential for visualizing performance and identifying business insights.

---

## Tools Used 
This project utilizes **Google BigQuery** for dataset loading, data merging, and verification of data integrity, as well as for performing cleaning and transformation operations on the raw input files. The processed analytical table is then connected to **Google Looker Studio**, which serves as the primary tool for building dynamic visualizations, interactive charts, and performance dashboards used to communicate insights intuitively and effectively.

---

## Methodloy & Approach 
The project began by importing the four raw CSV datasets into Google BigQuery, where they were validated, cleaned, and structured into a unified analytical table. Data transformations were performed through SQL to standardize formats, remove irrelevant fields, compute key performance metrics such as net sales and profit, and ensure accurate joins between transaction, product, and branch information. Once data quality checks were completed, analytical SQL queries were used to generate insights required by the business questions. The final analytical table was then connected to Google Looker Studio, where visualizations were designed to illustrate yearly trends, provincial performance, revenue comparisons, and branch ratings, resulting in an interactive dashboard optimized for clarity and interpretability.

---

## Features of Dashboard
The dashboard provides an interactive environment for exploring business performance through both high-level KPIs and detailed breakdowns. Users can view total net sales, net profit, and total transactions through scorecards, while applying filters such as province, product category, branch rating, and date range to refine the analysis. The dashboard includes a series of visualizations such as year-over-year revenue trends, monthly sales performance, top 10 provincial branches by net sales and transaction volume, top product performance, and a geo heat map of profit distribution across Indonesia. Additionally, a comparative ratings table highlights branches with strong customer ratings despite low transaction activity, enabling deeper operational insight.

---

## Instructions to Run / View
1. Import the four original CSV files into Google BigQuery as separate tables and ensure the schema is properly detected and assigned.  
2. Use SQL in BigQuery to perform the necessary data cleaning, type verification, and transformations.  
3. Create the final combined analytical table by joining the transaction, product, and branch datasets.  
4. Confirm data quality by checking row counts, null values, and metric consistency.  
5. Open Google Looker Studio and connect BigQuery as the data source.  
6. Select the final analytical table as the dataset for visualization.  
7. Recreate or explore the dashboard visualizations interactively, applying filters and reviewing insights across the 2020–2023 period.  

---

## Key Insights
The analysis revealed that Jawa Barat consistently dominated business performance, generating the highest net sales of approximately Rp 94.9 billion and leading in total transactions with 198.7 thousand over the four-year period. Year-over-year revenue trends remained generally stable, with the peak occurring in January–February 2022 at around Rp 7 billion, while March 2022 marked the lowest point at just under Rp 6 billion. In terms of product performance, psycholeptic drugs—specifically hypnotic and sedative categories—emerged as the best-selling products with 134.8 thousand total transactions. These findings provide a clear view of geographic market strength, temporal revenue behavior, and customer demand patterns that shape Kimia Farma’s overall operational strategy.

---

## Future Improvements
Future enhancements for this project include expanding the scope of analysis by incorporating additional datasets such as inventory levels or supplier data, so that operational performance can be evaluated not only from sales outcomes but also from stock availability and supply-chain efficiency. Additionally, further improvements may include implementing automated data refresh from BigQuery into Looker Studio for real-time monitoring, as well as adding predictive modeling to forecast future performance in order for trends to be anticipated rather than only observed retrospectively. Also, integrating deeper drill-down interactivity and customizable user views would allow end-users to explore insights at a more granular level, resulting in decision-making becoming more data-driven and branch-specific rather than generalized.

## Author's Contact Details
Izza Zahrotunnisa
Email: izzazahratunnisa@gmail.com
Phone Number: +6281319317614
Linkedin: https://www.linkedin.com/in/izzazahrotunnisa/
