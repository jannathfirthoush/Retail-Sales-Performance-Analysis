-- Project: Retail Sales Performance Analysis
-- File: 01_table_creation.sql
-- Purpose: Create the retail sales table -- 

CREATE TABLE retail_sales (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(100),
	postal_code VARCHAR(20),
    state VARCHAR(100),
    region VARCHAR(30),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales NUMERIC(12,2),
    quantity INT,
    discount NUMERIC(5,2),
    profit NUMERIC(12,2)
);