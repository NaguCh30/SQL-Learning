-- ==================================== NULL Functions ==================================== --
-- NULL means -> No value / unknown value / missing value
-- It is not -> 0, '' (empty string), 'NULL' (text), FALSE

-- employees_null table for NULL functions practice
CREATE TABLE employees_null (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    manager_id INT
);

INSERT INTO employees_null
(employee_id, employee_name, department, salary, bonus, manager_id)
VALUES
(101, 'Ravi',   'IT',      60000, 5000, 201),
(102, 'Anu',    'HR',      55000, NULL, 202),
(103, 'Kiran',  'IT',      NULL,  4000, 201),
(104, 'Priya',  'Finance', 70000, NULL, NULL),
(105, 'Arjun',  'HR',      NULL,  3000, 202),
(106, 'Sneha',  'IT',      65000, NULL, NULL),
(107, 'Rahul',  NULL,      50000, 2000, 203),
(108, 'Meena',  'Finance', NULL,  NULL, NULL);

/*
The important MySQL NULL-related functions/operators are:
IFNULL()
COALESCE()
NULLIF()
ISNULL()
IS NULL
IS NOT NULL
*/

# IFNULL() 
/*
IFNULL(expression, value_if_null)

If the expression is NULL, return the second value. Otherwise return the original value.
*/
SELECT employee_name, IFNULL(bonus, 0) AS bonus
FROM employees_null;


SELECT employee_name,
       IFNULL(department, 'Not Assigned') AS department
FROM employees_null;


SELECT employee_name,
       IFNULL(salary, 0) + IFNULL(bonus, 0) AS total_compensation
FROM employees_null;


# COALESCE()
/*
COALESCE(value1, value2, value3, ...)

It returns the first non-NULL value.
*/

SELECT COALESCE(NULL, NULL, 100, 200);


SELECT COALESCE(NULL, NULL, NULL);

SELECT employee_name,
       COALESCE(salary, bonus, 0) AS amount
FROM employees_null;


# NULLIF()
/*
NULLIF(expression1, expression2)

NULLIF() returns NULL when two expressions are equal.

IF expression1 = expression2
    → return NULL
ELSE
    → return expression1
*/

SELECT NULLIF(10, 10);

SELECT NULLIF(10, 1);

SELECT NULLIF(1, 10);

SELECT 100 / NULLIF(0, 0);



# ISNULL()
/*
ISNULL(expression)

return 1 if null, 0 otherwise
*/

SELECT ISNULL(NULL);

SELECT ISNULL(100);

SELECT employee_name,
       ISNULL(bonus) AS bonus_missing
FROM employees_null;


# IS NULL
SELECT *
FROM employees_null
WHERE bonus IS NULL;


# IS NOT NULL
SELECT *
FROM employees_null
WHERE bonus IS NOT NULL;


-- PRACTICE PROBLEMS

-- 1. Display every employee's bonus, but show 0 instead of NULL.
SELECT
	IFNULL(bonus, 0)  AS bonus
FROM employees_null;

-- 2. Display every employee's department, but show: "Not Assigned" when department is NULL.
SELECT
	IFNULL(department, 'Not Assigned') AS department
FROM employees_null;

-- 3. Display: employee_name, salary, bonus, total_income Treat a NULL bonus as 0. (total_income = salary + bonus)
SELECT 
	employee_name,
    salary,
    bonus,
    IFNULL(salary, 0) + IFNULL(bonus, 0) AS total_income
FROM employees_null;

-- 4. Find employees whose salary is NULL.
SELECT * FROM employees_null WHERE salary IS NULL;

-- 5. Find employees whose salary is NOT NULL.
SELECT * FROM employees_null WHERE salary IS NOT NULL;

-- 6. Using COALESCE(), display: salary → if unavailable, bonus → if unavailable, 0
SELECT 
	COALESCE(salary, bonus, 0) AS available_amount
FROM employees_null;

-- 7. Find the number of employees who have a bonus.
SELECT COUNT(bonus) AS employees_count_with_bonus FROM employees_null;

-- 8. Find the total bonus.
SELECT SUM(bonus) AS total_bonus FROM employees_null;

-- 9. Find the average bonus.
SELECT AVG(bonus) AS average_bonus FROM employees_null;

-- 10. Using NULLIF(), write an expression that prevents division by zero:
SELECT 100 / NULLIF(0, 0);

-- 11. Display employee_name, bonus, bonus_missing
SELECT
	employee_name,
    bonus,
    ISNULL(bonus) AS bonus_missing
FROM employees_null;