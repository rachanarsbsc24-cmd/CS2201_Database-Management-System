-- Lab Experiment 05 - SQL Joins

-- Objective:
-- To understand the concept of SQL joins and their applications in relational databases.
-- To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- Step 1: Create Database
DROP DATABASE IF EXISTS Lab05_Joins;
-- OUTPUT : 20:19:03	DROP DATABASE IF EXISTS Lab05_Joins	2 row(s) affected	0.422 sec

CREATE DATABASE Lab05_Joins;
-- OUTPUT : 20:19:23	CREATE DATABASE Lab05_Joins	1 row(s) affected	0.110 sec

USE Lab05_Joins;
-- OUTPUT : 20:19:39	USE Lab05_Joins	0 row(s) affected	0.000 sec

-- Step 2: Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
-- OUTPUT: 20:19:54	CREATE TABLE Customers (     customer_id INT PRIMARY KEY,     customer_name VARCHAR(50),     city VARCHAR(50) )	0 row(s) affected	0.313 sec

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- OUTPUT : 20:20:20	CREATE TABLE Orders (     order_id INT PRIMARY KEY,     customer_id INT,     product_name VARCHAR(50),     order_date DATE,     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) )	0 row(s) affected	0.421 sec

-- Step 3: Insert Sample Data
INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'A', 'Bangalore'),
(2, 'B', 'Delhi'),
(3, 'C', 'Mumbai'),
(4, 'D', 'Chennai');
-- OUTPUT : 20:20:37	INSERT INTO Customers (customer_id, customer_name, city) VALUES (1, 'A', 'Bangalore'), (2, 'B', 'Delhi'), (3, 'C', 'Mumbai'), (4, 'D', 'Chennai')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.062 sec

INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES
(101, 1, 'Laptop', '2023-12-15'),
(102, 2, 'Smartphone', '2024-01-10'),
(103, 1, 'Headphones', '2024-02-20'),
(104, 3, 'Tablet', '2024-03-05');
-- OUTPUT : 20:20:56	INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES (101, 1, 'Laptop', '2023-12-15'), (102, 2, 'Smartphone', '2024-01-10'), (103, 1, 'Headphones', '2024-02-20'), (104, 3, 'Tablet', '2024-03-05')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.078 sec

-- LAB TASKS

-- 1. INNER JOIN
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
-- OUTPUT : 20:22:22	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c INNER JOIN Orders o ON c.customer_id = o.customer_id WHERE c.city = 'Bangalore' LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'

-- 2. LEFT OUTER JOIN
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
-- OUTPUT : 20:23:10	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'
-- '4', 'D', 'Chennai', NULL, NULL, NULL

-- 3. RIGHT OUTER JOIN
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
-- OUTPUT : 20:23:50	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c RIGHT JOIN Orders o ON c.customer_id = o.customer_id LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'

-- 4. FULL OUTER JOIN (Using UNION in MySQL)
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
-- OUTPUT : 20:25:58	SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id  UNION  SELECT      c.customer_id,     c.customer_name,     c.city,     o.order_id,     o.product_name,     o.order_date FROM Customers c RIGHT JOIN Orders o ON c.customer_id = o.customer_id	5 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'
-- '4', 'D', 'Chennai', NULL, NULL, NULL

-- 5. NATURAL JOIN
SELECT *
FROM Customers
NATURAL JOIN Orders;
-- OUTPUT : 20:26:44	SELECT * FROM Customers NATURAL JOIN Orders LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
# customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'A', 'Bangalore', '101', 'Laptop', '2023-12-15'
-- '2', 'B', 'Delhi', '102', 'Smartphone', '2024-01-10'
-- '1', 'A', 'Bangalore', '103', 'Headphones', '2024-02-20'
-- '3', 'C', 'Mumbai', '104', 'Tablet', '2024-03-05'


-- END OF EXPERIMENT