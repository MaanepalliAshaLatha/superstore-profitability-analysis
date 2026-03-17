# 📊 Superstore Data Analysis: Impact of Discount on Profitability

## 🔍 Project Overview
This project analyzes the impact of discounting on profitability using the Global Superstore dataset. The objective is to identify loss-driving factors and evaluate whether losses are caused by discount strategies or product-level pricing issues.

---

## 🎯 Business Problem
Despite high sales volume, the business is experiencing significant losses.  
This analysis aims to:
- Identify the relationship between discount and profit
- Detect the discount threshold where losses begin
- Find products and regions responsible for losses
- Recommend data-driven pricing and discount strategies

---

## 📂 Dataset
- **File:** `Global_Superstore2.csv`
- Contains sales transactions including:
  - Sales
  - Profit
  - Discount
  - Category & Sub-category
  - Region
  - Order details

---

## 🛠️ Tools Used
- SQL (MySQL)
- Data Analysis & Aggregation
- Business Problem Solving

---

## 🔑 Key Analysis Steps

1. **Overall Performance Analysis**
   - Sales, profit, and margin by category

2. **Discount Impact Analysis**
   - Profitability across discount ranges

3. **Threshold Identification**
   - Identified critical discount tipping point (40%)

4. **Product-Level Analysis**
   - Identified loss-making products and categories

5. **Regional Analysis**
   - Compared high-discount impact across regions

6. **Deep Dive Analysis**
   - Detailed breakdown for high-loss regions (Central)

---

## 📊 Key Insights

- 📉 **84.83% of total losses come from discounts ≥ 40%**, making it the critical threshold
- ⚠️ High-margin products (Machines, Phones) turn loss-making at higher discount levels
- 🪑 Furniture products (Tables) show low margins and become unprofitable even at moderate discounts
- 📊 Losses increase significantly as discount levels rise (loss amplification effect)

---

## 💡 Business Recommendations

- ✅ **Cap discounts**
  - 20% for low-margin products (e.g., Tables)
  - 40% for high-margin products (e.g., Machines, Phones)

- ✅ **Optimize product strategy**
  - Bundle weak products (e.g., Tables + Bookcases)
  - Avoid aggressive discounting on low-margin items

- ✅ **Pricing Optimization**
  - Re-evaluate cost and pricing for consistently loss-making products

---

## 📁 Project Files

- `super_store_analysis.sql` → Complete SQL analysis
- `Global_Superstore2.csv` → Dataset
- `Data_Analysis.docx` → Business insights and summary

---

## 🚀 Key Learning Outcomes

- Applied SQL for real-world business problem solving  
- Identified profitability drivers using data  
- Developed structured analytical thinking  
- Improved business storytelling and decision-making  

---

## 📌 Conclusion

This analysis highlights that losses are not random but driven by excessive discounting and product-level inefficiencies. A targeted discount and pricing strategy is required to improve profitability.

---

## 👤 Author
- Aspiring Data Analyst with focus on SQL, business analysis, and data-driven decision making
