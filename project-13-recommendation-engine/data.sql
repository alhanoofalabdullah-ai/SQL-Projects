INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Ahmed'),
(2, 'Sara'),
(3, 'Omar'),
(4, 'Lina');

INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Mouse', 'Electronics'),
(3, 'Keyboard', 'Electronics'),
(4, 'Desk', 'Furniture'),
(5, 'Chair', 'Furniture');

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(101, 1, '2026-04-01'),
(102, 2, '2026-04-02'),
(103, 3, '2026-04-03'),
(104, 4, '2026-04-04');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 101, 1, 1),
(2, 101, 2, 1),
(3, 101, 3, 1),
(4, 102, 1, 1),
(5, 102, 2, 1),
(6, 103, 4, 1),
(7, 103, 5, 1),
(8, 104, 1, 1),
(9, 104, 3, 1);
