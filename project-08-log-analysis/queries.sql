-- View all logs
SELECT * FROM logs;

-- View all systems
SELECT * FROM systems;

-- Join logs with system names
SELECT
    s.name AS system_name,
    l.log_level,
    l.message,
    l.log_date
FROM logs l
JOIN systems s ON l.system_id = s.id
ORDER BY l.log_date;

-- Count logs by level
SELECT
    log_level,
    COUNT(*) AS total_logs
FROM logs
GROUP BY log_level
ORDER BY total_logs DESC;

-- Count errors only
SELECT COUNT(*) AS total_errors
FROM logs
WHERE log_level = 'ERROR';

-- Errors per system
SELECT
    s.name AS system_name,
    COUNT(l.id) AS total_errors
FROM logs l
JOIN systems s ON l.system_id = s.id
WHERE l.log_level = 'ERROR'
GROUP BY s.name
ORDER BY total_errors DESC;

-- Warnings per system
SELECT
    s.name AS system_name,
    COUNT(l.id) AS total_warnings
FROM logs l
JOIN systems s ON l.system_id = s.id
WHERE l.log_level = 'WARNING'
GROUP BY s.name
ORDER BY total_warnings DESC;

-- Logs per day
SELECT
    DATE(log_date) AS log_day,
    COUNT(*) AS total_logs
FROM logs
GROUP BY log_day
ORDER BY log_day;

-- Most active system (by logs)
SELECT
    s.name AS system_name,
    COUNT(l.id) AS total_logs
FROM logs l
JOIN systems s ON l.system_id = s.id
GROUP BY s.name
ORDER BY total_logs DESC
LIMIT 1;

-- Recent errors (last entries)
SELECT
    s.name,
    l.message,
    l.log_date
FROM logs l
JOIN systems s ON l.system_id = s.id
WHERE l.log_level = 'ERROR'
ORDER BY l.log_date DESC;

-- Detect systems with high error rate
SELECT
    s.name,
    COUNT(CASE WHEN l.log_level = 'ERROR' THEN 1 END) AS error_count,
    COUNT(l.id) AS total_logs
FROM logs l
JOIN systems s ON l.system_id = s.id
GROUP BY s.name
ORDER BY error_count DESC;
