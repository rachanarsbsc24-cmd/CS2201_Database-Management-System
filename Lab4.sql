-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL

DROP DATABASE IF EXISTS OperatorLab;
-- OUTPUT: 12:39:20	DROP DATABASE IF EXISTS OperatorLab	0 row(s) affected, 1 warning(s): 1008 Can't drop database 'operatorlab'; database doesn't exist	0.187 sec

CREATE DATABASE OperatorLab;
-- OUTPUT : 12:39:39	CREATE DATABASE OperatorLab	1 row(s) affected	0.234 sec

USE OperatorLab;
-- OUTPUT: 12:39:51	USE OperatorLab	0 row(s) affected	0.000 sec
 

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);
-- OUTPUT : 12:40:16	CREATE TABLE Employees (     EmployeeID INT PRIMARY KEY,     Name VARCHAR(50),     Age INT,     Salary DECIMAL(10, 2),     Department VARCHAR(50),     HireDate DATE,     Address VARCHAR(100) )	0 row(s) affected	0.984 sec

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- OUTPUT : 12:40:31	CREATE TABLE Departments (     DepartmentID INT PRIMARY KEY,     DepartmentName VARCHAR(50),     EmployeeID INT,     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) )	0 row(s) affected	1.313 sec

INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');
-- OUTPUT: 12:40:50	INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES (1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'), (1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'), (1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'), (1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.312 sec

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);
-- OUTPUT : 12:41:09	INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES (1, 'IT', 1001), (2, 'HR', 1002), (3, 'Finance', 1003)	3 row(s) affected Records: 3  Duplicates: 0  Warnings: 0	0.234 sec

-- PRACTICE TASKS
-- Exercise 1: Arithmetic Operators

-- a. Add a bonus (10% of Salary) to each employee's salary.
SELECT Name, Salary, Salary + (Salary * 0.10) AS Salary_With_Bonus
FROM Employees;
-- OUTPUT: 12:41:26	SELECT Name, Salary, Salary + (Salary * 0.10) AS Salary_With_Bonus FROM Employees LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec
# Name, Salary, Salary_With_Bonus
-- 'Ashish', '60000.00', '66000.0000'
-- 'Binay', '80000.00', '88000.0000'
-- 'Charlie', '55000.00', '60500.0000'
-- 'Dhruv', '75000.00', '82500.0000'

-- b. Subtract tax (15% of Salary) from each employee's salary.
SELECT Name, Salary, Salary - (Salary * 0.15) AS Salary_After_Tax
FROM Employees;
-- OUTPUT : 12:42:06	SELECT Name, Salary, Salary - (Salary * 0.15) AS Salary_After_Tax FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# Name, Salary, Salary_After_Tax
-- 'Ashish', '60000.00', '51000.0000'
-- 'Binay', '80000.00', '68000.0000'
-- 'Charlie', '55000.00', '46750.0000'
-- 'Dhruv', '75000.00', '63750.0000'

-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
SELECT Name, Salary, Salary * 12 AS Yearly_Salary
FROM Employees;
-- OUTPUT: 12:42:48	SELECT Name, Salary, Salary * 12 AS Yearly_Salary FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# Name, Salary, Yearly_Salary
-- 'Ashish', '60000.00', '720000.00'
-- 'Binay', '80000.00', '960000.00'
-- 'Charlie', '55000.00', '660000.00'
-- 'Dhruv', '75000.00', '900000.00'

-- d. Find the remainder when employees' ages are divided by 5.
SELECT Name, Age, Age % 5 AS Age_Remainder
FROM Employees;
-- OUTPUT : 12:43:30	SELECT Name, Age, Age % 5 AS Age_Remainder FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# Name, Age, Age_Remainder
-- 'Ashish', '28', '3'
-- 'Binay', '45', '0'
-- 'Charlie', '32', '2'
-- 'Dhruv', '38', '3'

-- Exercise 2: Logical Operators

-- a. Employees older than 30 and salary greater than 50000.
SELECT * FROM Employees
WHERE Age > 30 AND Salary > 50000;
-- OUTPUT : 12:44:26	SELECT * FROM Employees WHERE Age > 30 AND Salary > 50000 LIMIT 0, 1000	3 row(s) returned	0.016 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1002', 'Binay', '45', '80000.00', 'HR', '2020-07-15', '456 Elm St, Chicago'
-- '1003', 'Charlie', '32', '55000.00', 'Finance', '2022-01-10', '789 Oak St, Los Angeles'
-- '1004', 'Dhruv', '38', '75000.00', 'HR', '2021-10-30', '101 Pine St, New York'

-- b. Employees either in 'HR' department OR salary > 70000.
SELECT * FROM Employees
WHERE Department = 'HR' OR Salary > 70000;
-- OUTPUT: 12:45:06	SELECT * FROM Employees WHERE Department = 'HR' OR Salary > 70000 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1002', 'Binay', '45', '80000.00', 'HR', '2020-07-15', '456 Elm St, Chicago'
-- '1004', 'Dhruv', '38', '75000.00', 'HR', '2021-10-30', '101 Pine St, New York'

-- c. Employees who do NOT live in 'New York'.
SELECT * FROM Employees
WHERE Address NOT LIKE '%New York%';
-- OUTPUT 12:45:39	SELECT * FROM Employees WHERE Address NOT LIKE '%New York%' LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1002', 'Binay', '45', '80000.00', 'HR', '2020-07-15', '456 Elm St, Chicago'
-- '1003', 'Charlie', '32', '55000.00', 'Finance', '2022-01-10', '789 Oak St, Los Angeles'

