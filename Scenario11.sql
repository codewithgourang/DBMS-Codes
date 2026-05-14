-- =========================================
-- SCENARIO 11 : Online Order Processing System
-- =========================================


-- =========================================
-- 1. CREATE PRODUCTS TABLE
-- =========================================
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,              -- Unique product ID
    ProductName VARCHAR(100) NOT NULL,     -- Product name
    Price DECIMAL(10,2) NOT NULL           -- Product price
);

-- Logic:
-- PRIMARY KEY uniquely identifies each product
-- NOT NULL ensures important fields are compulsory



-- =========================================
-- 2. CREATE ORDERS TABLE
-- =========================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,               -- Unique order ID
    Quantity INT NOT NULL,                -- Quantity ordered
    OrderDate DATE NOT NULL,              -- Order date
    ProductID INT,                        -- References Products table

    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Logic:
-- FOREIGN KEY connects Orders with Products
-- Stores order details



-- =========================================
-- 3. INSERT RECORDS INTO PRODUCTS
-- =========================================
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(101, 'Laptop', 50000),
(102, 'Mobile', 20000),
(103, 'Headphones', 3000),
(104, 'Keyboard', 1500),
(105, 'Mouse', 800);

-- Logic:
-- Adds product records



-- =========================================
-- 4. INSERT RECORDS INTO ORDERS
-- =========================================
INSERT INTO Orders (OrderID, Quantity, OrderDate, ProductID)
VALUES
(1, 2, '2025-01-10', 101),
(2, 3, '2025-01-11', 102),
(3, 5, '2025-01-12', 103),
(4, 4, '2025-01-13', 104),
(5, 6, '2025-01-14', 105);

-- Logic:
-- Adds customer order records



-- =========================================
-- 5. CREATE FUNCTION TO CALCULATE
--    TOTAL REVENUE
-- =========================================
DELIMITER //

CREATE FUNCTION TotalRevenue()
RETURNS DECIMAL(10,2)

DETERMINISTIC
BEGIN

    DECLARE Total DECIMAL(10,2);

    -- Calculate total revenue
    SELECT SUM(Orders.Quantity * Products.Price)
    INTO Total
    FROM Orders
    INNER JOIN Products
    ON Orders.ProductID = Products.ProductID;

    RETURN Total;

END //

DELIMITER ;

-- Logic:
-- Function calculates total revenue
-- Quantity * Price gives order amount
-- SUM() adds revenue from all orders
-- RETURN sends final revenue value



-- =========================================
-- 6. EXECUTE FUNCTION
-- =========================================
SELECT TotalRevenue() AS TotalRevenueGenerated;

-- Logic:
-- Executes function and displays total revenue