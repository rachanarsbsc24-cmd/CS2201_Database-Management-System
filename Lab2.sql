-- ======================================================================
-- Lab Experiment 02 – Implementation of DML Commands in SQL
-- ======================================================================

-- Objective:
-- To implement DML (Data Manipulation Language) commands such as 
-- INSERT, UPDATE, and DELETE using suitable examples.

-- Scenario:
-- You are managing a database for a library with two tables: Books and Members.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS LibraryDB;
-- OUTPUT : 21:17:11	DROP DATABASE IF EXISTS LibraryDB	0 row(s) affected, 1 warning(s): 1008 Can't drop database 'librarydb'; database doesn't exist	0.062 sec

CREATE DATABASE LibraryDB;
-- OUTPUT: 21:17:28	CREATE DATABASE LibraryDB	1 row(s) affected	0.110 sec

USE LibraryDB;
-- OUTPUT : 21:17:41	USE LibraryDB	0 row(s) affected	0.000 sec

-- ======================================================================
-- Task 01: Create Tables
-- Create Books and Members tables as per given structure.

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(50),
    published_year YEAR,
    available_copies INT,
    total_copies INT,
    genre VARCHAR(50),
    ISBN VARCHAR(20)
);
-- OUTPUT : 21:17:59	CREATE TABLE Books (     book_id INT PRIMARY KEY AUTO_INCREMENT,     title VARCHAR(100),     author VARCHAR(50),     published_year YEAR,     available_copies INT,     total_copies INT,     genre VARCHAR(50),     ISBN VARCHAR(20) )	0 row(s) affected	0.375 sec

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    membership_date DATE,
    membership_type VARCHAR(20),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);
-- OUTPUT : 21:18:12	CREATE TABLE Members (     member_id INT PRIMARY KEY AUTO_INCREMENT,     first_name VARCHAR(50),     last_name VARCHAR(50),     membership_date DATE,     membership_type VARCHAR(20),     email VARCHAR(100),     phone_number VARCHAR(20),     address VARCHAR(100) )	0 row(s) affected	0.313 sec

-- write the query here to verify the creation
SHOW TABLES;
-- OUTPUT : 21:18:26	SHOW TABLES	2 row(s) returned	0.015 sec / 0.000 sec
# Tables_in_librarydb
-- 'books'
-- 'members'

-- ======================================================================
-- Task 02: Integrity Constraints
-- Ensure that available_copies is always less than or equal to total_copies.
ALTER TABLE Books
ADD CONSTRAINT chk_available_copies
CHECK (available_copies <= total_copies);
-- OUTPUT : 21:18:57	ALTER TABLE Books ADD CONSTRAINT chk_available_copies CHECK (available_copies <= total_copies)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.734 sec

-- ======================================================================
-- Task 03: Insert a New Book
INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN)
VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Dystopian', '9780451524935');
-- OUTPUT : 21:19:26	INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN) VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Dystopian', '9780451524935')	1 row(s) affected	0.078 sec

-- Verify insertion
SELECT * FROM Books;
-- OUTPUT : 21:19:40	SELECT * FROM Books LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
# book_id, title, author, published_year, available_copies, total_copies, genre, ISBN
-- '1', '1984_The Black Swan', 'George Orwell', 1949, '4', '4', 'Dystopian', '9780451524935'

