-- Students
INSERT INTO students (id, name) VALUES
(1, 'Ahmed'),
(2, 'Sara'),
(3, 'Khalid'),
(4, 'Noura'),
(5, 'Faisal');

-- Subjects
INSERT INTO subjects (id, name) VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'English');

-- Grades
INSERT INTO grades (id, student_id, subject_id, score) VALUES
(1, 1, 1, 85),
(2, 1, 2, 90),
(3, 1, 3, 88),

(4, 2, 1, 92),
(5, 2, 2, 87),
(6, 2, 3, 91),

(7, 3, 1, 70),
(8, 3, 2, 75),
(9, 3, 3, 72),

(10, 4, 1, 95),
(11, 4, 2, 93),
(12, 4, 3, 96),

(13, 5, 1, 60),
(14, 5, 2, 65),
(15, 5, 3, 68);
