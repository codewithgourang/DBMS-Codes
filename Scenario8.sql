-- =========================================
-- SCENARIO 8 : Employee Salary Analysis System
-- =========================================


-- =========================================
-- 1. CREATE DEPARTMENTS TABLE
-- =========================================
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,               -- Unique department ID
    DeptName VARCHAR(100) NOT NULL,      -- Department name
    Location VARCHAR(100) NOT NULL       -- Department location
);

-- Logic:
-- PRIMARY KEY uniquely identifies department
-- NOT NULL ensures required fields



-- =========================================
-- 2. CREATE EMPLOYEES TABLE
-- =========================================
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,               -- Unique employee ID
    EmpName VARCHAR(100) NOT NULL,       -- Employee name
    Salary DECIMAL(10,2) NOT NULL,       -- Employee salary
    DeptID INT,                          -- References Departments table

    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Logic:
-- FOREIGN KEY connects employees with departments
-- Stores employee salary details



-- =========================================
-- 3. INSERT RECORDS INTO DEPARTMENTS
-- =========================================
INSERT INTO Departments (DeptID, DeptName, Location)
VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Pune'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Chennai'),
(5, 'Sales', 'Nagpur');

-- Logic:
-- Adds department records



-- =========================================
-- 4. INSERT RECORDS INTO EMPLOYEES
-- =========================================
INSERT INTO Employees (EmpID, EmpName, Salary, DeptID)
VALUES
(101, 'Amit', 45000, 1),
(102, 'Rahul', 55000, 2),
(103, 'Priya', 60000, 2),
(104, 'Anjali', 40000, 3),
(105, 'Akash', 75000, 4);

-- Logic:
-- Adds employee salary records



-- =========================================
-- 5. EMPLOYEES WITH SALARY GREATER THAN AVERAGE SALARY
-- =========================================
SELECT EmpName, Salary
FROM Employees
WHERE Salary >
      (SELECT AVG(Salary) FROM Employees);

-- Logic:
-- Subquery calculates average salary
-- Outer query displays employees earning above average



-- =========================================
-- 6. EMPLOYEES IN SAME DEPARTMENT AS RAHUL
-- =========================================
SELECT EmpName, DeptID
FROM Employees
WHERE DeptID =
      (SELECT DeptID
       FROM Employees
       WHERE EmpName = 'Rahul');

-- Logic:
-- Subquery finds Rahul's department
-- Outer query displays employees from same department



-- =========================================
-- 7. EMPLOYEES WITH SALARY GREATER THAN
--    AVERAGE SALARY OF THEIR DEPARTMENT
-- =========================================
SELECT EmpName, Salary, DeptID
FROM Employees E
WHERE Salary >
      (SELECT AVG(Salary)
       FROM Employees
       WHERE DeptID = E.DeptID);

-- Logic:
-- Correlated subquery compares salary
-- with average salary of same department



-- =========================================
-- 8. DEPARTMENT NAME OF EMPLOYEE
--    WITH HIGHEST SALARY
-- =========================================
SELECT DeptName
FROM Departments
WHERE DeptID =
      (SELECT DeptID
       FROM Employees
       WHERE Salary =
             (SELECT MAX(Salary)
              FROM Employees));

-- Logic:
-- Inner subquery finds highest salary
-- Second subquery finds department ID
-- Outer query displays department name