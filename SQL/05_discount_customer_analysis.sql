-- Project: Retail Sales Performance Analysis
-- File: 05_discount_customer_analysis.sql
-- Purpose: Analyse discount impact and customer performance
-- 

-- 1. Discount impact on sales and profitability

SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM retail_sales
GROUP BY discount
ORDER BY discount;


-- 2. Top 10 customers by sales

SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 3. Customer ranking using CTE

WITH customer_summary AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND(
            SUM(profit) / NULLIF(SUM(sales), 0) * 100,
            2
        ) AS profit_margin
    FROM retail_sales
    GROUP BY customer_id, customer_name
)
SELECT
    customer_id,
    customer_name,
    total_sales,
    total_profit,
    profit_margin,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS customer_rank
FROM customer_summary
ORDER BY customer_rank
LIMIT 10;
