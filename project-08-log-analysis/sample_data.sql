-- Systems
INSERT INTO systems (id, name) VALUES
(1, 'Aconex'),
(2, 'Freshdesk'),
(3, 'SharePoint'),
(4, 'Power BI');

-- Logs
INSERT INTO logs (id, system_id, log_level, message, log_date) VALUES
(1, 1, 'INFO', 'User login successful', '2026-04-01 08:00:00'),
(2, 1, 'ERROR', 'Document upload failed', '2026-04-01 08:30:00'),
(3, 2, 'WARNING', 'Ticket response delayed', '2026-04-01 09:00:00'),
(4, 2, 'ERROR', 'Email notification failed', '2026-04-01 09:30:00'),
(5, 3, 'INFO', 'File synced successfully', '2026-04-01 10:00:00'),
(6, 3, 'ERROR', 'Permission denied', '2026-04-01 10:15:00'),
(7, 4, 'WARNING', 'Dashboard refresh slow', '2026-04-01 11:00:00'),
(8, 4, 'INFO', 'Report generated', '2026-04-01 11:20:00'),
(9, 1, 'ERROR', 'Workflow timeout', '2026-04-02 08:10:00'),
(10, 2, 'INFO', 'Ticket created successfully', '2026-04-02 08:40:00');
