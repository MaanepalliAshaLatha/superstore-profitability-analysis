🏪 Global Superstore Profitability Analysis

Tools: MySQL, Excel, Pivot Tables
Dataset: 51,290 orders from 147 countries (2012–2015)
Goal: Find why a high-revenue global store was losing money.

📌 Business Problem
The Global Superstore had strong sales but inconsistent profitability. The goal was to identify which products, discount levels, and regions were driving losses, and measure the extent of the loss.

🔍 Key Findings
84.83% of all losses were driven by discounts of 40% or more.
Tables were the highest loss category, with approximately −$1.11L under high-discount conditions.
Machines were the second-highest loss contributor, with around −$72K.
Technology was the highest revenue-generating category (around $827K).
The Consumer segment accounted for 51% of all orders.

🛠️ SQL Techniques Used
CTEs (WITH clause) were used to cleanly isolate discount tiers.
CASE WHEN logic was applied to classify orders into discount bands (0–10%, 10–20%, 20–40%, 40%+).
GROUP BY with SUM(Profit) was used to aggregate losses by sub-category and discount band.
ORDER BY was used to rank sub-categories based on total loss.
JOINs were used to connect product and order tables for detailed analysis.

📊 Excel Dashboard
A multi-sheet Excel workbook was created with the following analyses:

Revenue by Segment (Consumer, Corporate, Home Office)
Revenue by Category (Furniture, Office Supplies, Technology)
Revenue by Region (West, East, Central, South)
A lookup tool for segment-level drill-down
Above-Average sales flag and Value-Tier classification columns

💡 Business Recommendation

Cap discounts at 30% for Tables and Machines.
Flag sub-categories with negative margins for pricing review.
Estimated margin recovery of ₹80,000–90,000 without significant volume loss.

📁 Files in This Repo
Global_Superstore2.csv – Raw dataset (51,290 rows)
queries.sql – All SQL queries used
Analysis.xlsx – Excel pivot analysis and dashboard
README.md – Documentation
