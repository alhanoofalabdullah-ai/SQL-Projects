INSERT INTO patients (patient_id, patient_name, gender, city) VALUES
(1, 'Ahmed Ali', 'Male', 'Riyadh'),
(2, 'Sara Khan', 'Female', 'Jeddah'),
(3, 'Omar Hassan', 'Male', 'Dammam'),
(4, 'Lina Saeed', 'Female', 'Mecca'),
(5, 'Noor Fahad', 'Female', 'Riyadh');

INSERT INTO doctors (doctor_id, doctor_name, specialty) VALUES
(101, 'Dr. Khalid', 'Cardiology'),
(102, 'Dr. Mona', 'Dermatology'),
(103, 'Dr. يوسف', 'Internal Medicine'),
(104, 'Dr. Huda', 'Pediatrics');

INSERT INTO visits (visit_id, patient_id, doctor_id, visit_date, diagnosis, treatment) VALUES
(1001, 1, 101, '2026-04-01', 'Hypertension', 'Medication'),
(1002, 2, 102, '2026-04-02', 'Skin Allergy', 'Cream'),
(1003, 3, 103, '2026-04-03', 'Diabetes', 'Medication'),
(1004, 4, 104, '2026-04-04', 'Fever', 'Rest'),
(1005, 5, 103, '2026-04-05', 'Diabetes', 'Diet Plan'),
(1006, 1, 101, '2026-04-10', 'Hypertension', 'Medication'),
(1007, 2, 102, '2026-04-12', 'Skin Allergy', 'Cream'),
(1008, 3, 103, '2026-04-15', 'Flu', 'Medication'),
(1009, 4, 104, '2026-04-18', 'Fever', 'Medication'),
(1010, 5, 101, '2026-04-20', 'Chest Pain', 'Scan');
