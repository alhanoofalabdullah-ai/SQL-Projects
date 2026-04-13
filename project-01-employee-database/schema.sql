-- Create Departments Table
CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create Employees Table
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    department_id INTEGER,
    salary REAL,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
