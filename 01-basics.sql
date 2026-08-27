-- Creating Database
CREATE DATABASE IF NOT EXISTS learning;

USE learning;

-- Verifying the selected database
SELECT DATABASE();

-- Viewing exisiting Databases
SHOW DATABASES;

-- =================================================================================================== --

-- Creating table
CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
	email VARCHAR(50) UNIQUE,
	age INT CHECK(age >= 18),
    gender CHAR(1),
    city VARCHAR(50) DEFAULT 'Vijayawada',
    marks DECIMAL(5, 2),
    is_active BOOLEAN  DEFAULT TRUE
);

SHOW CREATE TABLE students;
DESC students;
# DESCRIBE students;

-- Viewing existing tables 
SHOW TABLES;


-- =================================================================================================== --

-- INSERTING
/*
SYNTAX:

INSERT INTO table_name
(column1, column2, column3, ...)
VALUES
(value1, value2, value3, ...);
*/

# Inserting single row
INSERT INTO students
(name, email, age, gender, city, marks)
VALUES
('Ravi', 'ravi@gmail.com', 21, 'M', 'Hyderabad', 85.50);

SELECT * FROM students;

INSERT INTO students
(name, email, age, gender, city, marks)
VALUES
("Anil", 'anil@gmail.com', 22, 'M', 'Chennai', 78.50);

SELECT * FROM students;


# Inserting multiple rows
INSERT INTO students
(name, email, age, gender, city, marks)
VALUES
('Arjun', 'arjun@gmail.com', 21, 'M', 'Hyderabad', 82.50),
('Priya', 'priya@gmail.com', 20, 'F', 'Chennai', 91),
('Rahul', 'rahul@gmail.com', 23, 'M', 'Banglore', 67.75),
('Sneha', 'sneha@gmail.com', 21, 'F', 'Hyderabad', 88.25),
('Kiran', 'kiran@gmail.com', 21, 'M', NULL, 76.5),
('Divya', 'divya@gmail.com', 20, 'F', 'Chennai', 94),
('Naveen', 'navven@gmail.com', 24, 'M', 'Banglore', 71.25),
('Ananya', 'ananya@gmail.com', 19, 'F', 'Hyderabad', 86.5),
('Suresh', 'suresh@gmail.com', 25, 'M', Null, 63.5),
('Kavya', 'kavya@gmail.com', 22, 'F', Null, 89.0),
('Rohit', 'rohit@gmail.com', 21, 'M', 'Mumbai', 74.25),
('Meena', 'meena@gmail.com', 23, 'F', 'Chennai', 81.50),
('Varun', 'varun@gmail.com', 20, 'M', 'Vijayawada', 69.75),
('Pooja', 'pooja@gmail.com', 22, 'F', 'Hyderabad', 92.5),
('Aditya', 'aditya@gmail.com', 24, 'M', 'Pune', 78),
('Lakshmi', Null, 21, 'F', Null, 85.25),
('Harish', 'harish@gmail.com', 26, 'M', 'Bangalore', Null),
('Swathi', 'swathi@gmail.com', 20, 'F', 'Hyderabad', 90.75),
('Manoj', 'manoj@gmail.com', 23, 'M', Null, 72.50),
('Aishwarya', 'aishwarya@gmail.com', 21, 'F', 'Chennai', 96);

/*

Correct syntax to use DEFAULT city name while multiple insert is like,
('Kavya', 'kavya@gmail.com', 22, 'F', DEFAULT, 89.0)
Otherwise if we give like
('Kavya', 'kavya@gmail.com', 22, 'F', Null, 89.0)
then in place of city the value Null value is stored instead of Default value 'Vijayawada'

*/

SELECT * FROM students;

-- =================================================================================================== --

-- SELECT statements
# Selecting full table
SELECT * FROM students;

# Selecting Specific columns
SELECT name, age, city 
FROM students;

# Selecting Columns With Aliases
SELECT name AS student_name 
FROM students;

SELECT 
	name AS student_name,
    age AS student_age,
    marks AS student_marks
FROM students;

SELECT name student_name
FROM students;

-- =================================================================================================== --

# Expressions and Calculations in SELECT (+, -, *, /, %)
SELECT name, marks, marks + 5 AS updated_marks
FROM students;

SELECT
    name,
    marks,
    marks + 5 AS bonus_marks,
    marks - 5 AS reduced_marks,
    marks * 2 AS double_marks,
    marks / 2 AS half_marks
FROM students;

SELECT
    name,
    marks,
    ROUND(marks + 5, 2) AS bonus_marks,
    ROUND(marks - 5, 2) AS reduced_marks,
    ROUND(marks * 2, 2) AS double_marks,
    ROUND(marks / 2, 2) AS half_marks
