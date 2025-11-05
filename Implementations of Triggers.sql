-- ======================================================================
-- Lab Experiment – Implementation of Triggers in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create triggers in MySQL.
-- 2. To implement BEFORE and AFTER triggers for INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS SchoolDB;
-- OUTPUT : 14:13:26	DROP DATABASE IF EXISTS SchoolDB	2 row(s) affected	0.844 sec

CREATE DATABASE SchoolDB;
-- OUTPUT : 14:13:36	CREATE DATABASE SchoolDB	1 row(s) affected	0.109 sec

USE SchoolDB;
-- OUTPUT : 14:13:44	USE SchoolDB	0 row(s) affected	0.000 sec

-- ======================================================================
-- Step 2: Create Tables
-- Create a Students table and a Logs table to record trigger actions.

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50),
    Age INT,
    Marks DECIMAL(5,2)
);
-- OUTPUT : 14:13:53	CREATE TABLE Students (     StudentID INT PRIMARY KEY AUTO_INCREMENT,     StudentName VARCHAR(50),     Age INT,     Marks DECIMAL(5,2) )	0 row(s) affected	0.297 sec

CREATE TABLE StudentLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    ActionType VARCHAR(50),
    ActionDate DATETIME,
    Description VARCHAR(200)
);
-- OUTPUT : 14:14:02	CREATE TABLE StudentLogs (     LogID INT PRIMARY KEY AUTO_INCREMENT,     ActionType VARCHAR(50),     ActionDate DATETIME,     Description VARCHAR(200) )	0 row(s) affected	0.344 sec

-- ======================================================================
-- Task 1: BEFORE INSERT Trigger
-- Create a trigger to ensure that no student can be inserted with Marks greater than 100.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW

DELIMITER $$
CREATE TRIGGER before_student_insert
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.Marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot be greater than 100!';
    END IF;
END$$
DELIMITER ;

-- OUTPUT: 14:14:27	CREATE TRIGGER before_student_insert BEFORE INSERT ON Students FOR EACH ROW BEGIN     IF NEW.Marks > 100 THEN         SIGNAL SQLSTATE '45000'         SET MESSAGE_TEXT = 'Marks cannot be greater than 100!';     END IF; END	0 row(s) affected	0.125 sec

-- ======================================================================
-- Task 2: AFTER INSERT Trigger
-- Create a trigger that inserts a log entry into StudentLogs whenever a new student is added.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW

DELIMITER $$
CREATE TRIGGER after_student_insert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLogs (ActionType, ActionDate, Description)
    VALUES ('INSERT', NOW(), CONCAT('New student added: ', NEW.StudentName, ' with Marks ', NEW.Marks));
END$$
DELIMITER ;
-- OUTPUT : 14:15:04	CREATE TRIGGER after_student_insert AFTER INSERT ON Students FOR EACH ROW BEGIN     INSERT INTO StudentLogs (ActionType, ActionDate, Description)     VALUES ('INSERT', NOW(), CONCAT('New student added: ', NEW.StudentName, ' with Marks ', NEW.Marks)); END	0 row(s) affected	0.094 sec

-- ======================================================================
-- Task 3: AFTER UPDATE Trigger
-- Create a trigger that logs any update made to a student’s marks.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW

DELIMITER $$
CREATE TRIGGER after_student_update
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    IF OLD.Marks <> NEW.Marks THEN
        INSERT INTO StudentLogs (ActionType, ActionDate, Description)
        VALUES ('UPDATE', NOW(), CONCAT('Marks updated for ', NEW.StudentName, ' from ', OLD.Marks, ' to ', NEW.Marks));
    END IF;
END$$
DELIMITER ;

-- OUTPUT: 14:15:32	CREATE TRIGGER after_student_update AFTER UPDATE ON Students FOR EACH ROW BEGIN     IF OLD.Marks <> NEW.Marks THEN         INSERT INTO StudentLogs (ActionType, ActionDate, Description)         VALUES ('UPDATE', NOW(), CONCAT('Marks updated for ', NEW.StudentName, ' from ', OLD.Marks, ' to ', NEW.Marks));     END IF; END	0 row(s) affected	0.094 sec

-- ======================================================================
-- Task 4: AFTER DELETE Trigger
-- Create a trigger that logs when a student record is deleted.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW

DELIMITER $$
CREATE TRIGGER after_student_delete
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLogs (ActionType, ActionDate, Description)
    VALUES ('DELETE', NOW(), CONCAT('Student deleted: ', OLD.StudentName, ' (Marks: ', OLD.Marks, ')'));
END$$
DELIMITER ;

-- OUTPUT: 14:15:53	CREATE TRIGGER after_student_delete AFTER DELETE ON Students FOR EACH ROW BEGIN     INSERT INTO StudentLogs (ActionType, ActionDate, Description)     VALUES ('DELETE', NOW(), CONCAT('Student deleted: ', OLD.StudentName, ' (Marks: ', OLD.Marks, ')')); END	0 row(s) affected	0.078 sec

-- ======================================================================
-- END OF EXPERIMENT – Implementation of Triggers
-- ======================================================================
