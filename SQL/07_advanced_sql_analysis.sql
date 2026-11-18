-- Project: Retail Sales Performance Analysis
-- File: 07_advanced_sql_analysis.sql
-- Purpose: Advanced SQL business analysis -- 

-- 1. Top 5 products within each category using RANK()

WITH product_ranking AS (
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales,
        RANK() OVER (
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS product_rank
    FROM retail_sales
    GROUP BY category, product_name
)
SELECT *
FROM product_ranking
WHERE product_rank <= 5
ORDER BY category, product_rank;


-- 2. Running monthly sales using SUM() OVER()

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS sales_month,
        SUM(sales) AS total_sales
    FROM retail_sales
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    sales_month,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY sales_month
    ) AS running_total_sales
FROM monthly_sales
ORDER BY sales_month;


-- 3. Month-over-month sales comparison using LAG()

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS sales_month,
        SUM(sales) AS total_sales
    FROM retail_sales
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    sales_month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_month
    ) AS previous_month_sales,
    total_sales - LAG(total_sales) OVER (
        ORDER BY sales_month
    ) AS sales_change
FROM monthly_sales
ORDER BY sales_month;


-- 4. Regional revenue contribution

SELECT
    region,
    SUM(sales) AS total_sales,
    ROUND(
        SUM(sales) /
        NULLIF(SUM(SUM(sales)) OVER (), 0) * 100,
        2
    ) AS revenue_contribution_percentage
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;


-- 5. Top 3 customers using CTE and RANK()

WITH customer_summary AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND(
            SUM(profit) /
            NULLIF(SUM(sales), 0) * 100,
            2
        ) AS profit_margin
    FROM retail_sales
    GROUP BY customer_id, customer_name
),
customer_ranking AS (
    SELECT
        *,
        RANK() OVER (
            ORDER BY total_sales DESC
        ) AS customer_rank
    FROM customer_summary
)
SELECT *
FROM customer_ranking
WHERE customer_rank <= 3
ORDER BY customer_rank;
