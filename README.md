# Retail Data Analysis Using SQL

## Project Overview

This project involves a comprehensive SQL-based analysis of a retail dataset to uncover insights at both **product** and **regional** levels. The objective is to support strategic decision-making around **product expansion**, **promotional pricing**, and **market optimization**.



## Business Objective

To analyze product and regional sales data to uncover opportunities for **profit optimization**, **strategic product expansion**, and **regional performance improvement**. The goal is to identify:

- Top-performing and underperforming product categories and sub-categories.
- Regions that are under-penetrated or inefficient in terms of sales and profitability.
- Actionable strategies to drive growth.



## Problem Context

A retail company operates across multiple regions and offers a wide variety of product categories. While overall revenue is growing, there are untapped opportunities in certain markets and inefficiencies in others. There is a need to:

- Evaluate the **profitability vs. sales** trade-off at the product level.
- Investigate **regional differences** in sales performance, discounting strategies, and profit margins.
- Make data-driven decisions around **expansion and promotion.



## Tools & Techniques

- **SQL** (Window Functions, Aggregations, Ranking, Grouping)
- **Business Intelligence Approach**: Focused on real-world retail KPIs—sales, profit margin, discounts, and category penetration



## Analysis Summary

### Product-Level Analysis
- **Top categories by sales**: `Protein`, `Snacks`, and `Food Grains`
- **Top categories by profit margin**: `Snacks`, `Harvest`, and `Beverages`
- Used **window functions** to rank **top 3 sub-categories** by profit margin within each category.

![image_alt]("images/top_3_sub_cat.png")

### Regional Analysis
- Identified **top 3 categories by profit margin per region**
- North region stood out with the **highest profit margin (31%)** but had **only one category and one city (Vellore)**—an outlier with only one recorded transaction.
- Compared **total sales, average discounts, and profit margins** across all regions.

![image_alt]("KPI_regionwise.png")



## Key Insights

- **North**: Likely a data anomaly—only one transaction, but shows potential if verified.
- **South**: Under-leveraged, high potential for expansion with improved promotions.
- **Central**: Highest discounts but lowest profit margin and underwhelming sales—needs urgent optimization.
- **East & West**: High sales with moderate profitability—mature markets that should be maintained and fine-tuned.



## Conclusion & Action Plan

| Region   | Strategy         | Action                                                              |
|----------|------------------|---------------------------------------------------------------------|
| North    | Investigate      | assess expansion feasibility                         |
| South    | Expand           | Boost sales through targeted promotions                             |
| Central  | Optimize         | Reduce discounts, reassess product mix                              |
| East     | Maintain & refine| Monitor product performance and improve profit margins              |
| West     | Maintain & refine| Reduce discount leakage and protect margins                         |

---

## File Structure

