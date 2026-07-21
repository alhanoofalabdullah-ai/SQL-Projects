-- 1. Executive sales summary

SELECT
    SUM(sales_amount) AS total_revenue,
    SUM(cost_amount) AS total_cost,
    SUM(profit_amount) AS total_profit,
    ROUND(
        SUM(profit_amount) * 100.0 /
        NULLIF(SUM(sales_amount), 0),
        2
    ) AS profit_margin_percent
FROM fact_sales;


-- 2. Monthly sales performance

SELECT
    d.year_number,
    d.month_number,
    d.month_name,
    SUM(f.sales_amount) AS revenue,
    SUM(f.profit_amount) AS profit
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.year_number,
    d.month_number,
    d.month_name
ORDER BY
    d.year_number,
    d.month_number;


-- 3. Product performance ranking

SELECT
    p.product_name,
    p.category,
    SUM(f.quantity) AS units_sold,
    SUM(f.sales_amount) AS revenue,
    SUM(f.profit_amount) AS profit,
    DENSE_RANK() OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS revenue_rank
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY
    p.product_name,
    p.category
ORDER BY
    revenue_rank;


-- 4. Customer lifetime value

SELECT
    c.customer_id,
    c.customer_name,
    c.customer_type,
    SUM(f.sales_amount) AS lifetime_revenue,
    SUM(f.profit_amount) AS lifetime_profit,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_key = c.customer_key
GROUP BY
    c.customer_id,
    c.customer_name,
    c.customer_type
ORDER BY
    lifetime_revenue DESC;


-- 5. Regional performance

SELECT
    r.region_name,
    r.manager_name,
    SUM(f.sales_amount) AS revenue,
    SUM(f.profit_amount) AS profit,
    ROUND(
        SUM(f.profit_amount) * 100.0 /
        NULLIF(SUM(f.sales_amount), 0),
        2
    ) AS margin_percent
FROM fact_sales f
JOIN dim_region r
    ON f.region_key = r.region_key
GROUP BY
    r.region_name,
    r.manager_name
ORDER BY
    revenue DESC;


-- 6. Running monthly revenue

WITH monthly_sales AS (
    SELECT
        d.year_number,
        d.month_number,
        SUM(f.sales_amount) AS monthly_revenue
    FROM fact_sales f
    JOIN dim_date d
        ON f.date_key = d.date_key
    GROUP BY
        d.year_number,
        d.month_number
)
SELECT
    year_number,
    month_number,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        PARTITION BY year_number
        ORDER BY month_number
    ) AS running_revenue
FROM monthly_sales
ORDER BY
    year_number,
    month_number;


-- 7. Employee sales performance

SELECT
    e.employee_name,
    e.job_title,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.sales_amount) AS total_revenue,
    SUM(f.profit_amount) AS total_profit,
    AVG(f.sales_amount) AS average_order_value
FROM fact_sales f
JOIN dim_employee e
    ON f.employee_key = e.employee_key
GROUP BY
    e.employee_name,
    e.job_title
ORDER BY
    total_revenue DESC;


-- 8. Category contribution percentage

WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS revenue
    FROM fact_sales f
    JOIN dim_product p
        ON f.product_key = p.product_key
    GROUP BY p.category
)
SELECT
    category,
    revenue,
    ROUND(
        revenue * 100.0 /
        SUM(revenue) OVER (),
        2
    ) AS revenue_contribution_percent
FROM category_sales
ORDER BY revenue DESC;
