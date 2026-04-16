-- Suppliers
INSERT INTO suppliers (id, name, city) VALUES
(1, 'Tech Supply Co', 'Riyadh'),
(2, 'Global Traders', 'Jeddah'),
(3, 'Warehouse Hub', 'Dammam');

-- Products
INSERT INTO products (id, name, category, unit_price, stock_quantity, supplier_id) VALUES
(1, 'Laptop', 'Electronics', 3500, 20, 1),
(2, 'Mouse', 'Electronics', 50, 100, 1),
(3, 'Desk Chair', 'Furniture', 400, 15, 2),
(4, 'Notebook', 'Stationery', 10, 200, 3),
(5, 'Pen', 'Stationery', 2, 500, 3);

-- Stock Movements
INSERT INTO stock_movements (id, product_id, movement_type, quantity, movement_date) VALUES
(1, 1, 'IN', 10, '2026-04-01'),
(2, 2, 'OUT', 20, '2026-04-02'),
(3, 3, 'IN', 5, '2026-04-03'),
(4, 4, 'OUT', 50, '2026-04-04'),
(5, 5, 'IN', 100, '2026-04-05');
