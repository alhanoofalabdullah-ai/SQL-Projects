-- Departments
CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- Employees
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department_id INTEGER,
    salary REAL,
    hire_date TEXT,
    status TEXT, -- Active / Left
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
