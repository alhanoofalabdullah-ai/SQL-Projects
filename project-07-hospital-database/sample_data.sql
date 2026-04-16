-- Patients
INSERT INTO patients (id, name, age) VALUES
(1, 'Ahmed', 30),
(2, 'Sara', 27),
(3, 'Khalid', 41),
(4, 'Noura', 35),
(5, 'Faisal', 22);

-- Doctors
INSERT INTO doctors (id, name, specialization) VALUES
(1, 'Dr. Hassan', 'Cardiology'),
(2, 'Dr. Lina', 'Dermatology'),
(3, 'Dr. Omar', 'Orthopedics'),
(4, 'Dr. Reem', 'Pediatrics');

-- Appointments
INSERT INTO appointments (id, patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, 1, '2026-04-01', 'Completed'),
(2, 2, 2, '2026-04-02', 'Completed'),
(3, 3, 1, '2026-04-03', 'Cancelled'),
(4, 4, 3, '2026-04-04', 'Completed'),
(5, 5, 4, '2026-04-05', 'Scheduled'),
(6, 1, 2, '2026-04-06', 'Completed'),
(7, 2, 1, '2026-04-07', 'Scheduled'),
(8, 3, 3, '2026-04-08', 'Completed');
