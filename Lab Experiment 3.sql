-- LAB EXPERIMENT 3 

-- Number Functions [ROUND, ABS, CEIL]

-- a. Round Salaries:
SELECT EmployeeID, FirstName, LastName, Salary, ROUND(Salary) AS Rounded_Salary
FROM Employees;
-- OUTPUT: 17:11:04	SELECT EmployeeID, FirstName, LastName, Salary, ROUND(Salary) AS Rounded_Salary FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, FirstName, LastName, Salary, Rounded_Salary
-- '1', 'John', 'Doe', '55000.30', '55000'
-- '2', 'Jane', 'Smith', '65000.50', '65001'
-- '3', 'Alice', 'Johnson', '72000.10', '72000'
-- '4', 'Bob', 'Brown', '48000.90', '48001'

-- b. Absolute Values (though salary is positive, for learning):
SELECT EmployeeID, FirstName, LastName, ABS(Salary) AS Absolute_Salary
FROM Employees;
-- OUTPUT: 17:11:44	SELECT EmployeeID, FirstName, LastName, ABS(Salary) AS Absolute_Salary FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# EmployeeID, FirstName, LastName, Absolute_Salary
-- '1', 'John', 'Doe', '55000.30'
-- '2', 'Jane', 'Smith', '65000.50'
-- '3', 'Alice', 'Johnson', '72000.10'
-- '4', 'Bob', 'Brown', '48000.90'

-- c. Ceiling Values of TotalAmount:
SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS Ceiling_Amount
FROM Orders;
-- OUTPUT: 17:12:35	SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS Ceiling_Amount FROM Orders LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# OrderID, TotalAmount, Ceiling_Amount
-- '1', '250.00', '250'
-- '2', '175.50', '176'
-- '3', '300.00', '300'
-- '4', '450.75', '451'
-- '5', '123.40', '124'

-- Aggregate Functions [COUNT, SUM, AVG, MAX, MIN]
-- a. Count of Employees:
SELECT COUNT(*) AS Total_Employees
FROM Employees; 
-- OUTPUT : 17:13:47	SELECT COUNT(*) AS Total_Employees FROM Employees LIMIT 0, 1000	1 row(s) returned	0.016 sec / 0.000 sec
# Total_Employees
-- '4'

-- b. Sum of Salaries:
SELECT SUM(Salary) AS Total_Salary_Expense
FROM Employees;
-- OUTPUT: 17:14:39	SELECT SUM(Salary) AS Total_Salary_Expense FROM Employees LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# Total_Salary_Expense
-- '240001.80'


-- c. Average Order Amount:
SELECT AVG(TotalAmount) AS Average_Order_Amount
FROM Orders;
-- OUTPUT : 17:15:28	SELECT AVG(TotalAmount) AS Average_Order_Amount FROM Orders LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# Average_Order_Amount
-- '259.930000'

-- d. Maximum and Minimum Salary:
SELECT MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary
FROM Employees;
-- OUTPUT : 17:15:58	SELECT MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary FROM Employees LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# Highest_Salary, Lowest_Salary
-- '72000.10', '48000.90'


-- Character Functions [UPPER, LOWER, CONCAT, SUBSTRING]

-- a. Convert Names to Upper and Lower Case:
SELECT 
    UPPER(FirstName) AS Upper_FirstName,
    LOWER(LastName) AS Lower_LastName
FROM Employees;
-- OUTPUT: 17:16:46	SELECT      UPPER(FirstName) AS Upper_FirstName,     LOWER(LastName) AS Lower_LastName FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# Upper_FirstName, Lower_LastName
-- 'JOHN', 'doe'
-- 'JANE', 'smith'
-- 'ALICE', 'johnson'
-- 'BOB', 'brown'

-- b. Concatenate First and Last Name (Full Name):
SELECT 
    CONCAT(FirstName, ' ', LastName) AS Full_Name
FROM Employees;
-- OUTPUT : 17:17:27	SELECT      CONCAT(FirstName, ' ', LastName) AS Full_Name FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# Full_Name
-- 'John Doe'
-- 'Jane Smith'
-- 'Alice Johnson'
-- 'Bob Brown'

-- c. Extract Substring (first 3 characters of FirstName):
SELECT 
    FirstName,
    SUBSTRING(FirstName, 1, 3) AS First_3_Chars
FROM Employees;
-- OUTPUT: 17:18:15	SELECT      FirstName,     SUBSTRING(FirstName, 1, 3) AS First_3_Chars FROM Employees LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# FirstName, First_3_Chars
-- 'John', 'Joh'
-- 'Jane', 'Jan'
-- 'Alice', 'Ali'
-- 'Bob', 'Bob'

-- Conversion Functions [CAST]

-- Convert String to Date:
SELECT 
    CAST('2025-10-16' AS DATE) AS Converted_Date;
-- OUTPUT: 17:19:05	SELECT      CAST('2025-10-16' AS DATE) AS Converted_Date LIMIT 0, 1000	1 row(s) returned	0.032 sec / 0.000 sec
# Converted_Date
-- '2025-10-16'

-- Date Functions [NOW, YEAR, DATE_ADD, DATEDIFF]

-- a. Current Date and Time:
SELECT NOW() AS Current_Date_Time;
-- OUTPUT: 10:53:52	SELECT NOW() AS Current_Date_Time LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# Current_Date_Time
-- '2025-10-17 10:53:52'


-- b. Extract Year from Order Date:
SELECT OrderID, OrderDate, YEAR(OrderDate) AS Order_Year
FROM Orders;
-- OUTPUT: 10:55:25	SELECT OrderID, OrderDate, YEAR(OrderDate) AS Order_Year FROM Orders LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# OrderID, OrderDate, Order_Year
-- '1', '2024-07-15', '2024'
-- '2', '2024-08-10', '2024'
-- '3', '2024-09-01', '2024'
-- '4', '2024-09-10', '2024'
-- '5', '2024-08-25', '2024'

-- c. Add 3 Months to Order Date:
SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS OrderDate_Plus_3_Months
FROM Orders;
-- OUTPUT : 10:56:38	SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS OrderDate_Plus_3_Months FROM Orders LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# OrderID, OrderDate, OrderDate_Plus_3_Months
-- '1', '2024-07-15', '2024-10-15'
-- '2', '2024-08-10', '2024-11-10'
-- '3', '2024-09-01', '2024-12-01'
-- '4', '2024-09-10', '2024-12-10'
-- '5', '2024-08-25', '2024-11-25'

-- d. Calculate Days Since Order (from today):
SELECT 
    OrderID,
    OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS Days_Since_Order
FROM Orders;
-- OUTPUT: 10:57:32	SELECT      OrderID,     OrderDate,     DATEDIFF(CURDATE(), OrderDate) AS Days_Since_Order FROM Orders LIMIT 0, 1000	5 row(s) returned	0.031 sec / 0.000 sec
# OrderID, OrderDate, Days_Since_Order
-- '1', '2024-07-15', '459'
-- '2', '2024-08-10', '433'
-- '3', '2024-09-01', '411'
-- '4', '2024-09-10', '402'
-- '5', '2024-08-25', '418'


-- END OF EXPERIMENT