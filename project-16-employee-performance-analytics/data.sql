INSERT INTO departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO employees (employee_id, employee_name, department_id, hire_date) VALUES
(1, 'Ahmed Ali', 1, '2024-01-10'),
(2, 'Sara Khan', 2, '2024-03-15'),
(3, 'Omar Hassan', 1, '2024-06-20'),
(4, 'Lina Saeed', 3, '2024-08-05'),
(5, 'Noor Fahad', 2, '2025-01-12');

INSERT INTO performance (performance_id, employee_id, review_month, tasks_completed, attendance_days) VALUES
(101, 1, '2026-04-01', 45, 22),
(102, 2, '2026-04-01', 30, 21),
(103, 3, '2026-04-01', 50, 23),
(104, 4, '2026-04-01', 28, 20),
(105, 5, '2026-04-01', 35, 22),
(106, 1, '2026-05-01', 48, 23),
(107, 2, '2026-05-01', 32, 22),
(108, 3, '2026-05-01', 55, 24),
(109, 4, '2026-05-01', 30, 21),
(110, 5, '2026-05-01', 38, 23);
