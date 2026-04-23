SELECT 
    log_level,
    COUNT(*) AS total_logs
FROM logs
GROUP BY log_level
ORDER BY total_logs DESC;

SELECT 
    message,
    COUNT(*) AS occurrence_count
FROM logs
GROUP BY message
ORDER BY occurrence_count DESC;

SELECT 
    DATE(log_timestamp) AS log_date,
    COUNT(*) AS daily_event_count
FROM logs
GROUP BY DATE(log_timestamp)
ORDER BY log_date;

SELECT 
    s.system_name,
    COUNT(*) AS total_errors
FROM logs l
JOIN systems s
    ON l.system_id = s.system_id
WHERE l.log_level IN ('ERROR', 'CRITICAL')
GROUP BY s.system_name
ORDER BY total_errors DESC;

SELECT 
    s.system_name,
    l.log_level,
    l.message,
    l.log_timestamp
FROM logs l
JOIN systems s
    ON l.system_id = s.system_id
WHERE l.log_level = 'CRITICAL'
ORDER BY l.log_timestamp DESC;

SELECT 
    s.environment,
    COUNT(*) AS total_log_events
FROM logs l
JOIN systems s
    ON l.system_id = s.system_id
GROUP BY s.environment
ORDER BY total_log_events DESC;
