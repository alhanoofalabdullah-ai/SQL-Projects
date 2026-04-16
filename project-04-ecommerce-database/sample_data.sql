-- Insert Users
INSERT INTO users (id, name, city) VALUES
(1, 'Ahmed', 'Riyadh'),
(2, 'Sara', 'Jeddah'),
(3, 'Khalid', 'Dammam'),
(4, 'Noura', 'Riyadh');

-- Insert Products
INSERT INTO products (id, name, category, price, stock) VALUES
(1, 'Laptop', 'Electronics', 3500, 10),
(2, 'Phone', 'Electronics', 2200, 15),
(3, 'Desk', 'Furniture', 900, 8),
(4, 'Chair', 'Furniture', 450, 20),
(5, 'Headphones', 'Accessories', 300, 25);

-- Insert Orders
INSERT INTO orders (id, user_id, order_date) VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 1, '2026-04-03'),
(4, 3, '2026-04-04'),
(5, 4, '2026-04-05');

-- Insert Order Items
INSERT INTO order_items (id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1),
(2, 1, 5, 2),
(3, 2, 2, 1),
(4, 2, 5, 1),
(5, 3, 4, 4),
(6, 4, 3, 1),
(7, 4, 4, 2),
(8, 5, 2, 1),
(9, 5, 5, 3);
