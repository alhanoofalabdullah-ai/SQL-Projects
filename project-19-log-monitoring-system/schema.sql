CREATE TABLE systems (
    system_id INT PRIMARY KEY,
    system_name VARCHAR(100),
    environment VARCHAR(50)
);

CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    system_id INT,
    log_timestamp DATETIME,
    log_level VARCHAR(20),
    message VARCHAR(255),
    FOREIGN KEY (system_id) REFERENCES systems(system_id)
);
