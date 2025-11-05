
-- Lab Experiment 03: Implementation of different types of SQL functions.

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT: 13:56:08	SELECT USER(),         @@hostname AS Host_Name,         VERSION() AS MySQL_Version,         NOW() AS Current_Date_Time LIMIT 0, 1000	1 row(s) returned	0.078 sec / 0.000 sec

 # USER(), Host_Name, MySQL_Version, Current_Date_Time
-- 'root@localhost', 'DESKTOP-7GSRCBU', '8.0.43', '2025-10-16 13:56:08'

CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);
-- OUTPUT: 13:58:19	CREATE TABLE Employees1 (     EmployeeID INT PRIMARY KEY AUTO_INCREMENT,     FirstName VARCHAR(50),     LastName VARCHAR(50),     Salary DECIMAL(10, 2),     BirthDate DATE,     HireDate DATE )	0 row(s) affected	0.343 sec

INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

-- OUTPUT: 13:58:45	INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES ('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'), ('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'), ('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'), ('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.094 sec

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
 -- OUTPUT: 13:59:26	CREATE TABLE Orders (     OrderID INT PRIMARY KEY AUTO_INCREMENT,     OrderDate DATE,     TotalAmount DECIMAL(10, 2),     EmployeeID INT,     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) )	0 row(s) affected	1.360 sec

INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
-- OUTPUT : 14:02:38	INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES ('2024-07-15', 250.00, 1), ('2024-08-10', 175.50, 2), ('2024-09-01', 300.00, 3), ('2024-09-10', 450.75, 1), ('2024-08-25', 123.40, 4)	5 row(s) affected Records: 5  Duplicates: 0  Warnings: 0	0.187 sec

SELECT * FROM Employees;
-- OUTPUT : 14:03:23	SELECT * FROM Employees LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec

# EmployeeID, FirstName, LastName, Salary, BirthDate, HireDate
-- '1', 'John', 'Doe', '55000.30', '1985-06-15', '2010-01-20'
-- '2', 'Jane', 'Smith', '65000.50', '1990-08-22', '2012-07-10'
-- '3', 'Alice', 'Johnson', '72000.10', '1982-11-30', '2015-05-25'
-- '4', 'Bob', 'Brown', '48000.90', '1978-03-12', '2018-09-15'

SELECT * FROM Orders;
-- OUTPUT: 14:04:39	SELECT * FROM Orders LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec

# OrderID, OrderDate, TotalAmount, EmployeeID
-- '1', '2024-07-15', '250.00', '1'
-- '2', '2024-08-10', '175.50', '2'
-- '3', '2024-09-01', '300.00', '3'
-- '4', '2024-09-10', '450.75', '1'
-- '5', '2024-08-25', '123.40', '4'

-- Number Functions Section

/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT EmployeeID, FirstName, LastName, Salary, ROUND(Salary) AS Rounded_Salary
FROM Employees;
-- OUTPUT: 14:07:34	SELECT EmployeeID, FirstName, LastName, Salary, ROUND(Salary) AS Rounded_Salary FROM Employees LIMIT 0, 1000	4 row(s) returned	0.031 sec / 0.016 sec
# EmployeeID, FirstName, LastName, Salary, Rounded_Salary
-- '1', 'John', 'Doe', '55000.30', '55000'
-- '2', 'Jane', 'Smith', '65000.50', '65001'
-- '3', 'Alice', 'Johnson', '72000.10', '72000'
-- '4', 'Bob', 'Brown', '48000.90', '48001'

/* b. Absolute Values: Show absolute values of salaries */
SELECT EmployeeID, FirstName, ABS(Salary) AS Absolute_Salary
FROM Employees;
-- OUTPUT : 14:10:13	SELECT EmployeeID, FirstName, ABS(Salary) AS Absolute_Salary FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, FirstName, Absolute_Salary
-- '1', 'John', '55000.30'
-- '2', 'Jane', '65000.50'
-- '3', 'Alice', '72000.10'
-- '4', 'Bob', '48000.90'

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS Ceil_Amount
FROM Orders;
-- OUTPUT : 14:11:46	SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS Ceil_Amount FROM Orders LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# OrderID, TotalAmount, Ceil_Amount
-- '1', '250.00', '250'
-- '2', '175.50', '176'
-- '3', '300.00', '300'
-- '4', '450.75', '451'
-- '5', '123.40', '124'

-- Aggregate Functions Section

/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS Total_Employees FROM Employees;
-- OUTPUT: 14:15:47	SELECT COUNT(*) AS Total_Employees FROM Employees LIMIT 0, 1000	1 row(s) returned	0.031 sec / 0.000 sec
# Total_Employees
-- '4'

