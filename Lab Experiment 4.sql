-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
-- OUTPUT: 13:02:02	DROP DATABASE IF EXISTS OperatorLab	4 row(s) affected	0.891 sec

CREATE DATABASE OperatorLab;
-- OUTPUT : 13:02:23	CREATE DATABASE OperatorLab	1 row(s) affected	0.172 sec

USE OperatorLab;
-- OUTPUT : 13:02:31	USE OperatorLab	0 row(s) affected	0.000 sec

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);
-- OUTPUT : 13:02:50	CREATE TABLE Employees (     EmployeeID INT PRIMARY KEY,     Name VARCHAR(50),     Age INT,     Salary DECIMAL(10,2),     Department VARCHAR(50),     HireDate DATE,     Address VARCHAR(100) )	0 row(s) affected	0.453 sec

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
-- OUTPUT: 13:03:05	CREATE TABLE Departments (     DepartmentID INT PRIMARY KEY,     DepartmentName VARCHAR(50) )	0 row(s) affected	0.437 sec


-- Step 3: Insert Sample Data
INSERT INTO Employees VALUES
(1, 'Alice', 28, 55000, 'IT', '2023-03-15', 'New York'),
(2, 'Bob', 35, 72000, 'HR', '2022-11-20', 'Los Angeles'),
(3, 'Charlie', 24, 48000, 'Finance', '2023-01-10', 'Chicago'),
(4, 'David', 40, 85000, 'IT', '2021-07-05', 'San Francisco'),
(5, 'Eve', 30, 60000, 'HR', '2022-12-12', NULL),
(6, 'Frank', 26, 52000, 'Marketing', '2023-02-18', 'New York');
-- OUTPUT : 13:03:20	INSERT INTO Employees VALUES (1, 'Alice', 28, 55000, 'IT', '2023-03-15', 'New York'), (2, 'Bob', 35, 72000, 'HR', '2022-11-20', 'Los Angeles'), (3, 'Charlie', 24, 48000, 'Finance', '2023-01-10', 'Chicago'), (4, 'David', 40, 85000, 'IT', '2021-07-05', 'San Francisco'), (5, 'Eve', 30, 60000, 'HR', '2022-12-12', NULL), (6, 'Frank', 26, 52000, 'Marketing', '2023-02-18', 'New York')	6 row(s) affected Records: 6  Duplicates: 0  Warnings: 0	0.110 sec

INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');
-- OUTPUT: 13:03:47	INSERT INTO Departments VALUES (1, 'IT'), (2, 'HR'), (3, 'Finance'), (4, 'Marketing')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.094 sec

-- Exercise 1: Arithmetic Operators

-- A. Add a bonus (10% of Salary) to each employee's salary
SELECT Name, Salary, (Salary + (Salary * 0.10)) AS Salary_With_Bonus
FROM Employees;
-- OUTPUT :13:04:01	SELECT Name, Salary, (Salary + (Salary * 0.10)) AS Salary_With_Bonus FROM Employees LIMIT 0, 1000	6 row(s) returned	0.000 sec / 0.000 sec
# Name, Salary, Salary_With_Bonus
-- 'Alice', '55000.00', '60500.0000'
-- 'Bob', '72000.00', '79200.0000'
-- 'Charlie', '48000.00', '52800.0000'
-- 'David', '85000.00', '93500.0000'
-- 'Eve', '60000.00', '66000.0000'
-- 'Frank', '52000.00', '57200.0000'

-- B. Subtract tax (15% of Salary) from each employee's salary
SELECT Name, Salary, (Salary - (Salary * 0.15)) AS Salary_After_Tax
FROM Employees;
-- OUTPUT : 13:04:39	SELECT Name, Salary, (Salary - (Salary * 0.15)) AS Salary_After_Tax FROM Employees LIMIT 0, 1000	6 row(s) returned	0.000 sec / 0.000 sec
# Name, Salary, Salary_After_Tax
-- 'Alice', '55000.00', '46750.0000'
-- 'Bob', '72000.00', '61200.0000'
-- 'Charlie', '48000.00', '40800.0000'
-- 'David', '85000.00', '72250.0000'
-- 'Eve', '60000.00', '51000.0000'
-- 'Frank', '52000.00', '44200.0000'

