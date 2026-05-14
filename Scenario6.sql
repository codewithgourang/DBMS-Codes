-- =========================================
-- SCENARIO 6 : University Examination System
-- =========================================


-- =========================================
-- 1. CREATE STUDENT TABLE
-- =========================================
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,               -- Unique student ID
    StudentName VARCHAR(100) NOT NULL,      -- Student name
    Department VARCHAR(50) NOT NULL         -- Department name
);

-- Logic:
-- PRIMARY KEY uniquely identifies each student
-- NOT NULL ensures required fields



-- =========================================
-- 2. CREATE SUBJECT TABLE
-- =========================================
CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,              -- Unique subject ID
    SubjectName VARCHAR(100) NOT NULL      -- Subject name
);

-- Logic:
-- Stores subject details



-- =========================================
-- 3. CREATE MARKS TABLE
-- =========================================
CREATE TABLE Marks (
    StudentID INT,                         -- References Student table
    SubjectID INT,                         -- References Subject table
    MarksObtained INT,                     -- Student marks

    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

-- Logic:
-- FOREIGN KEY connects students and subjects
-- Stores marks obtained by students



-- =========================================
-- 4. INSERT RECORDS INTO STUDENT
-- =========================================
INSERT INTO Student (StudentID, StudentName, Department)
VALUES
(1, 'Amit', 'Computer'),
(2, 'Priya', 'Mechanical'),
(3, 'Rahul', 'Electrical'),
(4, 'Anjali', 'Computer'),
(5, 'Akash', 'Civil'),
(6, 'Neha', 'Mechanical');

-- Logic:
-- Adds student records



-- =========================================
-- 5. INSERT RECORDS INTO SUBJECT
-- =========================================
INSERT INTO Subject (SubjectID, SubjectName)
VALUES
(101, 'Database'),
(102, 'Mathematics'),
(103, 'Physics'),
(104, 'Programming'),
(105, 'Electronics'),
(106, 'Mechanics');

-- Logic:
-- Adds subject records



-- =========================================
-- 6. INSERT RECORDS INTO MARKS
-- =========================================
INSERT INTO Marks (StudentID, SubjectID, MarksObtained)
VALUES
(1, 101, 85),
(2, 106, 78),
(3, 105, 82),
(4, 104, 91),
(5, 102, 74),
(6, 106, 88);

-- Logic:
-- Stores marks obtained by students



-- =========================================
-- 7. INNER JOIN
-- =========================================
SELECT Student.StudentName,
       Subject.SubjectName,
       Marks.MarksObtained
FROM Marks
INNER JOIN Student
ON Marks.StudentID = Student.StudentID
INNER JOIN Subject
ON Marks.SubjectID = Subject.SubjectID;

-- Logic:
-- INNER JOIN displays matching records from all tables
-- Shows student name, subject name and marks



-- =========================================
-- 8. LEFT JOIN
-- =========================================
SELECT Student.StudentName,
       Marks.MarksObtained
FROM Student
LEFT JOIN Marks
ON Student.StudentID = Marks.StudentID;

-- Logic:
-- LEFT JOIN displays all students
-- Even students without marks are shown



-- =========================================
-- 9. RIGHT JOIN
-- =========================================
SELECT Subject.SubjectName,
       Student.StudentName
FROM Marks
RIGHT JOIN Subject
ON Marks.SubjectID = Subject.SubjectID
LEFT JOIN Student
ON Marks.StudentID = Student.StudentID;

-- Logic:
-- RIGHT JOIN displays all subjects
-- Even subjects without students are shown



-- =========================================
-- 10. CROSS JOIN
-- =========================================
SELECT Student.StudentName,
       Subject.SubjectName
FROM Student
CROSS JOIN Subject;

-- Logic:
-- CROSS JOIN creates all possible combinations
-- Every student paired with every subject



-- =========================================
-- 11. DISPLAY DEPARTMENT WITH HIGHEST TOTAL MARKS
-- =========================================
SELECT Student.Department,
       SUM(Marks.MarksObtained) AS TotalMarks
FROM Marks
INNER JOIN Student
ON Marks.StudentID = Student.StudentID
GROUP BY Student.Department
ORDER BY TotalMarks DESC
LIMIT 1;

-- Logic:
-- SUM() calculates total marks department-wise
-- ORDER BY DESC sorts highest total first
-- LIMIT 1 shows top department only