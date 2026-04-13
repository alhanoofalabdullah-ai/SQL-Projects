-- View all customers
SELECT * FROM customers;

-- View all products
SELECT * FROM products;

-- View all orders
SELECT * FROM orders;

-- Join orders with customers and products
SELECT 
    o.id AS order_id,
    c.name AS customer_name,
    p.name AS product_name,
    p.category,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS total_amount,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;

-- Total revenue
SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.id;

-- Revenue by product
SELECT 
    p.name AS product_name,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- Revenue by customer
SELECT 
    c.name AS customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Orders from Riyadh customers
SELECT 
    c.name,
    c.city,
    p.name AS product_name,
    o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id
WHERE c.city = 'Riyadh';

-- Electronics sales only
SELECT 
    p.name,
    p.category,
    SUM(o.quantity) AS units_sold
FROM orders o
JOIN products p ON o.product_id = p.id
WHERE p.category = 'Electronics'
GROUP BY p.name, p.category
ORDER BY units_sold DESC;

-- Top selling product by quantity
SELECT 
    p.name,
    SUM(o.quantity) AS total_units
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name
ORDER BY total_units DESC
LIMIT 1;

-- Average order value
SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT (o.quantity * p.price) AS order_total
    FROM orders o
    JOIN products p ON o.product_id = p.id
) AS subquery;
