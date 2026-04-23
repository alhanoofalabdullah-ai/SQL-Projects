SELECT 
    s.sale_date,
    SUM(s.quantity * p.price) AS daily_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY s.sale_date
ORDER BY s.sale_date;

SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sales_month,
    SUM(s.quantity * p.price) AS monthly_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m')
ORDER BY sales_month;

SELECT 
    p.product_name,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

SELECT 
    s.region,
    SUM(s.quantity * p.price) AS regional_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY s.region
ORDER BY regional_revenue DESC;

SELECT 
    ROUND(AVG(s.quantity * p.price), 2) AS average_order_value
FROM sales s
JOIN products p
    ON s.product_id = p.product_id;
