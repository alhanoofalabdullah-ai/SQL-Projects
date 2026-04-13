-- Insert Customers
INSERT INTO customers (id, name) VALUES
(1, 'Ahmed'),
(2, 'Sara'),
(3, 'Khalid'),
(4, 'Noura');

-- Insert Accounts
INSERT INTO accounts (id, customer_id, balance, account_type) VALUES
(1, 1, 15000, 'Savings'),
(2, 2, 8000, 'Current'),
(3, 3, 22000, 'Savings'),
(4, 4, 12000, 'Current');

-- Insert Transactions
INSERT INTO transactions (id, account_id, amount, transaction_type, transaction_date) VALUES
(1, 1, 5000, 'Deposit', '2026-04-01'),
(2, 1, 1000, 'Withdrawal', '2026-04-02'),
(3, 2, 2000, 'Deposit', '2026-04-03'),
(4, 2, 500, 'Withdrawal', '2026-04-04'),
(5, 3, 7000, 'Deposit', '2026-04-05'),
(6, 3, 3000, 'Withdrawal', '2026-04-06'),
(7, 4, 2500, 'Deposit', '2026-04-07'),
(8, 4, 1000, 'Withdrawal', '2026-04-08');
