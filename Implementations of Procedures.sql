-- ======================================================================
-- Lab Experiment – Implementation of Procedures in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create stored procedures in MySQL.
-- 2. To implement procedures for performing INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS CompanyDB;
-- OUTPUT : 14:56:09	DROP DATABASE IF EXISTS CompanyDB	0 row(s) affected, 1 warning(s): 1008 Can't drop database 'companydb'; database doesn't exist	0.063 sec

CREATE DATABASE CompanyDB;
-- OUTPUT : 14:56:14	CREATE DATABASE CompanyDB	1 row(s) affected	0.109 sec

USE CompanyDB;
-- OUTPUT : 14:56:19	USE CompanyDB	0 row(s) affected	0.000 sec

-- ======================================================================
-- Step 2: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- OUTPUT: 14:56:25	CREATE TABLE Employees (     EmpID INT PRIMARY KEY AUTO_INCREMENT,     EmpName VARCHAR(50),     Department VARCHAR(50),     Salary DECIMAL(10,2) )	0 row(s) affected	0.282 sec

-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('John', 'IT', 55000),
('Alice', 'HR', 48000),
('Bob', 'Finance', 60000);

-- OUTPUT: 14:57:36	INSERT INTO Employees (EmpName, Department, Salary) VALUES ('John', 'IT', 55000), ('Alice', 'HR', 48000), ('Bob', 'Finance', 60000)	3 row(s) affected Records: 3  Duplicates: 0  Warnings: 0	0.094 sec

-- ======================================================================
-- Task 1: Create a Basic Procedure
-- Create a procedure named `DisplayEmployees` that retrieves all records from the Employees table.
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW

DELIMITER //
CREATE PROCEDURE DisplayEmployees()
BEGIN
    SELECT * FROM Employees;
END //
DELIMITER ;

-- OUTPUT: 14:58:08	CREATE PROCEDURE DisplayEmployees() BEGIN     SELECT * FROM Employees; END	0 row(s) affected	0.140 sec

-- ======================================================================
-- Task 2: Procedure for INSERT Operation
-- Create a procedure named `AddEmployee` that inserts a new employee record.
-- Parameters: (p_name VARCHAR(50), p_dept VARCHAR(50), p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW

DELIMITER //
CREATE PROCEDURE AddEmployee(
    IN p_name VARCHAR(50),
    IN p_dept VARCHAR(50),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employees (EmpName, Department, Salary)
    VALUES (p_name, p_dept, p_salary);
END //
DELIMITER ;

-- OUTPUT: 14:58:33	CREATE PROCEDURE AddEmployee(     IN p_name VARCHAR(50),     IN p_dept VARCHAR(50),     IN p_salary DECIMAL(10,2) ) BEGIN     INSERT INTO Employees (EmpName, Department, Salary)     VALUES (p_name, p_dept, p_salary); END	0 row(s) affected	0.125 sec

-- ======================================================================
-- Task 3: Procedure for UPDATE Operation
-- Create a procedure named `UpdateSalary` to update an employee’s salary based on EmpID.
-- Parameters: (p_empid INT, p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW

DELIMITER //
CREATE PROCEDURE UpdateSalary(
    IN p_empid INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET Salary = p_salary
    WHERE EmpID = p_empid;
END //
DELIMITER ;

-- OUTPUT: 14:59:17	CREATE PROCEDURE UpdateSalary(     IN p_empid INT,     IN p_salary DECIMAL(10,2) ) BEGIN     UPDATE Employees     SET Salary = p_salary     WHERE EmpID = p_empid; END	0 row(s) affected	0.094 sec

-- ======================================================================
-- Task 4: Procedure for DELETE Operation
-- Create a procedure named `RemoveEmployee` to delete an employee record based on EmpID.
-- Parameters: (p_empid INT)
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW

DELIMITER //
CREATE PROCEDURE RemoveEmployee(
    IN p_empid INT
)
BEGIN
    DELETE FROM Employees
    WHERE EmpID = p_empid;
END //
DELIMITER ;

-- OUTPUT: 14:59:45	CREATE PROCEDURE RemoveEmployee(     IN p_empid INT ) BEGIN     DELETE FROM Employees     WHERE EmpID = p_empid; END	0 row(s) affected	0.063 sec

-- ======================================================================
-- END OF EXPERIMENT – Implementation of Procedures
-- ======================================================================
