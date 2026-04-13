-- View all customers
SELECT * FROM customers;

-- View all accounts
SELECT * FROM accounts;

-- View all transactions
SELECT * FROM transactions;

-- Join customers with accounts
SELECT 
    c.name AS customer_name,
    a.id AS account_id,
    a.account_type,
    a.balance
FROM customers c
JOIN accounts a ON c.id = a.customer_id;

-- Total deposits
SELECT SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'Deposit';

-- Total withdrawals
SELECT SUM(amount) AS total_withdrawals
FROM transactions
WHERE transaction_type = 'Withdrawal';

-- Transaction history with customer names
SELECT
    c.name AS customer_name,
    a.id AS account_id,
    t.amount,
    t.transaction_type,
    t.transaction_date
FROM transactions t
JOIN accounts a ON t.account_id = a.id
JOIN customers c ON a.customer_id = c.id
ORDER BY t.transaction_date;

-- Highest account balance
SELECT MAX(balance) AS highest_balance
FROM accounts;

-- Average account balance
SELECT AVG(balance) AS average_balance
FROM accounts;

-- Total transactions per customer
SELECT
    c.name AS customer_name,
    COUNT(t.id) AS total_transactions
FROM customers c
JOIN accounts a ON c.id = a.customer_id
JOIN transactions t ON a.id = t.account_id
GROUP BY c.name
ORDER BY total_transactions DESC;

-- Total deposited amount per customer
SELECT
    c.name AS customer_name,
    SUM(t.amount) AS total_deposit_amount
FROM customers c
JOIN accounts a ON c.id = a.customer_id
JOIN transactions t ON a.id = t.account_id
WHERE t.transaction_type = 'Deposit'
GROUP BY c.name
ORDER BY total_deposit_amount DESC;

-- Customers with balance greater than 10000
SELECT
    c.name,
    a.balance
FROM customers c
JOIN accounts a ON c.id = a.customer_id
WHERE a.balance > 10000
ORDER BY a.balance DESC;
