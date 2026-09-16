-- ==================================== Common Table Expression (CTE) ==================================== --
-- It is a temporary named result set that you create inside a SQL query.
-- They make complex SQL queries easier to understand by breaking them into logical steps.

/*
Syntax:
WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM cte_name;
*/

/*
WITH
cte1 AS (
    SELECT ...
),
cte2 AS (
    SELECT ...
),
cte3 AS (
    SELECT ...
)
SELECT ...
FROM cte3;
*/
-- A later CTE can use an earlier CTE.
-- Use a subquery when the logic is simple and local. Use a CTE when the intermediate result deserves a name or the query has multiple logical steps.


/*
CTE
→ temporary logical result
→ one statement
→ disappears after statement


TEMPORARY TABLE
→ temporary database table
→ can be used across multiple statements
→ exists for the session / until dropped
*/

USE learning;

-- employeec
CREATE TABLE employeec (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    experience INT
);

INSERT INTO employeec
(employee_id, employee_name, department, salary, experience)
VALUES
(1, 'Ravi',   'IT',      70000, 5),
(2, 'Priya',  'IT',      85000, 7),
(3, 'Arjun',  'IT',      60000, 3),
(4, 'Sneha',  'HR',      55000, 4),
(5, 'Kiran',  'HR',      65000, 6),
(6, 'Anita',  'HR',      50000, 2),
(7, 'Rahul',  'Sales',   75000, 5),
(8, 'Meena',  'Sales',   60000, 3),
(9, 'Vijay',  'Sales',   90000, 8),
(10,'Neha',   'Finance', 80000, 6),
(11,'Amit',   'Finance', 95000, 9),
(12,'Pooja',  'Finance', 70000, 4);

-- ----------------------------------------------------------------------------------------------------------------------------------------------

/*
Using employeec, create a CTE named high_salary that contains only employees whose salary is greater than 70,000.
Then, using that CTE, display: employee_name, department, salary
*/

WITH high_salary AS (
	SELECT
		employee_name,
        department,
        salary
        FROM employeec
        WHERE salary > 70000
)
SELECT *
FROM high_salary;

/*
Using employeec: Create a CTE named department_salary that calculates the average salary of each department.
Then, from the CTE, display: department, avg_salary
*/

WITH department_salary AS (
	SELECT department, AVG(salary) AS avg_salary
	FROM employeec
    GROUP BY department
)
SELECT *
FROM department_salary;

/*
Using employeec, create a CTE named department_salary that calculates the average salary for each department.
Then, using that CTE, display only departments whose average salary is greater than 70,000.
*/
WITH department_salary AS (
	SELECT
	department, AVG(salary) AS avg_salary
    FROM employeec 
    GROUP BY department
)
SELECT *
FROM department_salary
WHERE avg_salary > 70000;


/*
Create a CTE called: high_salary
The CTE should contain employees whose salary is greater than 70,000.
Then, from that CTE, calculate: How many high-salary employees are there in each department?
Your final output should be: department, employee_count
*/

WITH high_salary AS(
	SELECT *
    FROM employeec
    WHERE salary > 70000
)
SELECT 
	department,
    COUNT(employee_id) AS employee_count
FROM high_salary
GROUP BY department;

/*
Create a CTE called employee_details that contains:
employee_name
department
salary
experience
a new column called annual_salary calculated as salary * 12
Then, from the CTE, display only employees whose annual_salary is greater than 900,000.
*/

WITH employee_details AS (
	SELECT employee_name, department, salary, experience, 
    salary * 12 AS annual_salary
    FROM employeec
)
SELECT * FROM employee_details
WHERE annual_salary > 900000;


/*
Create a CTE named department_stats that calculates both:
Number of employees in each department, Average salary in each department
The CTE should produce: department, employee_count, avg_salary
Then, in the main query, display only departments where: employee_count >= 3
*/

WITH department_stats AS (
	SELECT DISTINCT department,
    AVG(salary) OVER(PARTITION BY department) AS avg_salary,
    COUNT(employee_id) OVER(PARTITION BY department) AS employee_count
	FROM employeec
)
SELECT *
FROM department_stats
WHERE employee_count >= 3;

WITH department_stats AS (
	SELECT department,
    AVG(salary) AS avg_salary,
    COUNT(employee_id) AS employee_count
    FROM employeec
    GROUP BY department
)
SELECT *
FROM department_stats
WHERE employee_count >= 3;


/*
Using employeec:
Step 1: Create a CTE called department_stats that calculates the average salary for each department.
Step 2: Create another CTE called high_avg_departments that uses department_stats and keeps only departments whose average salary is greater than 70,000.
Step 3: From high_avg_departments, display: department, avg_salary
*/
WITH department_stats AS (
	SELECT department, AVG(salary) AS avg_salary
    FROM employeec
    GROUP BY department
),
high_avg_departments AS (
	SELECT * 
    FROM department_stats
    WHERE avg_salary > 70000
)
SELECT * FROM high_avg_departments;


/*
CTE 1 — department_stats
Calculate: department, avg_salary for each department.
CTE 2 — high_avg_departments
Keep only departments where: avg_salary > 70000
Then, in the final query, use employeec and high_avg_departments to display all employees who belong to those high-average-salary departments.
Final columns: employee_name, department, salary
*/

