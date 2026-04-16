-- Customers
INSERT INTO customers (id, name, city) VALUES
(1, 'Ahmed', 'Riyadh'),
(2, 'Sara', 'Jeddah'),
(3, 'Khalid', 'Dammam'),
(4, 'Noura', 'Riyadh'),
(5, 'Faisal', 'Khobar');

-- Products
INSERT INTO products (id, name, category, price) VALUES
(1, 'Laptop', 'Electronics', 3500),
(2, 'Phone', 'Electronics', 2200),
(3, 'Desk Chair', 'Furniture', 800),
(4, 'Monitor', 'Electronics', 1200),
(5, 'Notebook Pack', 'Stationery', 50);

-- Orders
INSERT INTO orders (id, customer_id, order_date) VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 1, '2026-04-03'),
(4, 3, '2026-04-04'),
(5, 4, '2026-04-05'),
(6, 5, '2026-04-06');

-- Order Items
INSERT INTO order_items (id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1),
(2, 1, 5, 2),
(3, 2, 2, 2),
(4, 3, 4, 1),
(5, 4, 3, 1),
(6, 4, 5, 5),
(7, 5, 2, 1),
(8, 5, 4, 2),
(9, 6, 5, 10);
