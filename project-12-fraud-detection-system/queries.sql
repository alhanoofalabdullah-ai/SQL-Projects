SELECT 
    user_id,
    transaction_id,
    amount
FROM transactions
WHERE amount > 5000
ORDER BY amount DESC;

SELECT 
    user_id,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY user_id
HAVING COUNT(*) > 2;

SELECT 
    t1.user_id,
    t1.transaction_id,
    t1.transaction_date,
    t2.transaction_date AS next_transaction
FROM transactions t1
JOIN transactions t2
    ON t1.user_id = t2.user_id
    AND t2.transaction_date > t1.transaction_date
    AND TIMESTAMPDIFF(MINUTE, t1.transaction_date, t2.transaction_date) <= 10;

SELECT 
    user_id,
    COUNT(DISTINCT location) AS location_count
FROM transactions
GROUP BY user_id
HAVING location_count > 1;

SELECT 
    user_id,
    SUM(amount) AS total_spent
FROM transactions
GROUP BY user_id
ORDER BY total_spent DESC;
