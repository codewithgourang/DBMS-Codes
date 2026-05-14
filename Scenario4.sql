-- =========================================
-- SCENARIO 4 : Retail Store Sales Analysis
-- =========================================


-- =========================================
-- 1. CREATE SALES TABLE
-- =========================================
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,                -- Unique sale ID
    ProductName VARCHAR(100) NOT NULL,    -- Product name
    Category VARCHAR(50) NOT NULL,        -- Product category
    Quantity INT NOT NULL,                -- Quantity sold
    Price DECIMAL(10,2) NOT NULL          -- Product price
);

-- Logic:
-- PRIMARY KEY uniquely identifies each sale
-- NOT NULL ensures important fields are compulsory



-- =========================================
-- 2. INSERT SAMPLE RECORDS
-- =========================================
INSERT INTO Sales (SaleID, ProductName, Category, Quantity, Price)
VALUES
(1, 'Laptop', 'Electronics', 2, 50000),
(2, 'Mobile', 'Electronics', 5, 20000),
(3, 'Shirt', 'Clothing', 10, 1500),
(4, 'Jeans', 'Clothing', 6, 2500),
(5, 'Chair', 'Furniture', 4, 3000),
(6, 'Table', 'Furniture', 2, 7000);

-- Logic:
-- Adds sample sales records for analysis



-- =========================================
-- 3. TOTAL QUANTITY SOLD FOR EACH CATEGORY
-- =========================================
SELECT Category,
       SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY Category;

-- Logic:
-- SUM() adds total quantity
-- GROUP BY groups records category-wise



-- =========================================
-- 4. AVERAGE PRICE OF PRODUCTS IN EACH CATEGORY
-- =========================================
SELECT Category,
       AVG(Price) AS AveragePrice
FROM Sales
GROUP BY Category;

-- Logic:
-- AVG() calculates average product price



-- =========================================
-- 5. MAXIMUM AND MINIMUM PRICE IN EACH CATEGORY
-- =========================================
SELECT Category,
       MAX(Price) AS MaximumPrice,
       MIN(Price) AS MinimumPrice
FROM Sales
GROUP BY Category;

-- Logic:
-- MAX() finds highest price
-- MIN() finds lowest price



-- =========================================
-- 6. TOTAL SALES AMOUNT FOR EACH CATEGORY
-- =========================================
SELECT Category,
       SUM(Quantity * Price) AS TotalSalesAmount
FROM Sales
GROUP BY Category;

-- Logic:
-- Quantity * Price calculates sales amount
-- SUM() adds total sales for category



-- =========================================
-- 7. COUNT NUMBER OF PRODUCTS IN EACH CATEGORY
-- =========================================
SELECT Category,
       COUNT(ProductName) AS NumberOfProducts
FROM Sales
GROUP BY Category;

-- Logic:
-- COUNT() counts products category-wise



-- =========================================
-- 8. CATEGORIES WITH TOTAL SALES GREATER THAN 5000
-- =========================================
SELECT Category,
       SUM(Quantity * Price) AS TotalSales
FROM Sales
GROUP BY Category
HAVING SUM(Quantity * Price) > 5000;

-- Logic:
-- HAVING filters grouped data
-- Shows categories with sales above 5000



-- =========================================
-- 9. CATEGORIES HAVING AVERAGE PRICE GREATER THAN 1000
-- =========================================
SELECT Category,
       AVG(Price) AS AveragePrice
FROM Sales
GROUP BY Category
HAVING AVG(Price) > 1000;

-- Logic:
-- Displays categories whose average price exceeds 1000



-- =========================================
-- 10. CATEGORY WITH HIGHEST TOTAL SALES
-- =========================================
SELECT Category,
       SUM(Quantity * Price) AS HighestSales
FROM Sales
GROUP BY Category
ORDER BY HighestSales DESC
LIMIT 1;

-- Logic:
-- ORDER BY DESC sorts highest to lowest
-- LIMIT 1 displays top category only