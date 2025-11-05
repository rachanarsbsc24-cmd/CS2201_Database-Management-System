-- ======================================================================
-- Lab Experiment 06 – GROUP BY, HAVING, ORDER BY & INDEXING
-- ======================================================================

DROP DATABASE IF EXISTS HospitalDB;
-- OUTPUT : 14:22:31	DROP DATABASE IF EXISTS HospitalDB	0 row(s) affected, 1 warning(s): 1008 Can't drop database 'hospitaldb'; database doesn't exist	0.078 sec

CREATE DATABASE HospitalDB;
-- OUTPUT : 14:22:41	CREATE DATABASE HospitalDB	1 row(s) affected	0.094 sec

USE HospitalDB;
-- OUTPUT : 14:22:46	USE HospitalDB	0 row(s) affected	0.000 sec

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

-- OUTPUT : 14:23:02	CREATE TABLE Patients (     patient_id INT PRIMARY KEY,     patient_name VARCHAR(50),     age INT,     gender VARCHAR(10) )	0 row(s) affected	0.359 sec

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(50),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- OUTPUT : 14:23:38	CREATE TABLE Visits (     visit_id INT PRIMARY KEY,     patient_id INT,     visit_date DATE,     doctor_id INT,     diagnosis VARCHAR(50),     treatment_cost DECIMAL(10,2),     FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) )	0 row(s) affected	1.265 sec

INSERT INTO Patients VALUES
(1, 'Riya Sharma', 25, 'Female'),
(2, 'Aman Verma', 40, 'Male'),
(3, 'Kiran Patel', 30, 'Female'),
(4, 'Rohit Mehta', 50, 'Male'),
(5, 'Priya Singh', 35, 'Female');

-- OUTPUT : 14:23:59	INSERT INTO Patients VALUES (1, 'Riya Sharma', 25, 'Female'), (2, 'Aman Verma', 40, 'Male'), (3, 'Kiran Patel', 30, 'Female'), (4, 'Rohit Mehta', 50, 'Male'), (5, 'Priya Singh', 35, 'Female')	5 row(s) affected Records: 5  Duplicates: 0  Warnings: 0	0.110 sec

INSERT INTO Visits VALUES
(101, 1, '2025-01-10', 201, 'Flu', 150.00),
(102, 2, '2025-01-12', 202, 'Diabetes', 400.00),
(103, 3, '2025-02-05', 203, 'Flu', 180.00),
(104, 4, '2025-02-10', 204, 'Hypertension', 500.00),
(105, 5, '2025-03-15', 205, 'Diabetes', 350.00),
(106, 1, '2025-03-18', 201, 'Allergy', 220.00),
(107, 2, '2025-04-01', 202, 'Flu', 120.00),
(108, 3, '2025-04-20', 203, 'Hypertension', 450.00);

-- OUTPUT : 14:24:31	INSERT INTO Visits VALUES (101, 1, '2025-01-10', 201, 'Flu', 150.00), (102, 2, '2025-01-12', 202, 'Diabetes', 400.00), (103, 3, '2025-02-05', 203, 'Flu', 180.00), (104, 4, '2025-02-10', 204, 'Hypertension', 500.00), (105, 5, '2025-03-15', 205, 'Diabetes', 350.00), (106, 1, '2025-03-18', 201, 'Allergy', 220.00), (107, 2, '2025-04-01', 202, 'Flu', 120.00), (108, 3, '2025-04-20', 203, 'Hypertension', 450.00)	8 row(s) affected Records: 8  Duplicates: 0  Warnings: 0	0.125 sec

-- Task 1: Grouping Data by Diagnosis
SELECT
    diagnosis,
    AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis;
# diagnosis, avg_treatment_cost

-- OUTPUT : 14:24:55	SELECT     diagnosis,     AVG(treatment_cost) AS avg_treatment_cost FROM Visits GROUP BY diagnosis LIMIT 0, 1000	4 row(s) returned	0.031 sec / 0.000 sec

-- 'Flu', '150.000000'
-- 'Diabetes', '375.000000'
-- 'Hypertension', '475.000000'
-- 'Allergy', '220.000000'

-- Task 2: Filtering with HAVING Clause
SELECT
    diagnosis,
    AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;
-- OUTPUT : 14:26:29	SELECT     diagnosis,     AVG(treatment_cost) AS avg_treatment_cost FROM Visits GROUP BY diagnosis HAVING AVG(treatment_cost) > 200 LIMIT 0, 1000	3 row(s) returned	0.015 sec / 0.000 sec

# diagnosis, avg_treatment_cost
-- 'Diabetes', '375.000000'
-- 'Hypertension', '475.000000'
-- 'Allergy', '220.000000'

-- Task 3: Sorting the Results
SELECT
    diagnosis,
    AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_treatment_cost DESC;

-- OUTPUT : 14:27:00	SELECT     diagnosis,     AVG(treatment_cost) AS avg_treatment_cost FROM Visits GROUP BY diagnosis ORDER BY avg_treatment_cost DESC LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec

# diagnosis, avg_treatment_cost
-- 'Hypertension', '475.000000'
-- 'Diabetes', '375.000000'
-- 'Allergy', '220.000000'
-- 'Flu', '150.000000'

-- Task 4: Creating Index & Testing Performance
CREATE INDEX idx_patient_id ON Visits(patient_id);
-- OUTPUT : 14:27:34	CREATE INDEX idx_patient_id ON Visits(patient_id)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.921 sec

SELECT
    V.visit_id, V.visit_date, V.doctor_id, V.diagnosis, V.treatment_cost
FROM Visits V
WHERE V.patient_id = 2;
-- OUTPUT : 14:27:35	SELECT     V.visit_id, V.visit_date, V.doctor_id, V.diagnosis, V.treatment_cost FROM Visits V WHERE V.patient_id = 2 LIMIT 0, 1000	2 row(s) returned	0.016 sec / 0.000 sec

# visit_id, visit_date, doctor_id, diagnosis, treatment_cost
-- '102', '2025-01-12', '202', 'Diabetes', '400.00'
-- '107', '2025-04-01', '202', 'Flu', '120.00'
