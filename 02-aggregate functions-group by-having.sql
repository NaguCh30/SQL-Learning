# -------------------- Aggregation Functions --------------------

USE learning;

CREATE TABLE IF NOT EXISTS employees (
	emp_id INT PRIMARY KEY,
    name VARCHAR(30),
    department VARCHAR(20),
    city VARCHAR(30),
    salary INT,
    experience INT,
    bonus INT
);

INSERT INTO employees 
(emp_id, name, department, city, salary, experience, bonus)
VALUES 
(101, 'Aisha', 'IT', 'Hyderabad', 60000, 2, 5000),
(102, 'Rahul', 'IT', 'Hyderabad', 75000, 4, 8000),
(103, 'Priya', 'HR', 'Bangalore', 500000, 3, 4000),
(104, 'Arjun', 'IT', 'Chennai', 90000, 6, 10000),
(105, 'Sneha', 'HR', 'Hyderabad', 55000, 2, 3000),
(106, 'Kiran', 'Sales', 'Bangalore', 65000, 5, 7000),
(107, 'Neha', 'Sales', 'Chennai', 70000, 4, 6000),
(108, 'Vikram', 'IT', 'Bangalore', 80000, 5, 9000),
(109, 'Ananya', 'Sales', 'Hyderabad', 60000, 3, 5000),
(110, 'Rohan', 'HR', 'Chennai', 52000, 2, 3500);

SELECT * FROM employees;


# An aggregate function processes a set of rows/values and returns a single value for that set.
/*
COUNT() -> Count rows/values
SUM()   -> Calculate total
AVG()   -> Calculate average
MIN()   -> Find minimum
MAX()   -> Find maximum
*/

# COUNT()
SELECT COUNT(*)
FROM employees;

# SUM()
SELECT SUM(salary)
FROM employees;
/*
SUM(salary) does not treat NULL as zero in the calculation.

It effectively adds the available non-NULL salary values.
*/


# AVG()
SELECT AVG(salary)
FROM employees;

# MIN()
SELECT MIN(salary)
FROM employees;

# MAX()
SELECT MAX(salary)
FROM employees;

-- ================================================================================ --

INSERT INTO employees
VALUES (111, NULL, 'IT', 'Hyderabad', 65000, 2, 5000);

-- COUNT() --

SELECT COUNT(*) -- -> Counts rows
FROM employees; 

SELECT COUNT(name) -- -> Count non-NULL values in that column
FROM employees;

-- How many differenet departments are there in the given table?

SELECT COUNT(DISTINCT department) AS total_departments
FROM employees; 

-- ================================================================================ --

-- Find the total bonus paid to all employees.
SELECT SUM(bonus) AS total_bonus_paid
FROM employees;

-- Find the average experience.
SELECT AVG(experience) AS avg_exp
FROM employees;

-- Find the highest bonus.
SELECT MAX(bonus) AS highest_bonus
FROM employees;

-- Find the lowest salary.
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- Find how many different cities employees belong to.
SELECT COUNT(DISTINCT city) AS city_count
FROM employees;

-- Find how many employees have a bonus recorded.
SELECT COUNT(bonus) 
FROM employees;

-- Find the difference between the highest and lowest salary.
SELECT MAX(salary) - MIN( salary) AS diff
FROM employees;


-- ================================================================================ --

# GROUP BY
/*
GROUP BY creates groups, and the aggregate function operates on each group separately.
*/

/*

SELECT department, AVG(salary)
FROM employees
GROUP BY department;

Think of it as:

				employees
					↓
			GROUP BY department
					↓
		┌────────┬────────┬─────────┐
		│   HR   │   IT   │  Sales  │
		└────────┴────────┴─────────┘
		   ↓         ↓        ↓
		 AVG()     AVG()    AVG()
		   ↓         ↓        ↓
		52333.33   76250    65000

*/


SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Find Total salary of each department.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Find Average salary of each department.
SELECT department, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department;

-- Find number of employees in each city
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;

-- 1. Find number of employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 2. Find the total bonus paid by each department.
SELECT department, SUM(bonus) AS total_bonus_paid
FROM employees
GROUP BY department;