WITH
department_stats AS (
	SELECT department, AVG(salary) AS avg_salary
    FROM employeec GROUP BY department
),
high_avg_departments AS (
	SELECT * FROM department_stats
    WHERE avg_salary > 70000
)
SELECT
	e.employee_name,
    e.department,
    e.salary
FROM employeec e
JOIN high_avg_departments h
ON e.department = h.department;


WITH
department_stats AS (
	SELECT department, AVG(salary) AS avg_salary
    FROM employeec GROUP BY department
),
high_avg_departments AS (
	SELECT * FROM department_stats
    WHERE avg_salary > 70000
)
SELECT
	employee_name,
    department,
    salary
FROM employeec e
WHERE department IN (
	SELECT department FROM high_avg_departments
);


/*
Create a CTE called: department_avg
which produces: department, avg_salary
Then use that CTE with employeec to find employees whose individual salary is greater than their department's average salary.
Final output: employee_name, department, salary, avg_salary
*/
WITH department_avg AS (
	SELECT department, AVG(salary) AS avg_salary
    FROM employeec GROUP BY department
)
SELECT
	e.employee_name,
    e.department,
    e.salary,
    d.avg_salary
FROM employeec e
JOIN department_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;


/*
Create a CTE called ranked_employees that assigns a salary rank to every employee within their department, from highest salary to lowest.
Employees with the same salary should receive the same rank.
Then, using the CTE, display only the highest-paid employee(s) from each department.
Final columns: employee_name, department, salary, salary_rank
*/
WITH
ranked_employees AS (
	SELECT employee_name, department, salary,
    RANK() OVER(
		PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
    FROM employeec
)
SELECT *
FROM ranked_employees
WHERE salary_rank = 1;


-- Find the highest-paid employee(s) among departments whose average salary is greater than 70,000.
WITH
department_avg AS (
	SELECT department, AVG(salary) AS avg_salary
    FROM employeec GROUP BY department
),
high_avg_dept AS (
	SELECT * FROM department_avg WHERE avg_salary > 70000
),
ranked_employees AS (
	SELECT
		e.employee_name,
        e.department,
        e.salary,
        RANK() OVER (
			PARTITION BY department
            ORDER BY e.salary DESC
        ) AS salary_rank
	FROM employeec e
    JOIN high_avg_dept h
    ON e.department = h.department
)
SELECT * FROM ranked_employees WHERE salary_rank = 1;


-- Find employees whose salary is greater than the average salary of their department. with subqueries and CTEs then compare the result
WITH 
dept_avg AS (
	SELECT department, AVG(salary) AS avg_salary
    FROM employeec GROUP BY department
)
SELECT e.employee_name, e.department, e.salary
FROM employeec e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;


SELECT e1.employee_name, e1.department, e1.salary
FROM employeec e1
WHERE salary > (
	SELECT AVG(salary)
    FROM employeec e2
    WHERE e1.department = e2.department
);


/*
Using employeec: Create a CTE named: department_stats  containing: department, avg_salary
Then use that CTE in the final query to display: department, avg_salary
and additionally compare each department's average salary with the overall company average salary.
Your output should contain: department, avg_salary, company_avg_salary
*/

WITH 
department_stats AS (
	SELECT DISTINCT department, 
    AVG(salary) OVER(PARTITION BY department) AS avg_salary,
    AVG(salary) OVER() AS company_avg_salary
    FROM employeec
)
SELECT * FROM department_stats;


-- ----------------------------------------------------------------------------------------------------------------------------------------------

# recursive CTE

/*
WITH RECURSIVE cte_name AS (

    -- Anchor
    SELECT ...

    UNION ALL

    -- Recursive part
    SELECT ...
    FROM cte_name
    ...
)
SELECT *
FROM cte_name;
*/

-- employeehierarchyc
CREATE TABLE employeehierarchyc (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employeehierarchyc
(employee_id, employee_name, manager_id)
VALUES
(1, 'CEO', NULL),
(2, 'Ravi', 1),
(3, 'Priya', 1),
(4, 'Arjun', 2),
(5, 'Sneha', 2),
(6, 'Kiran', 3),
(7, 'Meena', 3);

SELECT *
FROM employeehierarchyc;

WITH RECURSIVE employee_hierarchy AS (

    -- Anchor
    SELECT
        employee_id,
        employee_name,
        manager_id
    FROM employeehierarchyc
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive member
    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id
    FROM employeehierarchyc e
    JOIN employee_hierarchy h
        ON e.manager_id = h.employee_id
)
SELECT *
FROM employee_hierarchy;




WITH RECURSIVE employee_hierarchy AS (
    
    -- Anchor: start from CEO
    SELECT
        employee_id,
        employee_name,
        manager_id,
        0 AS level
    FROM employeehierarchyc
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive member: find employees under
    -- employees already found
    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        h.level + 1 AS level
    FROM employeehierarchyc e
    JOIN employee_hierarchy h
        ON e.manager_id = h.employee_id
)
SELECT *
FROM employee_hierarchy;