-- =========================================
-- SCENARIO 1 : College Course Registration System
-- =========================================


-- =========================================
-- 1. CREATE STUDENT TABLE
-- =========================================
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,          -- Unique ID for each student
    Name VARCHAR(50) NOT NULL,          -- Student name cannot be empty
    Age INT CHECK (Age >= 18),          -- Age must be 18 or above
    Email VARCHAR(100) UNIQUE NOT NULL  -- Email must be unique
);

-- Logic:
-- PRIMARY KEY → uniquely identifies each student
-- NOT NULL → mandatory field
-- CHECK → validates age
-- UNIQUE → prevents duplicate emails



-- =========================================
-- 2. CREATE COURSE TABLE
-- =========================================
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,          -- Unique ID for each course
    CourseName VARCHAR(50) NOT NULL,  -- Course name required
    Credits INT NOT NULL              -- Credit value required
);

-- Logic:
-- Each course has unique CourseID
-- CourseName and Credits are compulsory



-- =========================================
-- 3. CREATE ENROLLMENT TABLE
-- =========================================
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,   -- Unique enrollment record
    StudentID INT,                  -- References Student table
    CourseID INT,                   -- References Course table

    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Logic:
-- FOREIGN KEY creates relationship between tables
-- A student can enroll only in existing courses



-- =========================================
-- 4. INSERT RECORDS INTO STUDENT
-- =========================================
INSERT INTO Student (StudentID, Name, Age, Email)
VALUES
(1, 'Amit', 20, 'amit@gmail.com'),
(2, 'Priya', 22, 'priya@gmail.com'),
(3, 'Rahul', 19, 'rahul@gmail.com');

-- Logic:
-- Adds 3 student records



-- =========================================
-- 5. INSERT RECORDS INTO COURSE
-- =========================================
INSERT INTO Course (CourseID, CourseName, Credits)
VALUES
(101, 'Database Management', 4),
(102, 'Operating System', 3),
(103, 'Computer Network', 5);

-- Logic:
-- Adds 3 course records



-- =========================================
-- 6. INSERT RECORDS INTO ENROLLMENT
-- =========================================
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103);

-- Logic:
-- Connects students with courses
-- StudentID and CourseID must already exist



-- =========================================
-- 7. ADD NEW COLUMN PhoneNumber
-- =========================================
ALTER TABLE Student
ADD PhoneNumber VARCHAR(15);

-- Logic:
-- ALTER TABLE modifies existing table structure
-- Adds a new column without deleting data



-- =========================================
-- 8. MODIFY CREDITS COLUMN
-- =========================================
ALTER TABLE Course
ADD CONSTRAINT chk_credits
CHECK (Credits BETWEEN 1 AND 5);

-- Logic:
-- Ensures credits are only between 1 and 5



-- =========================================
-- 9. RENAME TABLE COURSE TO SUBJECT
-- =========================================
ALTER TABLE Course
RENAME TO Subject;

-- Logic:
-- Changes table name from Course → Subject



-- =========================================
-- 10. REMOVE ALL RECORDS FROM ENROLLMENT
-- =========================================
TRUNCATE TABLE Enrollment;

-- Logic:
-- Deletes all rows quickly
-- Table structure remains



-- =========================================
-- 11. DROP SUBJECT TABLE
-- =========================================
DROP TABLE Subject;

-- Logic:
-- Permanently deletes the Subject table structure and data