FROM students;

/* 
TUNCATE  will truncates the value, ROUND will give the Rounded value
*/

# DISTINCT : DISTINCT removes duplicate result combinations.
/*
Syntax:
SELECT DISTINCT column_name
FROM table_name;
*/
SELECT city
FROM students;

SELECT DISTINCT city
FROM students;

SELECT DISTINCT city, gender
FROM students;

-- =================================================================================================== --

# WHERE
/*
Syntax:

SELECT column1, column2
FROM table_name
WHERE condition;
*/
SELECT *
FROM students
WHERE marks > 80;

# Comparision Operators (=, <>, !=, >, <, >=, <=)
SELECT name, city, marks
FROM students
WHERE marks > 80;

SELECT name, city, marks
FROM students
WHERE marks >= 80;

SELECT name, city
FROM students
WHERE city = 'Chennai';

SELECT name, city
FROM students
WHERE city is Null;

SELECT *
FROM students
WHERE is_active = FALSE;

SELECT name, age 
FROM students
WHERE age <> 21;

SELECT name, age 
FROM students
WHERE age != 21;

-- =================================================================================================== --

# AND OR NOT
/*
Syntax:

SELECT *
FROM students
WHERE condition1
  AND condition2;
*/

-- Find students who are from Hyderabad AND have marks above 80:
SELECT *
FROM students
WHERE city = 'Hyderabad'
  AND marks > 80;
  
-- students from either Hyderabad or Chennai:
SELECT * 
FROM students
WHERE city = 'Hyderabad'
	OR city = 'Chennai';

-- students who are not from Hyderabad:
SELECT *
FROM students
WHERE NOT city = 'Hydearabad';

-- Students who are from Hyderabad or Chennai, and have marks above 80:
SELECT * 
FROM students
WHERE city = 'Hyderabad'
	OR city = 'Chennai'
	AND marks > 80; -- Operator Precedence NOT -> AND -> OR
					-- A OR B AND C is interpreted as A OR (B AND C)
    
SELECT *
FROM students
WHERE (city = 'Hyderabad' OR city = 'Chennai')
  AND marks > 80;
  
-- =================================================================================================== --

# NULL
-- NULL means the value is missing, unknown, or not provided. It does not mean 0, '', 'NULL', FALSE

SELECT *
FROM students;


-- students whose city is NULL.
SELECT *
FROM students
WHERE city IS NULL;

SELECT name, city
FROM students
WHERE city IS NULL;

-- To find students whose city is not null
SELECT name, city
FROM students 
WHERE city IS NOT NULL;

SELECT *
FROM students
WHERE marks > 80
	AND city IS NULL;
    
SELECT COUNT(*)
FROM students;

SELECT COUNT(city) 
FROM students;

SELECT DISTINCT city
FROM students;

-- =================================================================================================== --

# COALESCE
-- If we want to display some value(Like Unknown) in place of NULL fields then we will
-- use the function COALESCE(column, value) 
SELECT
	name,
    COALESCE(city, 'Unknown') AS city
FROM students;

SELECT COALESCE(NULL, NULL, 'Hello', 'World');

-- =================================================================================================== --

# NULLIF
/*
NULLIF(value1, value2)

NULL        if value1 = value2
value1      otherwise
*/
SELECT NULLIF(10, 20);

-- =================================================================================================== --

# IFNULL
-- IFNULL(expression, replacement)
SELECT
    name,
    IFNULL(city, 'Unknown') AS city
FROM students;

-- =================================================================================================== --

# ORDER BY
-- ORDER BY used to sort the result
/*
Syntax:
SELECT column1, column2
FROM table_name
ORDER BY column_name;

Note: By default, MySQL sorts in ascending order (ASC).
*/

-- Sorting by marks
SELECT name, marks
FROM students 
ORDER BY marks; -- Ascending order by default

SELECT name, marks
FROM students 
ORDER BY marks ASC; -- Ascending order

SELECT name, marks
FROM students 
ORDER BY marks DESC; -- Descending order

-- Sorting by name (String field)
SELECT name, city
FROM students
ORDER BY name ASC;

-- Sorting by multiple columns
SELECT name, city, marks
FROM students
ORDER BY city ASC, marks DESC; -- Here SQL first sirts by city ASC, then within the same city it sorts by marks DESC

-- ORDER BY with WHERE
SELECT name, city, marks
FROM students
WHERE marks >= 80
ORDER BY marks DESC;

-- ORDER BY using an alias
SELECT 
	name,
    marks * 2 AS doubled_marks
FROM students
ORDER BY doubled_marks DESC;

