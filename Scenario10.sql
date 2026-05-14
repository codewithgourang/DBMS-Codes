-- =========================================
-- SCENARIO 10 : Library Management System
-- =========================================


-- =========================================
-- 1. CREATE BOOKS TABLE
-- =========================================
CREATE TABLE Books (
    BookID INT PRIMARY KEY,                -- Unique Book ID
    BookTitle VARCHAR(100) NOT NULL,      -- Book title
    Author VARCHAR(100) NOT NULL,         -- Author name
    AvailableCopies INT NOT NULL          -- Available copies
);

-- Logic:
-- PRIMARY KEY uniquely identifies each book
-- NOT NULL ensures important fields are compulsory



-- =========================================
-- 2. CREATE ISSUEDBOOKS TABLE
-- =========================================
CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY,               -- Unique issue ID
    StudentName VARCHAR(100) NOT NULL,    -- Student name
    IssueDate DATE NOT NULL,              -- Date of issue
    BookID INT,                           -- References Books table

    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Logic:
-- FOREIGN KEY connects issued books with Books table
-- Stores issue details



-- =========================================
-- 3. INSERT RECORDS INTO BOOKS
-- =========================================
INSERT INTO Books (BookID, BookTitle, Author, AvailableCopies)
VALUES
(101, 'Database System', 'Navathe', 5),
(102, 'Operating System', 'Galvin', 3),
(103, 'Computer Networks', 'Tanenbaum', 4),
(104, 'Programming in C', 'Dennis Ritchie', 6),
(105, 'Data Structures', 'Seymour Lipschutz', 2);

-- Logic:
-- Adds book records into library



-- =========================================
-- 4. INSERT RECORDS INTO ISSUEDBOOKS
-- =========================================
INSERT INTO IssuedBooks (IssueID, StudentName, IssueDate, BookID)
VALUES
(1, 'Amit', '2025-01-10', 101),
(2, 'Priya', '2025-01-11', 102),
(3, 'Rahul', '2025-01-12', 103),
(4, 'Anjali', '2025-01-13', 104),
(5, 'Akash', '2025-01-14', 105);

-- Logic:
-- Stores issued book details



-- =========================================
-- 5. CREATE STORED PROCEDURE USING CURSOR
-- =========================================
DELIMITER //

CREATE PROCEDURE DisplayIssuedBooks()
BEGIN

    -- Variable declarations
    DECLARE done INT DEFAULT 0;
    DECLARE v_BookID INT;
    DECLARE v_StudentName VARCHAR(100);
    DECLARE v_IssueDate DATE;

    -- Cursor declaration
    DECLARE issue_cursor CURSOR FOR
    SELECT BookID, StudentName, IssueDate
    FROM IssuedBooks;

    -- Handler for cursor end
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = 1;

    -- Open cursor
    OPEN issue_cursor;

    read_loop: LOOP

        -- Fetch records one by one
        FETCH issue_cursor
        INTO v_BookID, v_StudentName, v_IssueDate;

        -- Exit loop when no records left
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Display fetched data
        SELECT v_BookID AS BookID,
               v_StudentName AS StudentName,
               v_IssueDate AS IssueDate;

    END LOOP;

    -- Close cursor
    CLOSE issue_cursor;

END //

DELIMITER ;

-- Logic:
-- CURSOR retrieves records one by one
-- FETCH gets each row into variables
-- LOOP processes all records
-- HANDLER stops loop when records end



-- =========================================
-- 6. EXECUTE STORED PROCEDURE
-- =========================================
CALL DisplayIssuedBooks();

-- Logic:
-- CALL executes stored procedure
-- Displays issued book details one by one