-- Exercise 3: Comparison Operators


-- a. Find employees with salary = 60000.
SELECT * FROM Employees
WHERE Salary = 60000;
-- OUTPUT: 12:46:36	SELECT * FROM Employees WHERE Salary = 60000 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1001', 'Ashish', '28', '60000.00', 'IT', '2024-05-01', '123 Main St, New York'

-- b. List employees not in the 'IT' department.
SELECT * FROM Employees
WHERE Department <> 'IT';
-- OUTPUT : 12:47:11	SELECT * FROM Employees WHERE Department <> 'IT' LIMIT 0, 1000	3 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1002', 'Binay', '45', '80000.00', 'HR', '2020-07-15', '456 Elm St, Chicago'
-- '1003', 'Charlie', '32', '55000.00', 'Finance', '2022-01-10', '789 Oak St, Los Angeles'
-- '1004', 'Dhruv', '38', '75000.00', 'HR', '2021-10-30', '101 Pine St, New York'

-- c. Retrieve employees younger than 25 with salary > 50000.
SELECT * FROM Employees
WHERE Age < 25 AND Salary > 50000;
-- OUTPUT : 12:48:23	SELECT * FROM Employees WHERE Age < 25 AND Salary > 50000 LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address


-- Exercise 4: Special Operators

-- a. BETWEEN → List employees with age between 25 and 35.
SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35;
-- OUTPUT: 12:49:45	SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1001', 'Ashish', '28', '60000.00', 'IT', '2024-05-01', '123 Main St, New York'
-- '1003', 'Charlie', '32', '55000.00', 'Finance', '2022-01-10', '789 Oak St, Los Angeles'

-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');
-- OUTPUT : 12:50:16	SELECT * FROM Employees WHERE Department IN ('HR', 'IT', 'Finance') LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1001', 'Ashish', '28', '60000.00', 'IT', '2024-05-01', '123 Main St, New York'
-- '1002', 'Binay', '45', '80000.00', 'HR', '2020-07-15', '456 Elm St, Chicago'
-- '1003', 'Charlie', '32', '55000.00', 'Finance', '2022-01-10', '789 Oak St, Los Angeles'
-- '1004', 'Dhruv', '38', '75000.00', 'HR', '2021-10-30', '101 Pine St, New York'

-- c. LIKE → Find employees whose names start with 'A'.
SELECT * FROM Employees
WHERE Name LIKE 'A%';
-- OUTPUT: 12:50:48	SELECT * FROM Employees WHERE Name LIKE 'A%' LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1001', 'Ashish', '28', '60000.00', 'IT', '2024-05-01', '123 Main St, New York'

-- d. IS NULL → List employees whose address is not available.
SELECT * FROM Employees
WHERE Address IS NULL;
-- OUTPUT: 12:51:11	SELECT * FROM Employees WHERE Address IS NULL LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address

-- Exercise 5: Set Operators


-- Create temporary tables for demonstration
CREATE TABLE Employees2022 AS
SELECT EmployeeID, Name, Department FROM Employees;
-- OUTPUT: 12:51:48	CREATE TABLE Employees2022 AS SELECT EmployeeID, Name, Department FROM Employees	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.562 sec

CREATE TABLE Employees2023 AS
SELECT EmployeeID, Name, Department FROM Employees;
-- OUTPUT : 12:52:25	CREATE TABLE Employees2023 AS SELECT EmployeeID, Name, Department FROM Employees	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.422 sec

-- Change one department to show difference
UPDATE Employees2023 SET Department = 'Admin' WHERE EmployeeID = 1003;
-- OUTPUT : 12:52:39	UPDATE Employees2023 SET Department = 'Admin' WHERE EmployeeID = 1003	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.031 sec

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
SELECT Name, Department FROM Employees2022 WHERE Department = 'HR'
UNION
SELECT Name, Department FROM Employees2023 WHERE Department = 'HR';
-- OUTPUT: 12:53:00	SELECT Name, Department FROM Employees2022 WHERE Department = 'HR' UNION SELECT Name, Department FROM Employees2023 WHERE Department = 'HR'	2 row(s) returned	0.047 sec / 0.000 sec
# Name, Department
-- 'Binay', 'HR'
-- 'Dhruv', 'HR'

-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
SELECT e22.Name, e22.Department
FROM Employees2022 e22
INNER JOIN Employees2023 e23
ON e22.EmployeeID = e23.EmployeeID
WHERE e22.Department = 'IT' AND e23.Department = 'IT';
-- OUTPUT : 12:53:50	SELECT e22.Name, e22.Department FROM Employees2022 e22 INNER JOIN Employees2023 e23 ON e22.EmployeeID = e23.EmployeeID WHERE e22.Department = 'IT' AND e23.Department = 'IT' LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# Name, Department
-- 'Ashish', 'IT'

-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
SELECT e23.Name, e23.Department
FROM Employees2023 e23
LEFT JOIN Employees2022 e22
ON e23.EmployeeID = e22.EmployeeID
WHERE e22.EmployeeID IS NULL;
-- OUTPUT: 12:54:23	SELECT e23.Name, e23.Department FROM Employees2023 e23 LEFT JOIN Employees2022 e22 ON e23.EmployeeID = e22.EmployeeID WHERE e22.EmployeeID IS NULL LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec
-- Name, Department

-- END OF EXPERIMENT 