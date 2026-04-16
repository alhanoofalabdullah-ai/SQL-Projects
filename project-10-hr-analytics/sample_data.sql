-- Departments
INSERT INTO departments (id, name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Operations');

-- Employees
INSERT INTO employees (id, name, department_id, salary, hire_date, status) VALUES
(1, 'Ahmed', 2, 14000, '2024-01-15', 'Active'),
(2, 'Sara', 1, 11000, '2023-06-10', 'Active'),
(3, 'Khalid', 3, 18000, '2022-09-01', 'Left'),
(4, 'Noura', 2, 15500, '2025-02-20', 'Active'),
(5, 'Faisal', 4, 12000, '2023-11-05', 'Left'),
(6, 'Reem', 1, 10500, '2025-01-12', 'Active'),
(7, 'Omar', 3, 17500, '2024-07-18', 'Active'),
(8, 'Lina', 4, 12500, '2022-03-22', 'Left'),
(9, 'Maha', 2, 16000, '2025-03-01', 'Active'),
(10, 'Yousef', 4, 13000, '2024-10-10', 'Active');
