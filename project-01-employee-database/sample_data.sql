-- Insert Departments
INSERT INTO departments (id, name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Insert Employees
INSERT INTO employees (id, name, age, department_id, salary) VALUES
(1, 'Ahmed', 30, 2, 9000),
(2, 'Sara', 28, 1, 7000),
(3, 'Khalid', 35, 3, 12000),
(4, 'Noura', 26, 2, 8500),
(5, 'Fahad', 40, 3, 15000);