/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) AS Total_Salary_Expense FROM Employees;
-- OUTPUT: 14:20:11	SELECT SUM(Salary) AS Total_Salary_Expense FROM Employees LIMIT 0, 1000	1 row(s) returned	0.031 sec / 0.000 sec
# Total_Salary_Expense
-- '240001.80'

/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) AS Average_Order_Value FROM Orders;
-- OUTPUT : 15:22:57	SELECT AVG(TotalAmount) AS Average_Order_Value FROM Orders LIMIT 0, 1000	1 row(s) returned	0.031 sec / 0.000 sec
# Average_Order_Value
-- '259.930000'

/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary FROM Employees;
-- OUTPUT: 15:24:11	SELECT MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary FROM Employees LIMIT 0, 1000	1 row(s) returned	0.047 sec / 0.000 sec
# Highest_Salary, Lowest_Salary
-- '72000.10', '48000.90'

-- Character Functions Section

/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT FirstName, 
       UPPER(FirstName) AS UpperCase_Name, 
       LOWER(LastName) AS LowerCase_Name
FROM Employees;
-- OUTPUT : 15:25:17	SELECT FirstName,         UPPER(FirstName) AS UpperCase_Name,         LOWER(LastName) AS LowerCase_Name FROM Employees LIMIT 0, 1000	4 row(s) returned	0.031 sec / 0.000 sec
# FirstName, UpperCase_Name, LowerCase_Name
-- 'John', 'JOHN', 'doe'
-- 'Jane', 'JANE', 'smith'
-- 'Alice', 'ALICE', 'johnson'
-- 'Bob', 'BOB', 'brown'
 
/* b. Concatenate Names: Create full names */
SELECT CONCAT(FirstName, ' ', LastName) AS Full_Name FROM Employees;
-- OUTPUT: 15:26:49	SELECT CONCAT(FirstName, ' ', LastName) AS Full_Name FROM Employees LIMIT 0, 1000	4 row(s) returned	0.015 sec / 0.000 sec
# Full_Name
-- 'John Doe'
-- 'Jane Smith'
-- 'Alice Johnson'
-- 'Bob Brown'

/* c. Extract Substring: Get first 3 characters of first names */
 SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS First_3_Chars FROM Employees;
-- OUTPUT : 15:28:27	SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS First_3_Chars FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# FirstName, First_3_Chars
-- 'John', 'Joh'
-- 'Jane', 'Jan'
-- 'Alice', 'Ali'
-- 'Bob', 'Bob'

-- Conversion Functions Section

/* Convert String to Date: Convert text to DATE type */
SELECT STR_TO_DATE('16-10-2025', '%d-%m-%Y') AS Converted_Date;
-- OUTPUT: 15:29:45	SELECT STR_TO_DATE('16-10-2025', '%d-%m-%Y') AS Converted_Date LIMIT 0, 1000	1 row(s) returned	0.031 sec / 0.000 sec
# Converted_Date
-- '2025-10-16'

-- Date Functions Section

/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS `Current_Timestamp`;
-- OUTPUT: 15:37:25	SELECT NOW() AS `Current_Timestamp` LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# Current_Timestamp
-- '2025-10-16 15:37:25'

/* b. Extract Year: Get year from order dates */
SELECT OrderID, OrderDate, YEAR(OrderDate) AS Order_Year FROM Orders;
-- Output: 15:38:43	SELECT OrderID, OrderDate, YEAR(OrderDate) AS Order_Year FROM Orders LIMIT 0, 1000	5 row(s) returned	0.047 sec / 0.000 sec
# OrderID, OrderDate, Order_Year
-- '1', '2024-07-15', '2024'
-- '2', '2024-08-10', '2024'
-- '3', '2024-09-01', '2024'
-- '4', '2024-09-10', '2024'
-- '5', '2024-08-25', '2024'

/* c. Add Months: Add 3 months to order dates */
SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS New_Date
FROM Orders;
-- OUTPUT: 15:39:43	SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS New_Date FROM Orders LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
-- # OrderID, OrderDate, New_Date
-- '1', '2024-07-15', '2024-10-15'
-- '2', '2024-08-10', '2024-11-10'
-- '3', '2024-09-01', '2024-12-01'
-- '4', '2024-09-10', '2024-12-10'
-- '5', '2024-08-25', '2024-11-25'

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, OrderDate, DATEDIFF(NOW(), OrderDate) AS Days_Since_Order
FROM Orders;
-- OUTPUT: 15:41:17	SELECT OrderID, OrderDate, DATEDIFF(NOW(), OrderDate) AS Days_Since_Order FROM Orders LIMIT 0, 1000	5 row(s) returned	0.016 sec / 0.000 sec
# OrderID, OrderDate, Days_Since_Order
-- '1', '2024-07-15', '458'
-- '2', '2024-08-10', '432'
-- '3', '2024-09-01', '410'
-- '4', '2024-09-10', '401'
-- '5', '2024-08-25', '417'

-- END OF EXPERIMENT 

