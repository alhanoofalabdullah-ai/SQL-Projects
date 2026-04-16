-- Systems Table
CREATE TABLE systems (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Logs Table
CREATE TABLE logs (
    id INTEGER PRIMARY KEY,
    system_id INTEGER,
    log_level TEXT, -- INFO, WARNING, ERROR
    message TEXT,
    log_date TEXT,
    FOREIGN KEY (system_id) REFERENCES systems(id)
);
