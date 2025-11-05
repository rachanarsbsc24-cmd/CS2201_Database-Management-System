-- Lab Experiment 05 - SQL Joins

-- Objective:
-- To understand the concept of SQL joins and their applications in relational databases.
-- To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- Step 1: Create Database
DROP DATABASE IF EXISTS Lab05_Joins;
-- OUTPUT: 19:57:34	DROP DATABASE IF EXISTS Lab05_Joins	0 row(s) affected, 1 warning(s): 1008 Can't drop database 'lab05_joins'; database doesn't exist	0.156 sec

CREATE DATABASE Lab05_Joins;
-- OUTPUT : 19:57:40	CREATE DATABASE Lab05_Joins	1 row(s) affected	0.157 sec

USE Lab05_Joins;
-- OUTPUT : 19:57:44	USE Lab05_Joins	0 row(s) affected	0.000 sec

-- Step 2: Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
-- OUTPUT : 19:59:11	CREATE TABLE Customers (     customer_id INT PRIMARY KEY,     customer_name VARCHAR(50),     city VARCHAR(50) )	0 row(s) affected	0.860 sec


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- OUTPUT : 19:59:36	CREATE TABLE Orders (     order_id INT PRIMARY KEY,     customer_id INT,     product_name VARCHAR(50),     order_date DATE,     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) )	0 row(s) affected	1.015 sec

-- Step 3: Insert Sample Data
INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'A', 'Bangalore'),
(2, 'B', 'Delhi'),
(3, 'C', 'Mumbai'),
(4, 'D', 'Chennai');
-- OUTPUT : 19:59:58	INSERT INTO Customers (customer_id, customer_name, city) VALUES (1, 'A', 'Bangalore'), (2, 'B', 'Delhi'), (3, 'C', 'Mumbai'), (4, 'D', 'Chennai')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.109 sec

INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES
(101, 1, 'Laptop', '2023-12-15'),
(102, 2, 'Smartphone', '2024-01-10'),
(103, 1, 'Headphones', '2024-02-20'),
(104, 3, 'Tablet', '2024-03-05');
-- OUTPUT : 20:00:17	INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES (101, 1, 'Laptop', '2023-12-15'), (102, 2, 'Smartphone', '2024-01-10'), (103, 1, 'Headphones', '2024-02-20'), (104, 3, 'Tablet', '2024-03-05')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.093 sec

-- LAB TASKS

-- 1. INNER JOIN
-- Purpose: Returns rows that have matching values in both tables.
-- Task: Find all orders placed by customers from the city "Bangalore".

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_date
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';
-- OUTPUT : 20:00:59	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c INNER JOIN Orders o ON c.customer_id = o.customer_id WHERE c.city = 'Bangalore' LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'

-- 2. LEFT OUTER JOIN
-- Purpose: Returns all rows from the left table, even if there are no matches in the right table.
-- Task: Find all customers and their orders, even if a customer has no orders.

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_date
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;
-- OUTPUT : 20:01:51	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'
-- '4', 'D', 'Chennai', NULL, NULL, NULL

-- 3. RIGHT OUTER JOIN
-- Purpose: Returns all rows from the right table, even if there are no matches in the left table.
-- Task: Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_date
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;
-- OUTPUT : 20:03:06	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c RIGHT JOIN Orders o ON c.customer_id = o.customer_id LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'

-- 4. FULL OUTER JOIN
-- Purpose: Returns all rows when there is a match in either left or right table.
-- Task: Find all customers and their orders, including those customers with no orders and orders without a customer.
-- NOTE: MySQL does not directly support FULL OUTER JOIN.

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_date
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id

UNION

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_date
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;
-- OUTPUT : 20:08:25	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id  UNION  SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c RIGHT JOIN Orders o ON c.customer_id = o.customer_id	5 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'
-- '4', 'D', 'Chennai', NULL, NULL, NULL



-- 5. NATURAL JOIN
-- Purpose: Similar to an inner join, but automatically joins on columns with the same name in both tables.
-- Task: Assume Customers and Orders have common column customer_id. Find all orders placed by customers.

SELECT *
FROM Customers
NATURAL JOIN Orders;
-- OUTPUT : 20:10:35	SELECT * FROM Customers NATURAL JOIN Orders LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'

-- END OF EXPERIMENT