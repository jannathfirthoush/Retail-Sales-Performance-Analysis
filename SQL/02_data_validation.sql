-- Project: Retail Sales Performance Analysis
-- File: 02_data_validation.sql
-- Purpose: Validate data imported into PostgreSQL
-- Table: retail_sales --

-- 1. Check total number of records

SELECT COUNT(*) AS total_records
FROM retail_sales;


-- 2. Check completely duplicated records

SELECT COUNT(*) AS duplicate_rows
FROM (
    SELECT *
    FROM retail_sales
    GROUP BY ALL
    HAVING COUNT(*) > 1
) AS duplicates;


-- 3. Check missing values in important columns

SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_order_date,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE sales IS NULL) AS missing_sales,
    COUNT(*) FILTER (WHERE profit IS NULL) AS missing_profit
FROM retail_sales;


-- 4. Check invalid dates

SELECT COUNT(*) AS invalid_dates
FROM retail_sales
WHERE order_date IS NULL
   OR ship_date IS NULL
   OR ship_date < order_date;


-- 5. Check negative sales

SELECT COUNT(*) AS negative_sales
FROM retail_sales
WHERE sales < 0;


-- 6. Check invalid quantities

SELECT COUNT(*) AS invalid_quantity
FROM retail_sales
WHERE quantity <= 0;


-- 7. Check invalid discount values

SELECT COUNT(*) AS invalid_discount
FROM retail_sales
WHERE discount < 0
   OR discount > 1;


-- 8. Combined numeric validation

SELECT
    COUNT(*) FILTER (WHERE sales < 0) AS negative_sales,
    COUNT(*) FILTER (WHERE quantity <= 0) AS invalid_quantity,
    COUNT(*) FILTER (
        WHERE discount < 0 OR discount > 1
    ) AS invalid_discount
FROM retail_sales;
