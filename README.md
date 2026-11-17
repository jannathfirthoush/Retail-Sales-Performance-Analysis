# Retail Sales Performance Analysis

**Data Analytics Portfolio Project | Excel | PostgreSQL | Power BI**

## 1. Project Overview

This project focuses on analyzing retail sales data to evaluate business performance, identify sales and profitability trends, and generate actionable business insights.

The analysis uses a dataset containing 5,000 records and 21 columns, covering customer orders, products, sales, discounts, profits, regions, and shipping information.

### Business Problem

A retail company wants to understand its overall sales and profitability performance. However, it needs better insights into which products and categories generate the most revenue, which regions perform well, and how discounts affect profitability.

The objective of this project is to analyze historical retail sales data, identify key business trends, highlight areas of improvement, and provide data-driven recommendations to support business decision-making.

### Project Objectives

- Evaluate overall sales and profitability.
- Identify top-performing and underperforming products.
- Analyze sales performance across regions and categories.
- Understand the relationship between discounts and profit.
- Examine customer purchasing patterns.
- Analyze monthly sales and profit trends.
- Provide actionable recommendations to improve business performance.


## 2. Dataset Description

The dataset contains 5,000 records and 21 columns representing retail transactions, customer details, product information, sales, discounts, profits, and shipping details.

### Dataset Details

| Attribute | Description |
|---|---|
| Total Records | 5,000 |
| Total Columns | 21 |
| Data Type | Structured Data |
| Domain | Retail |
| Data Format | CSV |

### Column Description

| Column Name | Description |
|---|---|
| Row ID | Unique row identifier |
| Order ID | Unique order identifier |
| Order Date | Date when the order was placed |
| Ship Date | Date when the order was shipped |
| Ship Mode | Shipping method |
| Customer ID | Unique customer identifier |
| Customer Name | Customer name |
| Segment | Customer segment |
| Country/Region | Country or region |
| City | Customer city |
| State/Province | State or province |
| Postal Code | Postal code |
| Region | Sales region |
| Product ID | Unique product identifier |
| Category | Product category |
| Sub-Category | Product sub-category |
| Product Name | Product name |
| Sales | Revenue generated from sales |
| Quantity | Number of units purchased |
| Discount | Discount applied to the product |
| Profit | Profit or loss generated |

### Data Preparation

The dataset was cleaned and prepared before analysis.

- Checked for missing values.
- Identified and removed 5 duplicate records.
- Corrected column data types.
- Checked category and sub-category consistency.
- Validated date fields.
- Checked sales, quantity, discount, and profit values.


## 3. Tools and Technologies Used

The following tools were used for data preparation, analysis, and visualization.

### Microsoft Excel
- Data cleaning and preprocessing.
- Identifying and removing duplicate records.
- Handling missing values.
- Data validation and formatting.
- Initial data exploration.

### PostgreSQL
- Storing and managing the retail dataset.
- Writing SQL queries for business analysis.
- Performing aggregations and calculations.
- Analyzing sales, profit, customers, products, and regions.
- Applying advanced SQL techniques to identify business trends.

### Microsoft Power BI
- Developing interactive dashboards.
- Creating key performance indicators (KPIs).
- Visualizing sales and profitability trends.
- Analyzing business performance using charts and slicers.


## 4. Business Questions

The following business questions were explored to understand retail sales performance and profitability.

### Overall Business Performance
1. What are the total sales, total profit, and total quantity sold?
2. What is the overall profit margin?

### Product and Category Analysis
3. Which product categories generate the highest sales and profit?
4. Which sub-categories perform well and which generate losses?
5. Which products generate the highest and lowest revenue?
6. Which products contribute the highest profit?

### Regional Analysis
7. Which regions generate the highest sales and profit?
8. Which cities contribute the most to overall sales?

### Discount Analysis
9. How do discounts affect sales and profitability?
10. Which discount levels are associated with lower or negative profits?

### Customer Analysis
11. Who are the highest-value customers based on sales?
12. Which customers contribute the most profit?

### Time-Based Analysis
13. How do sales and profit change month over month?
14. Which months record the highest and lowest sales?

### Shipping Analysis
15. How does shipping mode relate to sales and profitability?


## 5. SQL Techniques Used

PostgreSQL was used to perform business analysis and extract meaningful insights from the retail dataset.

The following SQL concepts and techniques were applied:

### Basic SQL
- SELECT statements
- WHERE conditions
- ORDER BY
- DISTINCT
- LIMIT

### Aggregate Functions
- SUM()
- AVG()
- COUNT()
- MIN()
- MAX()

### Grouping and Filtering
- GROUP BY
- HAVING
- Conditional aggregation

### Conditional Expressions
- CASE WHEN
- COALESCE()

### Common Table Expressions
- WITH (CTEs) to organize complex queries and simplify analysis.

### Date and String Functions
- Date extraction and formatting
- Monthly sales and profit analysis
- String manipulation functions

### Window Functions
- RANK() for ranking products, customers, and regions.
- SUM() OVER() for calculating running totals.
- LAG() for month-over-month comparisons.
- PARTITION BY for analyzing performance within groups.