-- ORDER BY using an expression
SELECT 
	name,
    marks
FROM students
ORDER BY marks + 5 DESC;

SELECT
    name,
    marks,
    marks / 2 AS half_marks
FROM students
ORDER BY marks / 2 DESC;
 
 /*
ASC  → NULL values first
DESC → NULL values last
 */
SELECT name, marks
FROM students
ORDER BY marks;

SELECT name, marks
FROM students
ORDER BY marks DESC;

-- =================================================================================================== --

# LIMIT
-- LIMIT controls how many rows are returned.
/*
Syntax:
SELECT *
FROM students
LIMIT 5;
*/

SELECT *
FROM students
LIMIT 5;

-- Combined ORDER BY + LIMT
SELECT name, marks
FROM students
ORDER BY marks DESC
LIMIT 5;

-- LIMIT with WHERE
-- Give me the 3 highest-scoring students from Hyderabad.
SELECT name, marks, city
FROM students
WHERE city = 'Hyderabad'
ORDER BY marks DESC
LIMIT 3;

-- LIMIT with Offset
-- We can also skip rows
/*
Syntax:
LIMIT offset, count;
*/
SELECT name, marks
FROM students
ORDER BY marks DESC;

SELECT name, marks
FROM students
ORDER BY marks DESC
LIMIT 5;

SELECT name, marks
FROM students
ORDER BY marks DESC
LIMIT 5, 5;         -- Skips first 5 records

-- Get the top 3 students by marks
SELECT name, marks
FROM students
ORDER BY marks DESC
LIMIT 3;

-- Get the bottom 3 students by marks
SELECT name, marks
FROM students
ORDER BY marks 
LIMIT 3;

SELECT name, marks
FROM students
WHERE marks IS NOT NULL
ORDER BY marks
LIMIT 3;

-- Get top 3 female students by marks
SELECT name, marks, gender
FROM students
WHERE gender = 'F'
ORDER BY marks DESC
LIMIT 3;

-- Get top 5 students from Hyderabad by marks
SELECT name, marks, gender, city
FROM students
WHERE city = 'Hyderabad'
ORDER BY marks DESC
LIMIT 5;

-- Sort all students by marks descending, then retrieve the 6th–10th highest-scoring students using LIMIT
SELECT * 
FROM students
ORDER BY marks DESC
LIMIT 5, 5;

-- =================================================================================================== --

SELECT name, city, marks
FROM students
WHERE marks >= 80
ORDER BY marks DESC
LIMIT 5;

/*
FROM      → Which table?
WHERE     → Which rows?
SELECT    → Which columns/expressions?
ORDER BY  → In what order?
LIMIT     → How many?

There's a subtle distinction between SQL's written order and logical processing order.
*/


-- =================================================================================================== --

# UPDATE
/*
Syntax:
UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE condition;
*/

-- Change Arjun's city
Select * from students where name = 'Arjun';

UPDATE students
SET city = 'Mumbai'
WHERE student_id = 3;

Select * from students where name = 'Arjun';

/*
UPDATE students
SET city = 'Mumbai'
WHERE student_id = (
    SELECT student_id
    FROM (
        SELECT student_id
        FROM students
        WHERE name = 'Arjun'
    ) AS temp
);
*/

-- 1. Update using multiple conditions
-- give a 5-mark bonus to students from Hyderabad who scored below 90
UPDATE students
SET marks = marks + 5
WHERE city = 'Hyderabad'
 AND marks < 90;

-- 2. Update multiple columns
-- Change a student's city and active status:
UPDATE students 
SET city = 'Bangalore',
	is_active = TRUE
WHERE student_id = 5;

-- 3. Update using an expression
-- Increase marks by 10% for students who scored below 70:
UPDATE students
SET marks = marks * 1.10
WHERE marks < 70;

-- 4. Update NULL values
-- Set missing cities to Vijayawada
UPDATE students
SET city = 'Vijayawada'
WHERE city IS NULL;

SELECT * FROM students;

-- 5. Update using CASE
UPDATE students
SET is_active = 
	CASE 
		WHEN marks >= 80 THEN TRUE
        ELSE FALSE
	END;
SELECT * FROM students;


-- 6. Updating with DEFAULT
UPDATE students
SET city = DEFAULT
WHERE student_id = 5;


UPDATE students
SET marks = 36
WHERE marks IS NULL;
-- =================================================================================================== --

# DELETE
-- DELETE is used to remove existing rows from table
-- Unlike UPDATE, which changes values, DELETE removes the entire row

/*
Syntax:
DELETE FROM table_name
WHERE condition;
*/

DELETE FROM students
WHERE email IS NULL;

SELECT * FROM students;