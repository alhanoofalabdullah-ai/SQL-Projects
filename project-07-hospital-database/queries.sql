-- View all patients
SELECT * FROM patients;

-- View all doctors
SELECT * FROM doctors;

-- View all appointments
SELECT * FROM appointments;

-- Show appointments with patient and doctor names
SELECT
    a.id AS appointment_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    d.specialization,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id
ORDER BY a.appointment_date;

-- Total appointments per doctor
SELECT
    d.name AS doctor_name,
    COUNT(a.id) AS total_appointments
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
GROUP BY d.name
ORDER BY total_appointments DESC;

-- Total appointments per patient
SELECT
    p.name AS patient_name,
    COUNT(a.id) AS total_appointments
FROM appointments a
JOIN patients p ON a.patient_id = p.id
GROUP BY p.name
ORDER BY total_appointments DESC;

-- Completed appointments only
SELECT
    p.name AS patient_name,
    d.name AS doctor_name,
    a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id
WHERE a.status = 'Completed';

-- Scheduled appointments only
SELECT
    p.name AS patient_name,
    d.name AS doctor_name,
    a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id
WHERE a.status = 'Scheduled';

-- Cancelled appointments count
SELECT COUNT(*) AS cancelled_appointments
FROM appointments
WHERE status = 'Cancelled';

-- Most booked doctor
SELECT
    d.name AS doctor_name,
    COUNT(a.id) AS total_bookings
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
GROUP BY d.name
ORDER BY total_bookings DESC
LIMIT 1;

-- Number of appointments by specialization
SELECT
    d.specialization,
    COUNT(a.id) AS total_appointments
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
GROUP BY d.specialization
ORDER BY total_appointments DESC;
