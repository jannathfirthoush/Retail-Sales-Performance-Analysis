-- Project: Retail Sales Performance Analysis
-- File: 03_overall_business_analysis.sql
-- Purpose: Analyse overall business performance --

-- 1. Overall business performance

SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales;


-- 2. Overall profit margin

SELECT
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM retail_sales;