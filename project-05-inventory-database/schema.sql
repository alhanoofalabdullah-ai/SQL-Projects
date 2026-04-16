-- Suppliers Table
CREATE TABLE suppliers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT
);

-- Products Table
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    unit_price REAL NOT NULL,
    stock_quantity INTEGER NOT NULL,
    supplier_id INTEGER,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Stock Movements Table
CREATE TABLE stock_movements (
    id INTEGER PRIMARY KEY,
    product_id INTEGER,
    movement_type TEXT, -- IN / OUT
    quantity INTEGER NOT NULL,
    movement_date TEXT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
