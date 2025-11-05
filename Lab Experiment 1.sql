-- LAB EXPERIMENT - 1

CREATE DATABASE UniversityDB;
-- OUTPUT : 12:26:01	CREATE DATABASE UniversityDB	1 row(s) affected	0.157 sec

USE UniversityDB;
-- OUTPUT: 12:26:05	USE UniversityDB	0 row(s) affected	0.000 sec

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DateOfBirth DATE
);
-- OUTPUT: 12:26:16	CREATE TABLE Students (     StudentID INT PRIMARY KEY,     FirstName VARCHAR(50),     LastName VARCHAR(50),     Email VARCHAR(100) UNIQUE,     DateOfBirth DATE )	0 row(s) affected	0.484 sec

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);
-- OUTPUT: 12:26:23	CREATE TABLE Courses (     CourseID INT PRIMARY KEY,     CourseName VARCHAR(100),     Credits INT )	0 row(s) affected	0.390 sec

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- OUTPUT : 12:26:35	CREATE TABLE Enrollments (     EnrollmentID INT PRIMARY KEY,     StudentID INT,     CourseID INT,     EnrollmentDate DATE,     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) )	0 row(s) affected	0.562 sec

-- Add new column to Students table
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);
-- OUTPUT : 12:26:53 ALTER TABLE Students ADD PhoneNumber VARCHAR(15)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	1.109 sec

-- Modify Credits column datatype
ALTER TABLE Courses
MODIFY Credits DECIMAL(4,2);
-- OUTPUT: 12:26:58	ALTER TABLE Courses MODIFY Credits DECIMAL(4,2)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.906 sec

-- Add unique constraint in Enrollments table
ALTER TABLE Enrollments
ADD CONSTRAINT unique_student_course UNIQUE (StudentID, CourseID);
-- OUTPUT : 12:27:06	ALTER TABLE Enrollments ADD CONSTRAINT unique_student_course UNIQUE (StudentID, CourseID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.297 sec

-- Drop Enrollments table first
DROP TABLE Enrollments;
-- OUTPUT : 12:27:12	DROP TABLE Enrollments	0 row(s) affected	0.218 sec

-- Drop Courses table
DROP TABLE Courses;
-- OUTPUT : 12:27:15	DROP TABLE Courses	0 row(s) affected	0.250 sec

-- END OF EXPERIMENT 
