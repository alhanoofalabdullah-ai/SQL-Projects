CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE performance (
    performance_id INT PRIMARY KEY,
    employee_id INT,
    review_month DATE,
    tasks_completed INT,
    attendance_days INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
