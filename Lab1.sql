-- LAB EXPERIMENT 01

-- CREATE AND USE DATABASE
CREATE DATABASE UniversityDB1;
-- OUTPUT: 13:10:53	CREATE DATABASE UniversityDB1	1 row(s) affected	0.110 sec

USE UniversityDB1;
-- OUTPUT: 13:10:58	USE UniversityDB1	0 row(s) affected	0.000 sec

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DateOfBirth DATE
);
-- OUTPUT : 13:11:46	CREATE TABLE Students (     StudentID INT PRIMARY KEY,     FirstName VARCHAR(50),     LastName VARCHAR(50),     Email VARCHAR(100) UNIQUE,     DateOfBirth DATE )	0 row(s) affected	0.438 sec

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);
-- OUTPUT : 13:12:07	CREATE TABLE Courses (     CourseID INT PRIMARY KEY,     CourseName VARCHAR(100),     Credits INT )	0 row(s) affected	0.828 sec

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- OUTPUT : 13:12:22	CREATE TABLE Enrollments (     EnrollmentID INT PRIMARY KEY,     StudentID INT,     CourseID INT,     EnrollmentDate DATE,     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) )	0 row(s) affected	1.156 sec

-- Add a new column PhoneNumber to Students table
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);
-- OUTPUT : 13:12:43	ALTER TABLE Students ADD PhoneNumber VARCHAR(15)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.828 sec

-- Modify data type of Credits column to DECIMAL
ALTER TABLE Courses
MODIFY Credits DECIMAL(4,2);
-- OUTPUT : 13:13:08	ALTER TABLE Courses MODIFY Credits DECIMAL(4,2)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.953 sec

-- Add a unique constraint to Enrollments table (no duplicate enrollments)
ALTER TABLE Enrollments
ADD CONSTRAINT unique_student_course UNIQUE (StudentID, CourseID);
-- OUTPUT : 13:13:30	ALTER TABLE Enrollments ADD CONSTRAINT unique_student_course UNIQUE (StudentID, CourseID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.344 sec

-- Drop Enrollments table first
DROP TABLE Enrollments;
-- OUTPUT: 13:14:01	DROP TABLE Enrollments	0 row(s) affected	0.250 sec

-- Drop Courses table
DROP TABLE Courses;
-- OUTPUT: 13:14:27	DROP TABLE Courses	0 row(s) affected	0.203 sec

-- END OF EXPERIMENT 