-- C. Calculate the yearly salary from the monthly salary
SELECT Name, Salary AS Monthly_Salary, (Salary * 12) AS Yearly_Salary
FROM Employees;
-- OUTPUT : 13:05:47	SELECT Name, Salary AS Monthly_Salary, (Salary * 12) AS Yearly_Salary FROM Employees LIMIT 0, 1000	6 row(s) returned	0.000 sec / 0.000 sec
# Name, Monthly_Salary, Yearly_Salary
-- 'Alice', '55000.00', '660000.00'
-- 'Bob', '72000.00', '864000.00'
-- 'Charlie', '48000.00', '576000.00'
-- 'David', '85000.00', '1020000.00'
-- 'Eve', '60000.00', '720000.00'
-- 'Frank', '52000.00', '624000.00'

-- D. Modulus Operator: remainder when age is divided by 5
SELECT Name, Age, (Age % 5) AS Remainder
FROM Employees;
-- OUTPUT: 13:06:27	SELECT Name, Age, (Age % 5) AS Remainder FROM Employees LIMIT 0, 1000	6 row(s) returned	0.000 sec / 0.000 sec
# Name, Age, Remainder
-- 'Alice', '28', '3'
-- 'Bob', '35', '0'
-- 'Charlie', '24', '4'
-- 'David', '40', '0'
-- 'Eve', '30', '0'
-- 'Frank', '26', '1'

-- Exercise 2: Logical Operators

-- A. Employees older than 30 AND salary greater than 50000
SELECT * FROM Employees
WHERE Age > 30 AND Salary > 50000;
-- OUTPUT : 13:07:12	SELECT * FROM Employees WHERE Age > 30 AND Salary > 50000 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '2', 'Bob', '35', '72000.00', 'HR', '2022-11-20', 'Los Angeles'
-- '4', 'David', '40', '85000.00', 'IT', '2021-07-05', 'San Francisco'

-- B. Employees in 'HR' department OR earn more than 70000
SELECT * FROM Employees
WHERE Department = 'HR' OR Salary > 70000;
-- OUTPUT : 13:07:37	SELECT * FROM Employees WHERE Department = 'HR' OR Salary > 70000 LIMIT 0, 1000	3 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '2', 'Bob', '35', '72000.00', 'HR', '2022-11-20', 'Los Angeles'
-- '4', 'David', '40', '85000.00', 'IT', '2021-07-05', 'San Francisco'
-- '5', 'Eve', '30', '60000.00', 'HR', '2022-12-12', NULL

-- C. Employees who do NOT live in 'New York'
SELECT * FROM Employees
WHERE NOT Address = 'New York';
-- OUTPUT : 13:08:09	SELECT * FROM Employees WHERE NOT Address = 'New York' LIMIT 0, 1000	3 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '2', 'Bob', '35', '72000.00', 'HR', '2022-11-20', 'Los Angeles'
-- '3', 'Charlie', '24', '48000.00', 'Finance', '2023-01-10', 'Chicago'
-- '4', 'David', '40', '85000.00', 'IT', '2021-07-05', 'San Francisco'

-- Exercise 3: Comparison Operators


-- A. Employees with salary equal to 60000
SELECT * FROM Employees
WHERE Salary = 60000;
-- OUTPUT : 13:09:56	SELECT * FROM Employees WHERE Salary = 60000 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '5', 'Eve', '30', '60000.00', 'HR', '2022-12-12', NULL

-- B. Employees who are not in 'IT' department
SELECT * FROM Employees
WHERE Department <> 'IT';
-- OUTPUT : 13:10:19	SELECT * FROM Employees WHERE Department <> 'IT' LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '2', 'Bob', '35', '72000.00', 'HR', '2022-11-20', 'Los Angeles'
-- '3', 'Charlie', '24', '48000.00', 'Finance', '2023-01-10', 'Chicago'
-- '5', 'Eve', '30', '60000.00', 'HR', '2022-12-12', NULL
-- '6', 'Frank', '26', '52000.00', 'Marketing', '2023-02-18', 'New York'

-- C. Employees younger than 25 with salary greater than 50000
SELECT * FROM Employees
WHERE Age < 25 AND Salary > 50000;
-- OUTPUT : 13:10:53	SELECT * FROM Employees WHERE Age < 25 AND Salary > 50000 LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address

-- Exercise 4: Special Operators

-- A. BETWEEN: Employees with age between 25 and 35
SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35;
-- OUTPUT : 13:11:29	SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1', 'Alice', '28', '55000.00', 'IT', '2023-03-15', 'New York'
-- '2', 'Bob', '35', '72000.00', 'HR', '2022-11-20', 'Los Angeles'
-- '5', 'Eve', '30', '60000.00', 'HR', '2022-12-12', NULL
-- '6', 'Frank', '26', '52000.00', 'Marketing', '2023-02-18', 'New York'

