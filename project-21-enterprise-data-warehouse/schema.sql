-- ============================================================
-- Project 21: Enterprise Data Warehouse
-- Author: Alhanoof Alabdullah
-- ============================================================

DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_employee;
DROP TABLE IF EXISTS dim_region;
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date (
    date_key        INT PRIMARY KEY,
    full_date       DATE NOT NULL UNIQUE,
    day_number      INT NOT NULL,
    month_number    INT NOT NULL,
    month_name      VARCHAR(20) NOT NULL,
    quarter_number  INT NOT NULL,
    year_number     INT NOT NULL,
    is_weekend      BOOLEAN NOT NULL
);

CREATE TABLE dim_customer (
    customer_key    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id     VARCHAR(20) NOT NULL,
    customer_name   VARCHAR(120) NOT NULL,
    customer_type   VARCHAR(30) NOT NULL,
    industry        VARCHAR(60),
    city            VARCHAR(60),
    country         VARCHAR(60),
    valid_from      DATE NOT NULL,
    valid_to        DATE,
    is_current      BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE dim_product (
    product_key     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id      VARCHAR(20) NOT NULL UNIQUE,
    product_name    VARCHAR(120) NOT NULL,
    category        VARCHAR(60) NOT NULL,
    unit_cost       DECIMAL(12,2) NOT NULL CHECK (unit_cost >= 0),
    list_price      DECIMAL(12,2) NOT NULL CHECK (list_price >= 0)
);

CREATE TABLE dim_employee (
    employee_key    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id     VARCHAR(20) NOT NULL UNIQUE,
    employee_name   VARCHAR(120) NOT NULL,
    department      VARCHAR(60) NOT NULL,
    job_title       VARCHAR(80) NOT NULL
);

CREATE TABLE dim_region (
    region_key      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    region_code     VARCHAR(20) NOT NULL UNIQUE,
    region_name     VARCHAR(80) NOT NULL,
    country         VARCHAR(60) NOT NULL,
    manager_name    VARCHAR(120)
);

CREATE TABLE fact_sales (
    sales_key       BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id        VARCHAR(30) NOT NULL,
    date_key        INT NOT NULL REFERENCES dim_date(date_key),
    customer_key    INT NOT NULL REFERENCES dim_customer(customer_key),
    product_key     INT NOT NULL REFERENCES dim_product(product_key),
    employee_key    INT NOT NULL REFERENCES dim_employee(employee_key),
    region_key      INT NOT NULL REFERENCES dim_region(region_key),
    quantity        INT NOT NULL CHECK (quantity > 0),
    unit_price      DECIMAL(12,2) NOT NULL CHECK (unit_price >= 0),
    discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    sales_amount    DECIMAL(14,2) NOT NULL,
    cost_amount     DECIMAL(14,2) NOT NULL,
    profit_amount   DECIMAL(14,2) NOT NULL,
    load_timestamp  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (order_id, product_key)
);

CREATE INDEX idx_fact_sales_date
    ON fact_sales(date_key);

CREATE INDEX idx_fact_sales_customer
    ON fact_sales(customer_key);

CREATE INDEX idx_fact_sales_product
    ON fact_sales(product_key);

CREATE INDEX idx_fact_sales_region
    ON fact_sales(region_key);
