SELECT 
    diagnosis,
    COUNT(*) AS diagnosis_count
FROM visits
GROUP BY diagnosis
ORDER BY diagnosis_count DESC;

SELECT 
    p.patient_name,
    COUNT(v.visit_id) AS total_visits
FROM patients p
JOIN visits v
    ON p.patient_id = v.patient_id
GROUP BY p.patient_name
ORDER BY total_visits DESC;

SELECT 
    d.doctor_name,
    d.specialty,
    COUNT(v.visit_id) AS total_visits_handled
FROM doctors d
JOIN visits v
    ON d.doctor_id = v.doctor_id
GROUP BY d.doctor_name, d.specialty
ORDER BY total_visits_handled DESC;

SELECT 
    treatment,
    COUNT(*) AS treatment_count
FROM visits
GROUP BY treatment
ORDER BY treatment_count DESC;

SELECT 
    DATE_FORMAT(visit_date, '%Y-%m') AS visit_month,
    COUNT(*) AS total_visits
FROM visits
GROUP BY DATE_FORMAT(visit_date, '%Y-%m')
ORDER BY visit_month;

SELECT 
    p.patient_name,
    v.diagnosis,
    COUNT(*) AS diagnosis_frequency
FROM patients p
JOIN visits v
    ON p.patient_id = v.patient_id
GROUP BY p.patient_name, v.diagnosis
ORDER BY diagnosis_frequency DESC;
