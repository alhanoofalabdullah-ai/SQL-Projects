SELECT 
    e.employee_name,
    d.department_name,
    SUM(p.tasks_completed) AS total_tasks_completed
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY e.employee_name, d.department_name
ORDER BY total_tasks_completed DESC;

SELECT 
    e.employee_name,
    SUM(p.attendance_days) AS total_attendance_days
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY e.employee_name
ORDER BY total_attendance_days DESC;

SELECT 
    d.department_name,
    SUM(p.tasks_completed) AS department_total_tasks
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY d.department_name
ORDER BY department_total_tasks DESC;

SELECT 
    e.employee_name,
    ROUND(AVG(p.tasks_completed), 2) AS average_tasks_completed,
    ROUND(AVG(p.attendance_days), 2) AS average_attendance_days
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY e.employee_name
ORDER BY average_tasks_completed DESC;

SELECT 
    e.employee_name,
    SUM(p.tasks_completed) AS total_tasks_completed,
    RANK() OVER (ORDER BY SUM(p.tasks_completed) DESC) AS performance_rank
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY e.employee_name;
