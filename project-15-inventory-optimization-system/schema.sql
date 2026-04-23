CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    unit_price DECIMAL(10,2),
    stock_quantity INT,
    reorder_level INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
