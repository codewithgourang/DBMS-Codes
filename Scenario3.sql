-- =========================================
-- SCENARIO 3 : Bank Account Management System
-- =========================================


-- =========================================
-- 1. CREATE ACCOUNT TABLE
-- =========================================
CREATE TABLE Account (
    AccountID INT PRIMARY KEY,               -- Unique account number
    CustomerName VARCHAR(100) NOT NULL,     -- Customer name required
    Balance DECIMAL(10,2) NOT NULL,         -- Stores account balance
    AccountType VARCHAR(50) NOT NULL        -- Stores account type
);

-- Logic:
-- PRIMARY KEY uniquely identifies each account
-- NOT NULL ensures important fields are mandatory



-- =========================================
-- 2. INSERT AT LEAST 5 RECORDS
-- =========================================
INSERT INTO Account (AccountID, CustomerName, Balance, AccountType)
VALUES
(101, 'Amit', 20000, 'Savings'),
(102, 'Priya', 60000, 'Current'),
(103, 'Anjali', 15000, 'Savings'),
(104, 'Rahul', 800, 'Current'),
(105, 'Akash', 52000, 'Savings');

-- Logic:
-- Adds sample customer account records



-- =========================================
-- 3. INCREASE BALANCE BY 10% FOR SAVINGS ACCOUNT
-- =========================================
UPDATE Account
SET Balance = Balance + (Balance * 0.10)
WHERE AccountType = 'Savings';

-- Logic:
-- Balance * 0.10 calculates 10%
-- Updated only for Savings accounts



-- =========================================
-- 4. UPDATE ACCOUNTTYPE TO PREMIUM
-- =========================================
UPDATE Account
SET AccountType = 'Premium'
WHERE Balance > 50000;

-- Logic:
-- Customers having balance above 50000
-- are upgraded to Premium



-- =========================================
-- 5. DELETE ACCOUNTS WITH BALANCE LESS THAN 1000
-- =========================================
DELETE FROM Account
WHERE Balance < 1000;

-- Logic:
-- Removes low balance accounts



-- =========================================
-- 6. USE ARITHMETIC OPERATOR
-- =========================================
SELECT AccountID, CustomerName, Balance,
       Balance + 500 AS UpdatedBalance
FROM Account;

-- Logic:
-- Adds ₹500 to existing balance using + operator
-- AS gives alias name to new column



-- =========================================
-- 7. USE LOGICAL OPERATORS
-- =========================================
SELECT *
FROM Account
WHERE Balance BETWEEN 10000 AND 50000;

-- Logic:
-- BETWEEN checks range values
-- Displays customers with balance between 10k and 50k



-- =========================================
-- 8. PATTERN MATCHING
-- =========================================
SELECT *
FROM Account
WHERE CustomerName LIKE 'A%';

-- Logic:
-- LIKE performs pattern matching
-- A% means names starting with letter A



-- =========================================
-- 9. STRING FUNCTION
-- =========================================
SELECT UPPER(CustomerName) AS UpperCaseName
FROM Account;

-- Logic:
-- UPPER() converts names into uppercase



-- =========================================
-- 10. CREATE ROLE
-- =========================================
CREATE ROLE BankClerk;

-- Logic:
-- Creates a new database role/user group



-- =========================================
-- 11. GRANT PERMISSIONS
-- =========================================
GRANT SELECT, INSERT
ON Account
TO BankClerk;

-- Logic:
-- Allows BankClerk to view and insert records



-- =========================================
-- 12. REVOKE INSERT PERMISSION
-- =========================================
REVOKE INSERT
ON Account
FROM BankClerk;

-- Logic:
-- Removes INSERT permission from role



-- =========================================
-- 13. START TRANSACTION
-- =========================================
START TRANSACTION;

-- Logic:
-- Begins transaction block



-- =========================================
-- 14. TRANSFER ₹5000 BETWEEN ACCOUNTS
-- =========================================

-- Deduct ₹5000 from AccountID 101
UPDATE Account
SET Balance = Balance - 5000
WHERE AccountID = 101;

-- Add ₹5000 to AccountID 103
UPDATE Account
SET Balance = Balance + 5000
WHERE AccountID = 103;

-- Logic:
-- Simulates money transfer using UPDATE



-- =========================================
-- 15. CREATE SAVEPOINT
-- =========================================
SAVEPOINT TransferPoint;

-- Logic:
-- Creates checkpoint inside transaction



-- =========================================
-- 16. DEDUCT ₹200 AS CHARGES
-- =========================================
UPDATE Account
SET Balance = Balance - 200
WHERE AccountID = 103;

-- Logic:
-- Deducts service charge



-- =========================================
-- 17. ROLLBACK TO SAVEPOINT
-- =========================================
ROLLBACK TO TransferPoint;

-- Logic:
-- Cancels changes made after savepoint
-- ₹200 deduction gets reversed



-- =========================================
-- 18. COMMIT TRANSACTION
-- =========================================
COMMIT;

-- Logic:
-- Permanently saves transaction changes