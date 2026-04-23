INSERT INTO systems (system_id, system_name, environment) VALUES
(1, 'Web Server', 'Production'),
(2, 'API Server', 'Production'),
(3, 'Database Server', 'Production'),
(4, 'Auth Service', 'Staging');

INSERT INTO logs (log_id, system_id, log_timestamp, log_level, message) VALUES
(101, 1, '2026-04-01 09:00:00', 'INFO', 'Server started successfully'),
(102, 2, '2026-04-01 09:10:00', 'ERROR', 'API timeout error'),
(103, 3, '2026-04-01 09:20:00', 'WARNING', 'High memory usage detected'),
(104, 2, '2026-04-01 09:25:00', 'ERROR', 'API timeout error'),
(105, 1, '2026-04-01 10:00:00', 'INFO', 'New connection established'),
(106, 4, '2026-04-01 10:15:00', 'ERROR', 'Authentication token invalid'),
(107, 3, '2026-04-02 08:00:00', 'CRITICAL', 'Database connection lost'),
(108, 2, '2026-04-02 08:30:00', 'ERROR', 'API timeout error'),
(109, 4, '2026-04-02 09:00:00', 'WARNING', 'Multiple failed logins detected'),
(110, 1, '2026-04-02 09:30:00', 'INFO', 'Scheduled backup completed');
