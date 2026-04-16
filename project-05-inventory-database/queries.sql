-- View all products
SELECT * FROM products;

-- Join products with suppliers
SELECT p.name AS product, s.name AS supplier, p.stock_quantity
FROM products p
JOIN suppliers s ON p.supplier_id = s.id;

-- Total stock value per product
SELECT name, (unit_price * stock_quantity) AS total_value
FROM products;

-- Products with low stock (less than 20)
SELECT name, stock_quantity
FROM products
WHERE stock_quantity < 20;

-- Total stock movements IN
SELECT SUM(quantity) AS total_in
FROM stock_movements
WHERE movement_type = 'IN';

-- Total stock movements OUT
SELECT SUM(quantity) AS total_out
FROM stock_movements
WHERE movement_type = 'OUT';

-- Most expensive product
SELECT name, MAX(unit_price)
FROM products;

-- Products per category
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

-- Stock movement history for a product
SELECT p.name, m.movement_type, m.quantity, m.movement_date
FROM stock_movements m
JOIN products p ON m.product_id = p.id;

-- Supplier with most products
SELECT s.name, COUNT(p.id) AS total_products
FROM suppliers s
JOIN products p ON s.id = p.supplier_id
GROUP BY s.name
ORDER BY total_products DESC;
