-- Project: Retail Sales Performance Analysis
-- File: 06_monthly_shipping_analysis.sql
-- Purpose: Analyse monthly trends and shipping performance -- 


-- 1. Monthly sales and profit trends

SELECT
    DATE_TRUNC('month', order_date)::date AS sales_month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


-- 2. Shipping mode order count

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS unique_orders
FROM retail_sales
GROUP BY ship_mode
ORDER BY unique_orders DESC;


-- 3. Sales and profit by shipping mode

SELECT
    ship_mode,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;


-- 4. Average profit per order by shipping mode

SELECT
    ship_mode,
    SUM(profit) /
        NULLIF(COUNT(DISTINCT order_id), 0)
        AS avg_profit_per_order
FROM retail_sales
GROUP BY ship_mode
ORDER BY avg_profit_per_order DESC;


-- 5. Average shipping duration

SELECT
    ship_mode,
    ROUND(
        AVG(ship_date - order_date),
        2
    ) AS average_shipping_days
FROM retail_sales
GROUP BY ship_mode
ORDER BY average_shipping_days DESC;
