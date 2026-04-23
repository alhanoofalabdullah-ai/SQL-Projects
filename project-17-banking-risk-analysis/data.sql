INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Ahmed Ali', 'Riyadh'),
(2, 'Sara Khan', 'Jeddah'),
(3, 'Omar Hassan', 'Dammam'),
(4, 'Lina Saeed', 'Mecca'),
(5, 'Noor Fahad', 'Riyadh');

INSERT INTO accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'Savings', 15000.00),
(102, 2, 'Current', -500.00),
(103, 3, 'Savings', 3000.00),
(104, 4, 'Current', 800.00),
(105, 5, 'Savings', 25000.00);

INSERT INTO loans (loan_id, customer_id, loan_amount, remaining_balance) VALUES
(201, 1, 50000.00, 30000.00),
(202, 2, 20000.00, 18000.00),
(203, 3, 100000.00, 95000.00),
(204, 5, 15000.00, 5000.00);

INSERT INTO transactions (transaction_id, account_id, transaction_date, transaction_type, amount) VALUES
(301, 101, '2026-04-01', 'Deposit', 5000.00),
(302, 101, '2026-04-03', 'Withdrawal', 2000.00),
(303, 102, '2026-04-02', 'Withdrawal', 3000.00),
(304, 103, '2026-04-05', 'Deposit', 1000.00),
(305, 103, '2026-04-06', 'Withdrawal', 2500.00),
(306, 104, '2026-04-06', 'Withdrawal', 1500.00),
(307, 105, '2026-04-07', 'Deposit', 7000.00),
(308, 105, '2026-04-08', 'Withdrawal', 12000.00),
(309, 101, '2026-04-09', 'Withdrawal', 9000.00),
(310, 103, '2026-04-10', 'Withdrawal', 4000.00);
