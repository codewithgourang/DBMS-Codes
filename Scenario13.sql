-- =========================================
-- SCENARIO 13 : Student Result Management System
-- =========================================


-- =========================================
-- 1. CREATE STUDENTMARKS TABLE
-- =========================================
CREATE TABLE StudentMarks (
    StudentID INT PRIMARY KEY,             -- Unique student ID
    StudentName VARCHAR(100) NOT NULL,    -- Student name
    Subject VARCHAR(100) NOT NULL,        -- Subject name
    Marks INT NOT NULL                    -- Student marks
);

-- Logic:
-- PRIMARY KEY uniquely identifies each student
-- NOT NULL ensures required fields



-- =========================================
-- 2. INSERT VALID RECORDS
-- =========================================
INSERT INTO StudentMarks
(StudentID, StudentName, Subject, Marks)
VALUES
(101, 'Amit', 'Database', 85),
(102, 'Priya', 'Mathematics', 92),
(103, 'Rahul', 'Physics', 76),
(104, 'Anjali', 'Programming', 88),
(105, 'Akash', 'Networks', 69);

-- Logic:
-- Adds valid student marks records



-- =========================================
-- 3. CREATE TRIGGER FOR VALIDATION
-- =========================================
DELIMITER //

CREATE TRIGGER CheckMarksBeforeInsert
BEFORE INSERT ON StudentMarks
FOR EACH ROW
BEGIN

    -- Check valid marks range
    IF NEW.Marks < 0 OR NEW.Marks > 100 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Invalid Marks! Marks should be between 0 and 100';

    END IF;

END //

DELIMITER ;

-- Logic:
-- Trigger runs automatically before insert
-- Prevents invalid marks entry
-- Allows only marks between 0 and 100



-- =========================================
-- 4. CREATE TRIGGER FOR UPDATE
-- =========================================
DELIMITER //

CREATE TRIGGER CheckMarksBeforeUpdate
BEFORE UPDATE ON StudentMarks
FOR EACH ROW
BEGIN

    -- Check valid marks range
    IF NEW.Marks < 0 OR NEW.Marks > 100 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Invalid Marks! Marks should be between 0 and 100';

    END IF;

END //

DELIMITER ;

-- Logic:
-- Prevents updating marks outside valid range



-- =========================================
-- 5. TEST TRIGGER WITH INVALID INSERT
-- =========================================
INSERT INTO StudentMarks
VALUES (106, 'Neha', 'Electronics', 120);

-- Logic:
-- This insertion fails
-- because marks > 100



-- =========================================
-- 6. TEST TRIGGER WITH INVALID UPDATE
-- =========================================
UPDATE StudentMarks
SET Marks = -10
WHERE StudentID = 101;

-- Logic:
-- Update fails because marks < 0



-- =========================================
-- 7. DISPLAY VALID RECORDS
-- =========================================
SELECT * FROM StudentMarks;

-- Logic:
-- Displays only valid stored records