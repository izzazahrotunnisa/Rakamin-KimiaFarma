# Rakamin-KimiaFarma
Project Based Internship: Kimia Farma - Big Data Analytics

# Kimia Farma Business Performance Analysis 2020–2023
This project analyzes Kimia Farma’s business performance from 2020 to 2023 using data integrated through Google BigQuery. After importing and aggregating four datasets into a single analytical table containing key attributes such as transaction_id, date, branch_id, and branch_name, the data was connected to Google Looker Studio as the primary visualization source. The resulting interactive dashboard presents financial, operational, and branch-level insights over the four-year period, with a design tailored to support clear trend identification and decision-oriented interpretation.

---

## Project Background and Problem Statement
The dashboard addresses key analytical questions surrounding Kimia Farma’s branch-level performance and revenue progression over time, including:

- Year-over-year revenue trends to understand annual business performance shifts.
- Top provincial branches ranked by:
  - total transaction volume
  - net sales
- Branches with strong customer ratings even when transaction counts are relatively low — revealing quality-over-quantity insights.
- Geo-spatial profit distribution by province, providing a geographic view of profitability across Indonesia.

These insights enable a deeper understanding of performance disparities, operational efficiency, and strategic growth opportunities within the organization.

---

## Dataset Information  
The datasets used in this project were provided through the assignment materials, consisting of four source files:

- `kf_final_transaction.csv`
- `kf_inventory.csv`
- `kf_kantor_cabang.csv`
- `kf_product.csv`

Together, these datasets form an analytical table with approximately 33 million rows and 17 columns, processed within Google BigQuery.

Key variables in the combined dataset include:

- `transaction_id`
- `date`
- `branch_id`
- `branch_name`
- `kota`
- `provinsi`
- `rating`
- `rating_cabang`
- `product_id`
- `product_name`
- `product_category`
- `actual_price`
- `discount_percentage`

These variables enable detailed analysis across:
- individual transactions
- product-level performance
- branch-level comparisons

This structure is essential for generating accurate visualizations and uncovering business insights related to revenue, operations, and geographic performance distribution.

---

## Tools Used 
This project utilizes Google BigQuery for dataset loading, data merging, and verification of data integrity, as well as for performing cleaning and transformation operations on the raw input files. The processed analytical table is then connected to Google Looker Studio, which serves as the primary tool for building dynamic visualizations, interactive charts, and performance dashboards used to communicate insights intuitively and effectively.

---

## Methodology & Approach 
1. Import the four CSV datasets into Google BigQuery  
2. Validate raw data structure and formats  
3. Clean datasets by removing irrelevant fields and fixing inconsistencies  
4. Standardize formats such as date, text, and numeric fields  
5. Perform SQL-based transformations to compute metrics such as net sales and profit  
6. Join transaction, product, and branch tables into a unified analytical dataset  
7. Execute data quality and accuracy checks  
8. Use analytical SQL queries to answer business questions  
9. Connect the final analytical table to Looker Studio  
10. Design dashboard visualizations for trends, performance, revenue, and ratings  

---

## Features of Dashboard
The dashboard provides an interactive environment for exploring business performance through both high-level KPIs and detailed breakdowns.
- Users can view key indicators such as:
  - Total net sales  
  - Net profit  
  - Total transactions  

- Filters are available to refine analysis by:
  - Province  
  - Product category  
  - Branch rating  
  - Date range  

- Included visualizations:
  - Year-over-year revenue trends  
  - Monthly sales performance  
  - Top 10 provincial branches by net sales and transaction volume  
  - Top product performance  
  - Geo heat map of profit distribution across Indonesia  

- Additional insight:
  - A comparative ratings table shows branches with strong customer ratings despite low transaction activity, enabling deeper operational analysis.

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
The analysis revealed several key insights:
- Geographic market dominance:
  - Jawa Barat achieved the strongest overall performance, generating approximately Rp 94.9 billion in net sales.
  - It also led in total transaction volume with 198.7 thousand transactions over the four-year period.

- Revenue trend behavior:
  - Year-over-year performance remained generally stable.
  - Revenue peaked in January–February 2022 at around Rp 7 billion.
  - The lowest point occurred in March 2022, at just under Rp 6 billion.

- Product performance:
  - Psycholeptic drugs emerged as the highest-demand product category.
  - Within that category, hypnotic and sedative products recorded 134.8 thousand transactions.

Overall, these findings illustrate regional performance strength, temporal revenue fluctuations, and customer product demand trends, offering valuable insight into Kimia Farma’s strategic business direction.

---

## Future Improvements
Future enhancements for this project include:
- Expanding data sources:
  - Incorporating inventory and supplier datasets to evaluate sales in relation to stock availability and supply-chain performance.

- Improving data infrastructure:
  - Implementing automated data refresh between BigQuery and Looker Studio to support near real-time dashboard updates.

- Applying advanced analytics:
  - Introducing predictive modeling to forecast future sales, profitability, and performance trends rather than solely analyzing historical data.

- Enhancing dashboard interactivity:
  - Adding deeper drill-down functionality, filters, and customized user views for tailored insights and branch-level decision-making.

These improvements will significantly increase the analytical depth, operational relevance, and strategic usefulness of the platform.


## Dashboard
<img width="818" height="693" alt="Screenshot 2025-11-28 at 21 46 19" src="https://github.com/user-attachments/assets/0ce9df40-a597-4a0a-96a9-8ef5d9a8f8d7" />

### Presentation Slides
(https://docs.google.com/presentation/d/1qC73feR2rNQs8PdJdSiFVJTu4DBnKPm1M-fKldYvyVM/edit?slide=id.p11#slide=id.p11)



## Author's Contact Details
  - Izza Zahrotunnisa
  - Email: izzazahratunnisa@gmail.com
  - Phone Number: +6281319317614
  - Linkedin: https://www.linkedin.com/in/izzazahrotunnisa/
