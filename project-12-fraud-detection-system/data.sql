INSERT INTO users (user_id, username, city) VALUES
(1, 'ahmed', 'Riyadh'),
(2, 'sara', 'Jeddah'),
(3, 'omar', 'Dammam'),
(4, 'lina', 'Riyadh');

INSERT INTO transactions (transaction_id, user_id, amount, transaction_date, location) VALUES
(101, 1, 5000, '2026-04-01 10:00:00', 'Riyadh'),
(102, 1, 5200, '2026-04-01 10:05:00', 'Riyadh'),
(103, 2, 150, '2026-04-01 11:00:00', 'Jeddah'),
(104, 3, 8000, '2026-04-02 09:00:00', 'Dammam'),
(105, 3, 8200, '2026-04-02 09:03:00', 'Riyadh'),
(106, 4, 200, '2026-04-03 14:00:00', 'Riyadh'),
(107, 1, 10000, '2026-04-04 16:00:00', 'Dubai'),
(108, 2, 300, '2026-04-05 18:00:00', 'Jeddah');
