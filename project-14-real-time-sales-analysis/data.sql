INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 3500.00),
(2, 'Phone', 'Electronics', 2200.00),
(3, 'Desk', 'Furniture', 900.00),
(4, 'Chair', 'Furniture', 450.00),
(5, 'Headphones', 'Electronics', 300.00);

INSERT INTO sales (sale_id, product_id, sale_date, quantity, region) VALUES
(101, 1, '2026-04-01', 2, 'Riyadh'),
(102, 2, '2026-04-01', 3, 'Jeddah'),
(103, 3, '2026-04-02', 1, 'Dammam'),
(104, 1, '2026-04-02', 1, 'Riyadh'),
(105, 5, '2026-04-03', 5, 'Riyadh'),
(106, 4, '2026-04-03', 4, 'Jeddah'),
(107, 2, '2026-04-04', 2, 'Riyadh'),
(108, 3, '2026-04-04', 2, 'Dammam'),
(109, 1, '2026-04-05', 1, 'Jeddah'),
(110, 5, '2026-04-05', 6, 'Riyadh');
