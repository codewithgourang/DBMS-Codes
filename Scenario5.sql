-- =========================================
-- SCENARIO 5 : Hospital Patient Billing System
-- =========================================


-- =========================================
-- 1. CREATE BILLING TABLE
-- =========================================
CREATE TABLE Billing (
    BillID INT PRIMARY KEY,                 -- Unique bill ID
    PatientName VARCHAR(100) NOT NULL,     -- Patient name
    Department VARCHAR(50) NOT NULL,       -- Hospital department
    Amount DECIMAL(10,2) NOT NULL,         -- Billing amount
    DaysAdmitted INT NOT NULL              -- Number of days admitted
);

-- Logic:
-- PRIMARY KEY uniquely identifies each bill
-- NOT NULL ensures important fields are compulsory



-- =========================================
-- 2. INSERT SAMPLE RECORDS
-- =========================================
INSERT INTO Billing (BillID, PatientName, Department, Amount, DaysAdmitted)
VALUES
(1, 'Amit', 'Cardiology', 25000, 5),
(2, 'Priya', 'Orthopedics', 18000, 4),
(3, 'Rahul', 'Neurology', 30000, 6),
(4, 'Anjali', 'General', 12000, 2),
(5, 'Akash', 'Cardiology', 22000, 3),
(6, 'Neha', 'Orthopedics', 15000, 2),
(7, 'Rohan', 'Neurology', 35000, 7),
(8, 'Pooja', 'General', 10000, 1);

-- Logic:
-- Adds billing records from different departments



-- =========================================
-- 3. TOTAL BILLING AMOUNT FOR EACH DEPARTMENT
-- =========================================
SELECT Department,
       SUM(Amount) AS TotalBillingAmount
FROM Billing
GROUP BY Department;

-- Logic:
-- SUM() calculates total revenue department-wise



-- =========================================
-- 4. AVERAGE BILLING AMOUNT PER DEPARTMENT
-- =========================================
SELECT Department,
       AVG(Amount) AS AverageBillingAmount
FROM Billing
GROUP BY Department;

-- Logic:
-- AVG() calculates average billing amount



-- =========================================
-- 5. MAXIMUM AND MINIMUM BILL AMOUNT
-- =========================================
SELECT Department,
       MAX(Amount) AS MaximumBill,
       MIN(Amount) AS MinimumBill
FROM Billing
GROUP BY Department;

-- Logic:
-- MAX() finds highest bill
-- MIN() finds lowest bill



-- =========================================
-- 6. TOTAL NUMBER OF PATIENTS IN EACH DEPARTMENT
-- =========================================
SELECT Department,
       COUNT(PatientName) AS TotalPatients
FROM Billing
GROUP BY Department;

-- Logic:
-- COUNT() counts patients department-wise



-- =========================================
-- 7. TOTAL NUMBER OF DAYS ADMITTED
-- =========================================
SELECT Department,
       SUM(DaysAdmitted) AS TotalDays
FROM Billing
GROUP BY Department;

-- Logic:
-- SUM() adds total admitted days



-- =========================================
-- 8. DEPARTMENTS WITH TOTAL BILLING > 20000
-- =========================================
SELECT Department,
       SUM(Amount) AS TotalBilling
FROM Billing
GROUP BY Department
HAVING SUM(Amount) > 20000;

-- Logic:
-- HAVING filters grouped results
-- Displays departments earning above 20000



-- =========================================
-- 9. DEPARTMENTS HAVING AVERAGE STAY > 3 DAYS
-- =========================================
SELECT Department,
       AVG(DaysAdmitted) AS AverageStay
FROM Billing
GROUP BY Department
HAVING AVG(DaysAdmitted) > 3;

-- Logic:
-- Finds departments with average stay more than 3 days



-- =========================================
-- 10. DEPARTMENT WITH HIGHEST TOTAL BILLING
-- =========================================
SELECT Department,
       SUM(Amount) AS HighestBilling
FROM Billing
GROUP BY Department
ORDER BY HighestBilling DESC
LIMIT 1;

-- Logic:
-- ORDER BY DESC sorts highest billing first
-- LIMIT 1 displays top department only