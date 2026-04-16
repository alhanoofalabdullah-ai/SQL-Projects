-- View all users
SELECT * FROM users;

-- View all products
SELECT * FROM products;

-- View all orders
SELECT * FROM orders;

-- View all order items
SELECT * FROM order_items;

-- Show orders with customer names
SELECT 
    o.id AS order_id,
    u.name AS customer_name,
    o.order_date
FROM orders o
JOIN users u ON o.user_id = u.id
ORDER BY o.order_date;

-- Show detailed order items
SELECT
    o.id AS order_id,
    u.name AS customer_name,
    p.name AS product_name,
    p.category,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_price
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN users u ON o.user_id = u.id
JOIN products p ON oi.product_id = p.id
ORDER BY o.id;

-- Total revenue
SELECT 
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id;

-- Revenue by product
SELECT
    p.name AS product_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- Top customer by spending
SELECT
    u.name AS customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN users u ON o.user_id = u.id
JOIN products p ON oi.product_id = p.id
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 1;

-- Orders from Riyadh customers
SELECT
    u.name,
    u.city,
    o.id AS order_id,
    o.order_date
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.city = 'Riyadh';

-- Best selling product by quantity
SELECT
    p.name,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 1;

-- Remaining stock after sales
SELECT
    p.name,
    p.stock,
    COALESCE(SUM(oi.quantity), 0) AS sold_quantity,
    (p.stock - COALESCE(SUM(oi.quantity), 0)) AS remaining_stock
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name, p.stock
ORDER BY remaining_stock ASC;

-- Revenue by category
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY category_revenue DESC;
