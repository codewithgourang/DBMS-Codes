-- =========================================
-- SCENARIO 12 : Bank Transaction System
-- =========================================


-- =========================================
-- 1. CREATE ACCOUNTS TABLE
-- =========================================
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,              -- Unique account ID
    CustomerName VARCHAR(100) NOT NULL,    -- Customer name
    Balance DECIMAL(10,2) NOT NULL         -- Current balance
);

-- Logic:
-- PRIMARY KEY uniquely identifies each account
-- NOT NULL ensures important fields are compulsory



-- =========================================
-- 2. CREATE TRANSACTIONS TABLE
-- =========================================
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,          -- Unique transaction ID
    TransactionType VARCHAR(20) NOT NULL,  -- Deposit or Withdrawal
    Amount DECIMAL(10,2) NOT NULL,         -- Transaction amount
    AccountID INT,                         -- References Accounts table

    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Logic:
-- FOREIGN KEY connects transactions with accounts
-- Stores deposit and withdrawal details



-- =========================================
-- 3. INSERT RECORDS INTO ACCOUNTS
-- =========================================
INSERT INTO Accounts (AccountID, CustomerName, Balance)
VALUES
(101, 'Amit', 10000),
(102, 'Priya', 15000),
(103, 'Rahul', 8000),
(104, 'Anjali', 12000),
(105, 'Akash', 5000);

-- Logic:
-- Adds account records with balances



-- =========================================
-- 4. INSERT RECORDS INTO TRANSACTIONS
-- =========================================
INSERT INTO Transactions (TransactionID, TransactionType, Amount, AccountID)
VALUES
(1, 'Deposit', 2000, 101),
(2, 'Withdrawal', 3000, 102),
(3, 'Deposit', 1500, 103),
(4, 'Withdrawal', 1000, 104),
(5, 'Deposit', 2500, 105);

-- Logic:
-- Adds transaction records



-- =========================================
-- 5. CREATE TRIGGER
-- =========================================
DELIMITER //

CREATE TRIGGER CheckBalanceBeforeWithdrawal
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN

    DECLARE CurrentBalance DECIMAL(10,2);

    -- Check only for withdrawal
    IF NEW.TransactionType = 'Withdrawal' THEN

        -- Get current balance
        SELECT Balance
        INTO CurrentBalance
        FROM Accounts
        WHERE AccountID = NEW.AccountID;

        -- Prevent withdrawal if amount exceeds balance
        IF NEW.Amount > CurrentBalance THEN

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'Insufficient Balance. Withdrawal Denied';

        ELSE

            -- Deduct amount from account
            UPDATE Accounts
            SET Balance = Balance - NEW.Amount
            WHERE AccountID = NEW.AccountID;

        END IF;

    ELSEIF NEW.TransactionType = 'Deposit' THEN

        -- Add deposit amount
        UPDATE Accounts
        SET Balance = Balance + NEW.Amount
        WHERE AccountID = NEW.AccountID;

    END IF;

END //

DELIMITER ;

-- Logic:
-- Trigger runs automatically before insert
-- Checks balance before withdrawal
-- Prevents balance from going below zero
-- Updates balance automatically



-- =========================================
-- 6. TEST TRIGGER WITH TRANSACTIONS
-- =========================================

-- Valid Withdrawal
INSERT INTO Transactions
VALUES (6, 'Withdrawal', 2000, 101);

-- Invalid Withdrawal (More than balance)
INSERT INTO Transactions
VALUES (7, 'Withdrawal', 50000, 105);

-- Deposit Transaction
INSERT INTO Transactions
VALUES (8, 'Deposit', 3000, 103);

-- Logic:
-- First transaction succeeds
-- Second transaction fails due to insufficient balance
-- Third transaction increases balance



-- =========================================
-- 7. DISPLAY UPDATED ACCOUNT BALANCES
-- =========================================
SELECT * FROM Accounts;

-- Logic:
-- Displays latest account balances
-- after all successful transactions