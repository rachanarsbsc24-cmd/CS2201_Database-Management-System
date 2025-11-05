-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
-- OUTPUT : 15:06:56	DROP DATABASE IF EXISTS HospitalDB	2 row(s) affected	0.422 sec

CREATE DATABASE HospitalDB;
-- OUTPUT : 15:07:30	CREATE DATABASE HospitalDB	1 row(s) affected	0.140 sec

USE HospitalDB;
-- OUTPUT : 15:07:33	USE HospitalDB	0 row(s) affected	0.000 sec

-- ======================================================================
-- Step 2: Create Tables
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);
-- OUTPUT : 15:07:50	CREATE TABLE Patients (     patient_id INT PRIMARY KEY AUTO_INCREMENT,     patient_name VARCHAR(50),     age INT,     gender VARCHAR(10) )	0 row(s) affected	0.266 sec

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
-- OUTPUT : 15:08:02	CREATE TABLE Visits (     visit_id INT PRIMARY KEY AUTO_INCREMENT,     patient_id INT,     visit_date DATE,     doctor_id INT,     diagnosis VARCHAR(100),     treatment_cost DECIMAL(10,2),     FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) )	0 row(s) affected	0.657 sec

-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Patients (patient_name, age, gender) VALUES
('Riya Sharma', 25, 'Female'),
('Arjun Mehta', 32, 'Male'),
('Sneha Rao', 29, 'Female'),
('Vikram Singh', 40, 'Male'),
('Priya Nair', 36, 'Female');

-- OUTPUT : 15:08:13	INSERT INTO Patients (patient_name, age, gender) VALUES ('Riya Sharma', 25, 'Female'), ('Arjun Mehta', 32, 'Male'), ('Sneha Rao', 29, 'Female'), ('Vikram Singh', 40, 'Male'), ('Priya Nair', 36, 'Female')	5 row(s) affected Records: 5  Duplicates: 0  Warnings: 0	0.094 sec

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES
(1, '2025-01-12', 101, 'Flu', 150.00),
(1, '2025-03-22', 102, 'Fever', 180.00),
(2, '2025-04-15', 103, 'Fracture', 600.00),
(3, '2025-02-10', 104, 'Allergy', 250.00),
(3, '2025-05-05', 104, 'Fever', 190.00),
(4, '2025-06-18', 105, 'Fracture', 700.00),
(5, '2025-07-09', 106, 'Flu', 160.00),
(5, '2025-08-22', 107, 'Diabetes', 400.00),
(2, '2025-09-10', 103, 'Allergy', 230.00);

-- OUTPUT : 15:08:25	INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES (1, '2025-01-12', 101, 'Flu', 150.00), (1, '2025-03-22', 102, 'Fever', 180.00), (2, '2025-04-15', 103, 'Fracture', 600.00), (3, '2025-02-10', 104, 'Allergy', 250.00), (3, '2025-05-05', 104, 'Fever', 190.00), (4, '2025-06-18', 105, 'Fracture', 700.00), (5, '2025-07-09', 106, 'Flu', 160.00), (5, '2025-08-22', 107, 'Diabetes', 400.00), (2, '2025-09-10', 103, 'Allergy', 230.00)	9 row(s) affected Records: 9  Duplicates: 0  Warnings: 0	0.047 sec

-- ======================================================================
-- Task 1: Grouping Data by Diagnosis
SELECT diagnosis, AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis;
-- OUTPUT : 15:08:35	SELECT diagnosis, AVG(treatment_cost) AS avg_cost FROM Visits GROUP BY diagnosis LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec

# diagnosis, avg_cost
-- 'Flu', '155.000000'
-- 'Fever', '185.000000'
-- 'Fracture', '650.000000'
-- 'Allergy', '240.000000'
-- 'Diabetes', '400.000000'

-- ======================================================================
-- Task 2: Filtering with HAVING Clause
SELECT diagnosis, AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;
-- OUTPUT : 15:09:37	SELECT diagnosis, AVG(treatment_cost) AS avg_cost FROM Visits GROUP BY diagnosis HAVING AVG(treatment_cost) > 200 LIMIT 0, 1000	3 row(s) returned	0.000 sec / 0.000 sec

# diagnosis, avg_cost
-- 'Fracture', '650.000000'
-- 'Allergy', '240.000000'
-- 'Diabetes', '400.000000'

-- ======================================================================
-- Task 3: Sorting the Results
SELECT diagnosis, AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_cost DESC;
-- OUTPUT : 15:10:02	SELECT diagnosis, AVG(treatment_cost) AS avg_cost FROM Visits GROUP BY diagnosis ORDER BY avg_cost DESC LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec

# diagnosis, avg_cost
-- 'Fracture', '650.000000'
-- 'Diabetes', '400.000000'
-- 'Allergy', '240.000000'
-- 'Fever', '185.000000'
-- 'Flu', '155.000000'

-- ======================================================================
-- Task 4: Optimizing with Indexes
CREATE INDEX idx_patient_id ON Visits(patient_id);
-- OUTPUT : 15:10:28	CREATE INDEX idx_patient_id ON Visits(patient_id)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.328 sec

SELECT * FROM Visits
WHERE patient_id = 2;
-- OUTPUT : 15:10:50	SELECT * FROM Visits WHERE patient_id = 2 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec

# visit_id, patient_id, visit_date, doctor_id, diagnosis, treatment_cost
-- '3', '2', '2025-04-15', '103', 'Fracture', '600.00'
-- '9', '2', '2025-09-10', '103', 'Allergy', '230.00'

-- ======================================================================
-- END OF EXPERIMENT
-- ======================================================================
