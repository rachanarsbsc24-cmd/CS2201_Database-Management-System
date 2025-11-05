-- ===============================================
-- Program 02: Implementation of DML Commands
-- Library Database (Books and Members)
-- ===============================================

-- Step 0: Drop tables if they already exist
DROP TABLE IF EXISTS Borrowing;
-- OUTPUT : 22:07:15	DROP TABLE IF EXISTS Borrowing	0 row(s) affected, 1 warning(s): 1051 Unknown table 'db_lab.borrowing'	0.047 sec

DROP TABLE IF EXISTS Members;
-- OUTPUT : 22:07:15	DROP TABLE IF EXISTS Members	0 row(s) affected, 1 warning(s): 1051 Unknown table 'db_lab.members'	0.016 sec

DROP TABLE IF EXISTS Books;
-- OUTPUT : 22:07:15	DROP TABLE IF EXISTS Books	0 row(s) affected, 1 warning(s): 1051 Unknown table 'db_lab.books'	0.031 sec

-- ===============================================
-- Step 1: Create Books table (no CHECK constraint)
-- ===============================================
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50),
    published_year YEAR,
    available_copies INT,
    total_copies INT,
    genre VARCHAR(50),
    ISBN VARCHAR(20)
);
-- OUTPUT : 22:07:55	CREATE TABLE Books (     book_id INT PRIMARY KEY AUTO_INCREMENT,     title VARCHAR(100) NOT NULL,     author VARCHAR(50),     published_year YEAR,     available_copies INT,     total_copies INT,     genre VARCHAR(50),     ISBN VARCHAR(20) )	0 row(s) affected	0.359 sec

-- ===============================================
-- Step 2: Create Members table
-- ===============================================
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    membership_date DATE,
    membership_type VARCHAR(20),
    email VARCHAR(50),
    phone_number VARCHAR(15),
    address VARCHAR(100)
);
-- OUTPUT : 22:08:09	CREATE TABLE Members (     member_id INT PRIMARY KEY AUTO_INCREMENT,     first_name VARCHAR(50) NOT NULL,     last_name VARCHAR(50) NOT NULL,     membership_date DATE,     membership_type VARCHAR(20),     email VARCHAR(50),     phone_number VARCHAR(15),     address VARCHAR(100) )	0 row(s) affected	0.359 sec

-- ===============================================
-- Step 3 (Optional): Borrowing table with foreign keys
-- ===============================================
CREATE TABLE Borrowing (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
-- OUTPUT : 22:08:25	CREATE TABLE Borrowing (     borrow_id INT PRIMARY KEY AUTO_INCREMENT,     member_id INT,     book_id INT,     borrow_date DATE,     return_date DATE,     FOREIGN KEY (member_id) REFERENCES Members(member_id),     FOREIGN KEY (book_id) REFERENCES Books(book_id) )	0 row(s) affected	1.093 sec

-- ===============================================
-- Step 4: Create triggers to enforce available_copies <= total_copies
-- This version works in all MySQL versions
-- ===============================================
DELIMITER $$

-- BEFORE INSERT trigger
CREATE TRIGGER books_before_insert
BEFORE INSERT ON Books
FOR EACH ROW
BEGIN
    IF NEW.available_copies > NEW.total_copies THEN
        SET NEW.available_copies = NEW.total_copies;
    END IF;
END$$
-- OUTPUT : 22:08:52	-- BEFORE INSERT trigger CREATE TRIGGER books_before_insert BEFORE INSERT ON Books FOR EACH ROW BEGIN     IF NEW.available_copies > NEW.total_copies THEN         SET NEW.available_copies = NEW.total_copies;     END IF; END	0 row(s) affected	0.141 sec

-- BEFORE UPDATE trigger
CREATE TRIGGER books_before_update
BEFORE UPDATE ON Books
FOR EACH ROW
BEGIN
    IF NEW.available_copies > NEW.total_copies THEN
        SET NEW.available_copies = NEW.total_copies;
    END IF;
END$$

DELIMITER ;
-- OUTPUT : 22:08:52	CREATE TRIGGER books_before_update BEFORE UPDATE ON Books FOR EACH ROW BEGIN     IF NEW.available_copies > NEW.total_copies THEN         SET NEW.available_copies = NEW.total_copies;     END IF; END	0 row(s) affected	0.078 sec

-- ===============================================
-- Task 03: Insert a New Book
-- ===============================================
INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN)
VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Fiction', '978-0451524935');
-- OUTPUT : 22:09:41	INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN) VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Fiction', '978-0451524935')	1 row(s) affected	0.125 sec

-- ===============================================
-- Task 04: Add New Members
-- ===============================================
INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address)
VALUES 
('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '9876543210', '123 Maple St'),
('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '9876501234', '456 Oak Ave');
-- OUTPUT : 22:09:55	INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address) VALUES  ('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '9876543210', '123 Maple St'), ('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '9876501234', '456 Oak Ave')	2 row(s) affected Records: 2  Duplicates: 0  Warnings: 0	0.125 sec

-- ===============================================
-- Task 05: Update Book Details
-- Add 2 additional copies of "1984_The Black Swan"
-- ===============================================
UPDATE Books
SET available_copies = available_copies + 2,
    total_copies = total_copies + 2
WHERE title = '1984_The Black Swan';
-- OUTPUT : 22:10:12	UPDATE Books SET available_copies = available_copies + 2,     total_copies = total_copies + 2 WHERE title = '1984_The Black Swan'	1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0	0.062 sec

-- ===============================================
-- Task 06: Modify a Member's Information
-- Emma Wilson upgrades membership from Silver to Gold
-- ===============================================
UPDATE Members
SET membership_type = 'Gold'
WHERE first_name = 'Emma' AND last_name = 'Wilson';
-- OUTPUT : 22:10:26	UPDATE Members SET membership_type = 'Gold' WHERE first_name = 'Emma' AND last_name = 'Wilson'	1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0	0.063 sec

-- ===============================================
-- Task 07: Delete a Book Record
-- Remove "1984_The Black Swan"
-- ===============================================
DELETE FROM Books
WHERE title = '1984_The Black Swan';
-- OUTPUT : 22:10:44	DELETE FROM Books WHERE title = '1984_The Black Swan'	1 row(s) affected	0.094 sec

-- ===============================================
-- Task 08: Remove a Member
-- Remove David Lee
-- ===============================================
DELETE FROM Members
WHERE first_name = 'David' AND last_name = 'Lee';
-- OUTPUT : 22:10:59	DELETE FROM Members WHERE first_name = 'David' AND last_name = 'Lee'	1 row(s) affected	0.079 sec

-- END OF EXPERIMENT 