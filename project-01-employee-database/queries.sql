-- View all employees
SELECT * FROM employees;

-- Join employees with departments
SELECT e.name, d.name AS department, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.id;

-- Average salary
SELECT AVG(salary) AS avg_salary FROM employees;

-- Highest salary
SELECT MAX(salary) AS max_salary FROM employees;

-- Employees in IT department
SELECT e.name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE d.name = 'IT';

-- Group by department
SELECT d.name, COUNT(e.id) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name;
