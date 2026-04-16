-- View all students
SELECT * FROM students;

-- View all subjects
SELECT * FROM subjects;

-- View all grades
SELECT * FROM grades;

-- Show student grades with subject names
SELECT 
    st.name AS student_name,
    su.name AS subject_name,
    g.score
FROM grades g
JOIN students st ON g.student_id = st.id
JOIN subjects su ON g.subject_id = su.id
ORDER BY st.name, su.name;

-- Average score per student
SELECT
    st.name AS student_name,
    AVG(g.score) AS average_score
FROM grades g
JOIN students st ON g.student_id = st.id
GROUP BY st.name
ORDER BY average_score DESC;

-- Average score per subject
SELECT
    su.name AS subject_name,
    AVG(g.score) AS average_score
FROM grades g
JOIN subjects su ON g.subject_id = su.id
GROUP BY su.name
ORDER BY average_score DESC;

-- Top student
SELECT
    st.name AS student_name,
    AVG(g.score) AS average_score
FROM grades g
JOIN students st ON g.student_id = st.id
GROUP BY st.name
ORDER BY average_score DESC
LIMIT 1;

-- Lowest student
SELECT
    st.name AS student_name,
    AVG(g.score) AS average_score
FROM grades g
JOIN students st ON g.student_id = st.id
GROUP BY st.name
ORDER BY average_score ASC
LIMIT 1;

-- Students with average above 85
SELECT
    st.name AS student_name,
    AVG(g.score) AS average_score
FROM grades g
JOIN students st ON g.student_id = st.id
GROUP BY st.name
HAVING AVG(g.score) > 85
ORDER BY average_score DESC;

-- Rank students by average score
SELECT
    st.name AS student_name,
    AVG(g.score) AS average_score
FROM grades g
JOIN students st ON g.student_id = st.id
GROUP BY st.name
ORDER BY average_score DESC;

-- Highest score in each subject
SELECT
    su.name AS subject_name,
    MAX(g.score) AS highest_score
FROM grades g
JOIN subjects su ON g.subject_id = su.id
GROUP BY su.name;

-- Total number of grades recorded per student
SELECT
    st.name AS student_name,
    COUNT(g.id) AS total_grades
FROM grades g
JOIN students st ON g.student_id = st.id
GROUP BY st.name
ORDER BY total_grades DESC;
