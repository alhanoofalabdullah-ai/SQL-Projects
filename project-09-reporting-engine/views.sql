-- View: sales summary
CREATE VIEW sales_summary AS
SELECT
    o.id AS order_id,
    c.name AS customer_name,
    c.city,
    p.name AS product_name,
    p.category,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_amount,
    o.order_date
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON oi.product_id = p.id;

-- View: customer revenue summary
CREATE VIEW customer_revenue_summary AS
SELECT
    c.name AS customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON oi.product_id = p.id
GROUP BY c.name;

-- View: category revenue summary
CREATE VIEW category_revenue_summary AS
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category;
