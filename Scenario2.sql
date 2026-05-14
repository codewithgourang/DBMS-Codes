-- =========================================
-- SCENARIO 2 : Online Food Delivery System
-- =========================================


-- =========================================
-- 1. CREATE RESTAURANT TABLE
-- =========================================
CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,             -- Unique ID for each restaurant
    RestaurantName VARCHAR(100) NOT NULL,    -- Restaurant name is required
    Location VARCHAR(100) NOT NULL           -- Restaurant location required
);

-- Logic:
-- PRIMARY KEY uniquely identifies restaurant
-- NOT NULL ensures important fields are mandatory



-- =========================================
-- 2. CREATE CUSTOMER TABLE
-- =========================================
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,              -- Unique customer ID
    CustomerName VARCHAR(100) NOT NULL,     -- Customer name required
    Phone VARCHAR(15) UNIQUE NOT NULL       -- Phone must be unique
);

-- Logic:
-- UNIQUE prevents duplicate phone numbers
-- NOT NULL ensures phone number is compulsory



-- =========================================
-- 3. CREATE ORDERS TABLE
-- =========================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,           -- Unique order ID
    CustomerID INT,                    -- References Customer table
    RestaurantID INT,                  -- References Restaurant table
    Amount DECIMAL(10,2) CHECK (Amount > 0),  -- Amount must be greater than 0

    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

-- Logic:
-- FOREIGN KEY connects related tables
-- CHECK ensures order amount is positive



-- =========================================
-- 4. INSERT RECORDS INTO RESTAURANT
-- =========================================
INSERT INTO Restaurant (RestaurantID, RestaurantName, Location)
VALUES
(1, 'Food Palace', 'Mumbai'),
(2, 'Spicy Hub', 'Pune'),
(3, 'Taste Corner', 'Delhi');

-- Logic:
-- Adds 3 restaurant records



-- =========================================
-- 5. INSERT RECORDS INTO CUSTOMER
-- =========================================
INSERT INTO Customer (CustomerID, CustomerName, Phone)
VALUES
(101, 'Amit', '9876543210'),
(102, 'Priya', '9876543211'),
(103, 'Rahul', '9876543212');

-- Logic:
-- Adds 3 customer records



-- =========================================
-- 6. INSERT RECORDS INTO ORDERS
-- =========================================
INSERT INTO Orders (OrderID, CustomerID, RestaurantID, Amount)
VALUES
(1, 101, 1, 450),
(2, 102, 2, 800),
(3, 103, 3, 1200);

-- Logic:
-- Creates customer order entries
-- CustomerID and RestaurantID must exist



-- =========================================
-- 7. ADD EMAIL COLUMN IN CUSTOMER TABLE
-- =========================================
ALTER TABLE Customer
ADD Email VARCHAR(100);

-- Logic:
-- ALTER TABLE changes table structure
-- Adds new Email column



-- =========================================
-- 8. MODIFY AMOUNT CONSTRAINT
-- =========================================
ALTER TABLE Orders
ADD CONSTRAINT chk_amount
CHECK (Amount BETWEEN 100 AND 5000);

-- Logic:
-- Restricts order amount between 100 and 5000



-- =========================================
-- 9. RENAME ORDERS TABLE
-- =========================================
ALTER TABLE Orders
RENAME TO CustomerOrders;

-- Logic:
-- Changes table name Orders → CustomerOrders



-- =========================================
-- 10. REMOVE ALL RECORDS FROM CUSTOMERORDERS
-- =========================================
TRUNCATE TABLE CustomerOrders;

-- Logic:
-- Deletes all rows quickly
-- Table structure remains safe



-- =========================================
-- 11. DROP RESTAURANT TABLE
-- =========================================
DROP TABLE Restaurant;

-- Logic:
-- Permanently deletes Restaurant table and all its data