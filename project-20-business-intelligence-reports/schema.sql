CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    revenue DECIMAL(12,2),
    cost DECIMAL(12,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