-- 3. Find the average experience of employees in each department.
SELECT department, AVG(experience) AS avg_exp
FROM employees
GROUP BY department;

-- 4. Find the highest salary in each department.
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 5. Find the lowest salary in each department.
SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

-- 6. Find the number of employees in each city.
SELECT city, COUNT(*) AS number_of_employees
FROM employees
GROUP BY city;

-- 7. Find the total salary paid in each city.
SELECT city, SUM(salary) AS total_salary_paid
FROM employees
GROUP BY city;

-- 8. Find the average salary in each city.
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city;

-- 9. Find the maximum bonus received in each department.
SELECT department, MAX(bonus) AS max_bonus
FROM employees
GROUP BY department;

-- 10. Find department, employee count, total salary, average salary, 
-- minimum salary, and maximum salary for every department.
SELECT 
	department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department;

-- ================================================================================ --

# WHERE + GROUP BY

-- Find the average salary of each department, but only consider employees whose salary is greater than 60000.
SELECT department, ROUND(AVG(salary), 2) AS average_salary
FROM employees
WHERE salary > 60000
GROUP BY department;

# HAVING

-- Find departments whose average salary is greater than 60,000.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING average_salary > 60000;

/*
WHERE  → filters ROWS
HAVING → filters GROUPS
*/

-- Find departments whose average salary is greater than 60,000, considering only employees earning more than 50,000.
SELECT department, AVG(salary) AS average_salary
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING average_salary > 60000;

-- 1. Find the number of employees in each department whose salary is greater than 60,000.
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE salary > 60000
GROUP BY department;

-- 2. Find the total salary of each department, considering only employees with at least 3 years of experience.
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE experience >= 3
GROUP BY department;

-- 3. Find departments where the total salary is greater than 200,000.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 200000;

-- 4. Find departments where the average salary is greater than 60,000.
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 60000;

-- 5. Find departments having at least 3 employees.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING employee_count >= 3;

-- 6. Find cities having more than 3 employees.
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING employee_count > 3;

-- 7. Find departments where:
    -- employee count is greater than 2
    -- AND average salary is greater than 60,000
SELECT 
	department, 
	COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING 
	employee_count > 2 
    AND
    avg_salary > 60000;
    
-- 8. Find the average salary of each department, but only consider employees with more than 2 years of experience, 
--    and display only departments whose resulting average salary is above 60,000.
SELECT 
	department, 
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE experience > 2
GROUP BY department
HAVING avg_salary > 60000;

-- ================================================================================ --

-- Grouping with multiple columns

-- 1. Find the number of employees in each department and city combination.
SELECT department, city, COUNT(*) AS employee_count
FROM employees
GROUP BY department, city;

-- 2. Find the total salary for each department and city combination.
SELECT department, city, SUM(salary) AS  total_salary
FROM employees
GROUP BY department, city;

-- 3. Find the average salary for each department and city combination.
SELECT department, city, AVG(salary) AS  avg_salary
FROM employees
GROUP BY department, city;

-- 4. Find the department + city combinations having more than 1 employee.
SELECT department, city, COUNT(*) total_employees
FROM employees
GROUP BY department, city
HAVING total_employees > 1;

-- 5. Find the department + city combinations where the total salary is greater than 100,000.
SELECT department, city, SUM(salary) AS  total_salary
FROM employees
GROUP BY department, city
HAVING total_salary > 100000;

-- 6. Find each department's:
	-- employee count
	-- total salary
	-- average salary
	-- minimum salary
	-- maximum salary
	-- You've already done this one with a single grouping column. Do it again, but this time also group by city. 
SELECT 
	department, city,
    COUNT(*) AS emp_count,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department, city;

-- 7. Find cities where:
	-- at least 3 employees work there
	-- and the average salary is greater than 60,000
SELECT city, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM employees
GROUP BY city
HAVING emp_count >= 3 AND avg_salary > 60000;

-- 8. Find departments where:
	-- at least 3 employees work there
	-- total salary is greater than 200,000
	-- average salary is greater than 60,000
SELECT 
	department, COUNT(*) AS emp_count, 
    SUM(salary) AS total_salary, 
	AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING 
	emp_count >= 3 AND
    total_salary > 200000 AND
    avg_salary > 60000;