-- ======================================================================
-- Task 04: Add New Members
INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address)
VALUES ('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '1234567890', '123 Main St');
-- OUTPUT : 21:20:13	INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address) VALUES ('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '1234567890', '123 Main St')	1 row(s) affected	0.063 sec

INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address)
VALUES ('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '0987654321', '456 Oak St');
-- OUTPUT : 21:22:51	INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address) VALUES ('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '0987654321', '456 Oak St')	1 row(s) affected	0.093 sec

-- Verify insertion
SELECT * FROM Members;
-- OUTPUT : 21:23:24	SELECT * FROM Members LIMIT 0, 1000	2 row(s) returned	0.016 sec / 0.000 sec
# member_id, first_name, last_name, membership_date, membership_type, email, phone_number, address
-- '1', 'David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '1234567890', '123 Main St'
-- '2', 'Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '0987654321', '456 Oak St'

-- ======================================================================
-- Task 05: Update Book Details
UPDATE Books
SET available_copies = available_copies + 2,
    total_copies = total_copies + 2
WHERE title = '1984_The Black Swan';
-- OUTPUT : 21:35:25	UPDATE Books SET available_copies = available_copies + 2,     total_copies = total_copies + 2 WHERE title = '1984_The Black Swan'	1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0	0.078 sec


-- Verify update
SELECT * FROM Books;
-- OUTPUT : 21:27:40	SELECT * FROM Books LIMIT 0, 1000	1 row(s) returned	0.016 sec / 0.000 sec
# book_id, title, author, published_year, available_copies, total_copies, genre, ISBN
-- '1', '1984_The Black Swan', 'George Orwell', 1949, '4', '4', 'Dystopian', '9780451524935'

-- ======================================================================
-- Task 06: Modify a Member's Information
UPDATE Members
SET membership_type = 'Gold'
WHERE first_name = 'Emma' AND last_name = 'Wilson';
-- OUTPUT : 21:36:16	UPDATE Members SET membership_type = 'Gold' WHERE first_name = 'Emma' AND last_name = 'Wilson'	1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0	0.062 sec

-- Verify update
SELECT * FROM Members;
-- OUTPUT : 21:28:32	SELECT * FROM Members LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec
# member_id, first_name, last_name, membership_date, membership_type, email, phone_number, address
-- '1', 'David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '1234567890', '123 Main St'
-- '2', 'Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '0987654321', '456 Oak St'


-- ======================================================================
-- Task 07: Delete a Book Record
DELETE FROM Books
WHERE title = '1984_The Black Swan';
-- OUTPUT : 21:36:44	DELETE FROM Books WHERE title = '1984_The Black Swan'	1 row(s) affected	0.093 sec


-- Verify deletion
SELECT * FROM Books;
-- OUTPUT : # book_id, title, author, published_year, available_copies, total_copies, genre, ISBN

-- ======================================================================
-- Task 08: Remove a Member
DELETE FROM Members
WHERE first_name = 'David' AND last_name = 'Lee';
-- OUTPUT : 21:37:44	DELETE FROM Members WHERE first_name = 'David' AND last_name = 'Lee'	1 row(s) affected	0.062 sec

-- Verify deletion
SELECT * FROM Members;
-- OUTPUT : 21:38:02	SELECT * FROM Members LIMIT 0, 1000	1 row(s) returned	0.015 sec / 0.000 sec
# member_id, first_name, last_name, membership_date, membership_type, email, phone_number, address
-- '2', 'Emma', 'Wilson', '2024-05-22', 'Gold', 'emma.wilson@example.com', '0987654321', '456 Oak St'

-- ======================================================================
-- Extension (Optional)
-- Task: Create a Borrowing table to track which members have borrowed which books.
-- Include foreign keys referencing Books(book_id) and Members(member_id).
CREATE TABLE Borrowing (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
-- OUTPUT : 21:38:38	CREATE TABLE Borrowing (     borrow_id INT PRIMARY KEY AUTO_INCREMENT,     book_id INT,     member_id INT,     borrow_date DATE,     return_date DATE,     FOREIGN KEY (book_id) REFERENCES Books(book_id),     FOREIGN KEY (member_id) REFERENCES Members(member_id) )	0 row(s) affected	0.532 sec

-- Verify table structure
DESC Borrowing;
-- OUTPUT : 21:38:54	DESC Borrowing	5 row(s) returned	0.047 sec / 0.000 sec
# Field, Type, Null, Key, Default, Extra
-- 'borrow_id', 'int', 'NO', 'PRI', NULL, 'auto_increment'
-- 'book_id', 'int', 'YES', 'MUL', NULL, ''
-- 'member_id', 'int', 'YES', 'MUL', NULL, ''
-- 'borrow_date', 'date', 'YES', '', NULL, ''
-- 'return_date', 'date', 'YES', '', NULL, ''

-- ======================================================================
-- END OF EXPERIMENT 02
-- ======================================================================