-- B. IN: Employees working in 'HR', 'IT', or 'Finance'
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');
-- OUTPUT : 13:12:53	SELECT * FROM Employees WHERE Department IN ('HR', 'IT', 'Finance') LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1', 'Alice', '28', '55000.00', 'IT', '2023-03-15', 'New York'
-- '2', 'Bob', '35', '72000.00', 'HR', '2022-11-20', 'Los Angeles'
-- '3', 'Charlie', '24', '48000.00', 'Finance', '2023-01-10', 'Chicago'
-- '4', 'David', '40', '85000.00', 'IT', '2021-07-05', 'San Francisco'
-- '5', 'Eve', '30', '60000.00', 'HR', '2022-12-12', NULL

-- C. LIKE: Employees whose names start with 'A'
SELECT * FROM Employees
WHERE Name LIKE 'A%';
-- OUTPUT : 13:13:39	SELECT * FROM Employees WHERE Name LIKE 'A%' LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '1', 'Alice', '28', '55000.00', 'IT', '2023-03-15', 'New York'

-- D. IS NULL: Employees whose address is not available
SELECT * FROM Employees
WHERE Address IS NULL;
-- OUTPUT : 13:14:03	SELECT * FROM Employees WHERE Address IS NULL LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, Name, Age, Salary, Department, HireDate, Address
-- '5', 'Eve', '30', '60000.00', 'HR', '2022-12-12', NULL

-- Exercise 5: Set Operators

-- Create two sample tables for 2022 and 2023 employee data

CREATE TABLE Employees2022 (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50)
);
-- OUTPUT : 13:14:45	CREATE TABLE Employees2022 (     EmployeeID INT,     Name VARCHAR(50),     Department VARCHAR(50) )	0 row(s) affected	0.453 sec

CREATE TABLE Employees2023 (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50)
);
-- OUTPUT : 13:15:10	CREATE TABLE Employees2023 (     EmployeeID INT,     Name VARCHAR(50),     Department VARCHAR(50) )	0 row(s) affected	0.907 sec

INSERT INTO Employees2022 VALUES
(1, 'Alice', 'IT'),
(2, 'Bob', 'HR'),
(3, 'Charlie', 'Finance'),
(4, 'David', 'IT');
-- OUTPUT : 13:15:24	INSERT INTO Employees2022 VALUES (1, 'Alice', 'IT'), (2, 'Bob', 'HR'), (3, 'Charlie', 'Finance'), (4, 'David', 'IT')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.094 sec

INSERT INTO Employees2023 VALUES
(2, 'Bob', 'HR'),
(3, 'Charlie', 'Finance'),
(5, 'Eve', 'HR'),
(6, 'Frank', 'IT');
-- OUTPUT : 13:15:38	INSERT INTO Employees2023 VALUES (2, 'Bob', 'HR'), (3, 'Charlie', 'Finance'), (5, 'Eve', 'HR'), (6, 'Frank', 'IT')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.109 sec

-- A. UNION: Employees from HR department in 2022 and 2023
SELECT Name FROM Employees2022 WHERE Department = 'HR'
UNION
SELECT Name FROM Employees2023 WHERE Department = 'HR';
-- OUTPUT : 13:15:53	SELECT Name FROM Employees2022 WHERE Department = 'HR' UNION SELECT Name FROM Employees2023 WHERE Department = 'HR'	2 row(s) returned	0.000 sec / 0.000 sec
# Name
-- 'Bob'
-- 'Eve'

-- B. INTERSECT: Common employees in IT department (2022 & 2023)
SELECT Name FROM Employees2022 WHERE Department = 'IT'
INTERSECT
SELECT Name FROM Employees2023 WHERE Department = 'IT';
-- OUTPUT : 13:16:37	SELECT Name FROM Employees2022 WHERE Department = 'IT' INTERSECT SELECT Name FROM Employees2023 WHERE Department = 'IT'	0 row(s) returned	0.000 sec / 0.000 sec
-- Name

-- C. EXCEPT: Employees who worked in 2023 but not in 2022
SELECT Name FROM Employees2023
EXCEPT
SELECT Name FROM Employees2022;
-- OUTPUT : 13:17:22	SELECT Name FROM Employees2023 EXCEPT SELECT Name FROM Employees2022	2 row(s) returned	0.000 sec / 0.000 sec
# Name
-- 'Eve'
-- 'Frank'

-- END OF EXPERIMENT