CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    transaction_date DATETIME,
    location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
