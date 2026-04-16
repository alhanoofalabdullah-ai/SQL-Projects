-- View all employees
SELECT * FROM employees;

-- Join employees with departments
SELECT
    e.name,
    d.name AS department,
    e.salary,
    e.status
FROM employees e
JOIN departments d ON e.department_id = d.id;

-- Total employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Active employees
SELECT COUNT(*) AS active_employees
FROM employees
WHERE status = 'Active';

-- Employees who left
SELECT COUNT(*) AS left_employees
FROM employees
WHERE status = 'Left';

-- Turnover rate (basic)
SELECT
    (COUNT(CASE WHEN status = 'Left' THEN 1 END) * 100.0 / COUNT(*)) AS turnover_rate_percentage
FROM employees;

-- Average salary per department
SELECT
    d.name AS department,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name
ORDER BY avg_salary DESC;

-- Highest salary
SELECT MAX(salary) AS highest_salary FROM employees;

-- Lowest salary
SELECT MIN(salary) AS lowest_salary FROM employees;

-- Salary distribution
SELECT
    CASE
        WHEN salary < 12000 THEN 'Low'
        WHEN salary BETWEEN 12000 AND 15000 THEN 'Medium'
        ELSE 'High'
    END AS salary_level,
    COUNT(*) AS total_employees
FROM employees
GROUP BY salary_level;

-- Employees hired per year
SELECT
    STRFTIME('%Y', hire_date) AS hire_year,
    COUNT(*) AS total_hired
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- Department with most employees
SELECT
    d.name,
    COUNT(e.id) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name
ORDER BY total_employees DESC
LIMIT 1;

-- Active vs Left by department
SELECT
    d.name AS department,
    SUM(CASE WHEN e.status = 'Active' THEN 1 ELSE 0 END) AS active_count,
    SUM(CASE WHEN e.status = 'Left' THEN 1 ELSE 0 END) AS left_count
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name;
