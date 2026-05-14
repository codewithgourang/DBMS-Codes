-- =========================================
-- SCENARIO 9 : Student Scholarship Management System
-- =========================================


-- =========================================
-- 1. CREATE DEPARTMENTS TABLE
-- =========================================
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,              -- Unique department ID
    DeptName VARCHAR(100) NOT NULL      -- Department name
);

-- Logic:
-- PRIMARY KEY uniquely identifies department
-- NOT NULL ensures required field



-- =========================================
-- 2. CREATE STUDENTS TABLE
-- =========================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,            -- Unique student ID
    StudentName VARCHAR(100) NOT NULL,   -- Student name
    Marks INT NOT NULL,                  -- Student marks
    DeptID INT,                          -- References Departments table

    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Logic:
-- FOREIGN KEY connects students with departments
-- Stores marks of students



-- =========================================
-- 3. INSERT RECORDS INTO DEPARTMENTS
-- =========================================
INSERT INTO Departments (DeptID, DeptName)
VALUES
(1, 'Computer'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Civil'),
(5, 'Electronics');

-- Logic:
-- Adds department records



-- =========================================
-- 4. INSERT RECORDS INTO STUDENTS
-- =========================================
INSERT INTO Students (StudentID, StudentName, Marks, DeptID)
VALUES
(101, 'Anita', 85, 1),
(102, 'Rahul', 72, 2),
(103, 'Priya', 91, 1),
(104, 'Amit', 67, 3),
(105, 'Neha', 88, 2);

-- Logic:
-- Adds student academic records



-- =========================================
-- 5. STUDENTS WITH MARKS GREATER
--    THAN AVERAGE MARKS
-- =========================================
SELECT StudentName, Marks
FROM Students
WHERE Marks >
      (SELECT AVG(Marks)
       FROM Students);

-- Logic:
-- Subquery calculates average marks
-- Outer query displays students above average



-- =========================================
-- 6. STUDENTS IN SAME DEPARTMENT AS ANITA
-- =========================================
SELECT StudentName, DeptID
FROM Students
WHERE DeptID =
      (SELECT DeptID
       FROM Students
       WHERE StudentName = 'Anita');

-- Logic:
-- Finds Anita's department
-- Displays students from same department



-- =========================================
-- 7. STUDENTS WITH MARKS HIGHER
--    THAN DEPARTMENT AVERAGE
-- =========================================
SELECT StudentName, Marks, DeptID
FROM Students S
WHERE Marks >
      (SELECT AVG(Marks)
       FROM Students
       WHERE DeptID = S.DeptID);

-- Logic:
-- Correlated subquery compares marks
-- with department average marks



-- =========================================
-- 8. STUDENT WITH HIGHEST MARKS
-- =========================================
SELECT StudentName, Marks
FROM Students
WHERE Marks =
      (SELECT MAX(Marks)
       FROM Students);

-- Logic:
-- MAX() finds highest marks
-- Displays top scoring student