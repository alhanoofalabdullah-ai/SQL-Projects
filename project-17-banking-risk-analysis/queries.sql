SELECT 
    c.customer_name,
    a.account_type,
    a.balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.balance < 0
ORDER BY a.balance ASC;

SELECT 
    c.customer_name,
    l.loan_amount,
    l.remaining_balance
FROM customers c
JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY l.remaining_balance DESC;

SELECT 
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_name
ORDER BY total_transaction_amount DESC;

SELECT 
    c.customer_name,
    COUNT(t.transaction_id) AS transaction_count
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_name
ORDER BY transaction_count DESC;

SELECT 
    c.customer_name,
    a.balance,
    COALESCE(l.remaining_balance, 0) AS remaining_loan_balance,
    CASE
        WHEN a.balance < 0 OR COALESCE(l.remaining_balance, 0) > 50000 THEN 'High Risk'
        WHEN COALESCE(l.remaining_balance, 0) > 10000 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY risk_level DESC, remaining_loan_balance DESC;

SELECT 
    t.transaction_id,
    c.customer_name,
    t.transaction_type,
    t.amount
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.amount > 5000
ORDER BY t.amount DESC;
