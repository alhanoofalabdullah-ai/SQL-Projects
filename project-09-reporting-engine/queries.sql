-- View detailed sales data
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
JOIN products p ON oi.product_id = p.id
ORDER BY o.order_date;

-- Total revenue
SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id;

-- Revenue by customer
SELECT
    c.name AS customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON oi.product_id = p.id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Revenue by product
SELECT
    p.name AS product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- Revenue by category
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Customers whose spending is above average
SELECT
    customer_name,
    total_spent
FROM (
    SELECT
        c.name AS customer_name,
        SUM(oi.quantity * p.price) AS total_spent
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.id
    JOIN customers c ON o.customer_id = c.id
    JOIN products p ON oi.product_id = p.id
    GROUP BY c.name
) AS customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM (
        SELECT
            c.name,
            SUM(oi.quantity * p.price) AS total_spent
        FROM order_items oi
        JOIN orders o ON oi.order_id = o.id
        JOIN customers c ON o.customer_id = c.id
        JOIN products p ON oi.product_id = p.id
        GROUP BY c.name
    )
);

-- Top product by revenue
SELECT
    p.name AS product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC
LIMIT 1;

-- Orders count by city
SELECT
    c.city,
    COUNT(DISTINCT o.id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.id
GROUP BY c.city
ORDER BY total_orders DESC;

-- Average order value
SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.id,
        SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.product_id = p.id
    GROUP BY o.id
) AS order_summary;

-- Products never ordered more than 2 units in a single line
SELECT
    p.name
FROM products p
WHERE p.id IN (
    SELECT product_id
    FROM order_items
    GROUP BY product_id
    HAVING MAX(quantity) <= 2
);
