
-- =====================================================
-- Project: Retail Sales Performance Analysis
-- File: 04_category_region_product_analysis.sql
-- Purpose: Analyse category, region and product performance
-- =====================================================


-- 1. Category and sub-category performance

SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY category, sub_category
ORDER BY category, total_sales DESC;


-- 2. Regional performance

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;


-- 3. Top 10 cities by sales

SELECT
    city,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;


-- 4. Top 10 products by sales

SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
