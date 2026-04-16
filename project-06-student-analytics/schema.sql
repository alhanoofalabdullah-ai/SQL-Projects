-- Students Table
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Subjects Table
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Grades Table
CREATE TABLE grades (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    score REAL,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);
