-- ==================================== SET OPERATORS ==================================== --

DROP TABLE IF EXISTS set_students_2025;
DROP TABLE IF EXISTS set_students_2026;

CREATE TABLE set_students_2025 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30)
);

CREATE TABLE set_students_2026 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30)
);

INSERT INTO set_students_2025
(student_id, student_name, department, city)
VALUES
(101, 'Rahul',  'CSE', 'Hyderabad'),
(102, 'Priya',  'ECE', 'Vijayawada'),
(103, 'Arjun',  'CSE', 'Chennai'),
(104, 'Sneha',  'IT',  'Hyderabad'),
(105, 'Kiran',  'EEE', 'Vizag'),
(106, 'Ananya', 'CSE', 'Bangalore'),
(107, 'Rohit',  'MECH', 'Chennai'),
(108, 'Pooja',  'IT',  'Pune');

INSERT INTO set_students_2026
(student_id, student_name, department, city)
VALUES
(103, 'Arjun',  'CSE', 'Chennai'),
(104, 'Sneha',  'IT',  'Hyderabad'),
(106, 'Ananya', 'CSE', 'Bangalore'),
(109, 'Vikram', 'CSE', 'Hyderabad'),
(110, 'Meena',  'ECE', 'Chennai'),
(111, 'Suresh', 'IT',  'Pune'),
(112, 'Divya',  'CSE', 'Vizag'),
(113, 'Rakesh', 'EEE', 'Hyderabad');


-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------

# UNION
/*
SELECT ...
FROM table1

UNION

SELECT ...
FROM table2;

* Both SELECT statements must return the same number of columns.
* Corresponding columns should have compatible data types
* Column names come from the first SELECT (first SELECT determines the output column names.)
* ORDER BY normally belongs at the end
* UNION removes duplicate rows, not duplicate values in isolation
* EXCEPT is directional
* If both result sets contain a row with NULL in the same position, SET operations treat those rows as matching for duplicate/set purposes.
*/

-- Display the student names from both set_students_2025 and set_students_2026, but do not show duplicate names.
SELECT student_name FROM set_students_2025
UNION
SELECT student_name FROM set_students_2026;

-- Display the student name and department of all students from both years, without duplicate rows.
SELECT
	student_name,
    department
FROM set_students_2025

UNION

SELECT
	student_name,
    department
FROM set_students_2026;

-- Find all students from both years who belong to the CSE department. Remove duplicates.
SELECT * FROM set_students_2025
WHERE department = 'CSE'
UNION
SELECT * FROM set_students_2026
WHERE department = 'CSE';

-- Find all CSE students from both years, but display only their names and remove duplicates.
SELECT student_name
FROM set_students_2025
WHERE department = 'CSE'
UNION
SELECT student_name
FROM set_students_2026
WHERE department = 'CSE';

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# UNION ALL
-- Combine result sets + keep duplicate rows

-- Write a query that displays all student names from both years, including duplicates.
SELECT student_name
FROM set_students_2025
UNION ALL
SELECT student_name
FROM set_students_2026;

-- ----------------------------------------------------------------------------------------------------------------------------------------------

-- Find all students from both years who are from Hyderabad, displaying only their names, without duplicates.
SELECT student_name FROM set_students_2025
WHERE city = 'Hyderabad'
UNION
SELECT student_name FROM set_students_2026
WHERE city = 'Hyderabad';

-- Display all students from both years, but show the final combined result ordered alphabetically by student_name.
SELECT student_name
FROM set_students_2025
UNION
SELECT student_name
FROM set_students_2026
ORDER BY student_name;

/*
Find the names of students who were either:
from the CSE department in 2025, OR
from Hyderabad in 2026
Show each student only once.
*/
SELECT student_name
FROM set_students_2025
WHERE department = 'CSE'
UNION
SELECT student_name
FROM set_students_2026
WHERE city = 'Hyderabad';

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# INTERSECT -> Give me only what is common to A and B.

-- Find the student names who appear in both set_students_2025 and set_students_2026.
SELECT student_name
FROM set_students_2025
INTERSECT
SELECT student_name
FROM set_students_2026;

-- Find students who: were in CSE in 2025 AND were in CSE in 2026 Display only their names.
SELECT student_name FROM set_students_2025
WHERE department = 'CSE'
INTERSECT
SELECT student_name FROM set_students_2026
WHERE department = 'CSE';

-- Find students who were from Hyderabad in 2025 AND Hyderabad in 2026. Display their names.
SELECT student_name FROM set_students_2025
WHERE city = 'Hyderabad'
INTERSECT
SELECT student_name FROM set_students_2026
WHERE city = 'Hyderabad';

-- Find students who were in CSE in 2025 but were in IT in 2026.
SELECT student_name FROM set_students_2025
WHERE department = 'CSE'
INTERSECT
SELECT student_name FROM set_students_2026
WHERE department = 'IT';

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# EXCEPT
-- Give me rows that exist in the first result set, but NOT in the second result set.

-- Find students who were in 2025 but did NOT appear in 2026.
SELECT student_name FROM set_students_2025
EXCEPT
SELECT student_name FROM set_students_2026;

-- Find students who appear in 2026 but did NOT appear in 2025.
SELECT student_name FROM set_students_2026
EXCEPT
SELECT student_name FROM set_students_2025;

-- Find students who were in CSE in 2025, but did not belong to CSE in 2026.
SELECT student_name FROM set_students_2025
WHERE department = 'CSE'
EXCEPT
SELECT student_name FROM set_students_2026
WHERE department = 'CSE';

-- Find students who are: either in CSE in 2025 or in IT in 2026 but NOT in Hyderabad in 2026. Display only their names and remove duplicates.
(SELECT student_name FROM set_students_2025
WHERE department = 'CSE'
UNION
SELECT student_name FROM set_students_2026
WHERE department = 'IT' )
EXCEPT 
SELECT student_name FROM set_students_2026
WHERE city = 'Hyderabad';

-- Find students who were either: CSE in 2025, or IT in 2026 but were NOT present in 2025 as ECE students.
(
	SELECT student_name FROM set_students_2025
    WHERE department = 'CSE'
	UNION
    SELECT student_name FROM set_students_2026
    WHERE department = 'IT'
)
EXCEPT
SELECT student_name FROM set_students_2025
WHERE department = 'ECE';