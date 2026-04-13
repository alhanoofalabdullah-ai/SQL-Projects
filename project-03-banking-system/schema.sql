-- Customers Table
CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Accounts Table
CREATE TABLE accounts (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    balance REAL,
    account_type TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Transactions Table
CREATE TABLE transactions (
    id INTEGER PRIMARY KEY,
    account_id INTEGER,
    amount REAL,
    transaction_type TEXT,
    transaction_date TEXT,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);
