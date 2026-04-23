INSERT INTO products (product_id, product_name, category, unit_price, stock_quantity, reorder_level) VALUES
(1, 'Laptop', 'Electronics', 3500.00, 8, 10),
(2, 'Phone', 'Electronics', 2200.00, 25, 8),
(3, 'Desk', 'Furniture', 900.00, 5, 6),
(4, 'Chair', 'Furniture', 450.00, 30, 10),
(5, 'Headphones', 'Electronics', 300.00, 50, 15);

INSERT INTO sales (sale_id, product_id, sale_date, quantity_sold) VALUES
(101, 1, '2026-04-01', 2),
(102, 2, '2026-04-01', 5),
(103, 5, '2026-04-02', 10),
(104, 4, '2026-04-02', 3),
(105, 2, '2026-04-03', 4),
(106, 3, '2026-04-03', 1),
(107, 5, '2026-04-04', 8),
(108, 1, '2026-04-04', 1),
(109, 4, '2026-04-05', 2),
(110, 2, '2026-04-05', 6);
