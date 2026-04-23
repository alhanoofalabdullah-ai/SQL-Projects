SELECT 
    product_id,
    product_name,
    stock_quantity,
    reorder_level
FROM products
WHERE stock_quantity < reorder_level
ORDER BY stock_quantity ASC;

SELECT 
    p.product_name,
    SUM(s.quantity_sold) AS total_units_sold
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

SELECT 
    p.product_name,
    SUM(s.quantity_sold) AS total_units_sold
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_units_sold ASC;

SELECT 
    product_name,
    stock_quantity,
    unit_price,
    (stock_quantity * unit_price) AS stock_value
FROM products
ORDER BY stock_value DESC;

SELECT 
    product_name,
    stock_quantity,
    reorder_level,
    CASE
        WHEN stock_quantity < reorder_level THEN 'Reorder Needed'
        ELSE 'Stock OK'
    END AS reorder_status
FROM products
ORDER BY reorder_status DESC, stock_quantity ASC;
