-- =========================================
-- SCENARIO 7 : Online Bookstore Management System
-- =========================================


-- =========================================
-- 1. CREATE AUTHORS TABLE
-- =========================================
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,              -- Unique author ID
    AuthorName VARCHAR(100) NOT NULL,     -- Author name
    Country VARCHAR(50) NOT NULL          -- Author country
);

-- Logic:
-- PRIMARY KEY uniquely identifies each author
-- NOT NULL ensures required fields



-- =========================================
-- 2. CREATE BOOKS TABLE
-- =========================================
CREATE TABLE Books (
    BookID INT PRIMARY KEY,               -- Unique book ID
    Title VARCHAR(100) NOT NULL,          -- Book title
    Price DECIMAL(10,2) NOT NULL,         -- Book price
    AuthorID INT,                         -- References Authors table

    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Logic:
-- FOREIGN KEY connects books with authors
-- Each book belongs to an author



-- =========================================
-- 3. CREATE CUSTOMERS TABLE
-- =========================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,            -- Unique customer ID
    CustomerName VARCHAR(100) NOT NULL,   -- Customer name
    City VARCHAR(50) NOT NULL             -- Customer city
);

-- Logic:
-- Stores customer details



-- =========================================
-- 4. CREATE ORDERS TABLE
-- =========================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,              -- Unique order ID
    CustomerID INT,                       -- References Customers table
    BookID INT,                           -- References Books table
    OrderDate DATE,                       -- Date of order

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Logic:
-- Stores customer purchase details
-- FOREIGN KEY creates relationships



-- =========================================
-- 5. INSERT RECORDS INTO AUTHORS
-- =========================================
INSERT INTO Authors (AuthorID, AuthorName, Country)
VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'J.K. Rowling', 'UK'),
(3, 'Paulo Coelho', 'Brazil'),
(4, 'Dan Brown', 'USA'),
(5, 'Ruskin Bond', 'India');

-- Logic:
-- Adds author records



-- =========================================
-- 6. INSERT RECORDS INTO BOOKS
-- =========================================
INSERT INTO Books (BookID, Title, Price, AuthorID)
VALUES
(101, 'Half Girlfriend', 450, 1),
(102, 'Harry Potter', 800, 2),
(103, 'The Alchemist', 500, 3),
(104, 'Inferno', 650, 4),
(105, 'The Blue Umbrella', 300, 5);

-- Logic:
-- Adds book records linked with authors



-- =========================================
-- 7. INSERT RECORDS INTO CUSTOMERS
-- =========================================
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(201, 'Amit', 'Mumbai'),
(202, 'Priya', 'Pune'),
(203, 'Rahul', 'Delhi'),
(204, 'Anjali', 'Nagpur'),
(205, 'Akash', 'Chennai');

-- Logic:
-- Adds customer records



-- =========================================
-- 8. INSERT RECORDS INTO ORDERS
-- =========================================
INSERT INTO Orders (OrderID, CustomerID, BookID, OrderDate)
VALUES
(1, 201, 101, '2025-01-10'),
(2, 202, 102, '2025-01-11'),
(3, 203, 103, '2025-01-12'),
(4, 204, 104, '2025-01-13'),
(5, 205, 105, '2025-01-14');

-- Logic:
-- Stores book purchase orders



-- =========================================
-- 9. CREATE BOOKAUTHORVIEW
-- =========================================
CREATE VIEW BookAuthorView AS
SELECT Books.BookID,
       Books.Title,
       Authors.AuthorName,
       Books.Price
FROM Books
INNER JOIN Authors
ON Books.AuthorID = Authors.AuthorID;

-- Logic:
-- VIEW stores frequently used query
-- Displays book with author details



-- =========================================
-- 10. CREATE CUSTOMERORDERVIEW
-- =========================================
CREATE VIEW CustomerOrderView AS
SELECT Customers.CustomerName,
       Books.Title,
       Orders.OrderDate
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Books
ON Orders.BookID = Books.BookID;

-- Logic:
-- Displays customer order information
-- Combines multiple tables using JOIN



-- =========================================
-- 11. EXECUTE QUERIES ON VIEWS
-- =========================================
SELECT * FROM BookAuthorView;

SELECT * FROM CustomerOrderView;

-- Logic:
-- Retrieves data directly from views



-- =========================================
-- 12. DROP ONE VIEW
-- =========================================
DROP VIEW CustomerOrderView;

-- Logic:
-- Permanently deletes the selected view