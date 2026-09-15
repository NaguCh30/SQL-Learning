-- ==================================== Window Functions ==================================== --

USE learning;

-- employeesw
CREATE TABLE employeesw (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT
);

INSERT INTO employeesw
(employee_id, employee_name, department, salary, experience)
VALUES
(1, 'Amit',   'IT',      60000, 2),
(2, 'Priya',  'IT',      80000, 5),
(3, 'Rahul',  'IT',      70000, 4),
(4, 'Sneha',  'HR',      50000, 3),
(5, 'Arjun',  'HR',      55000, 6),
(6, 'Neha',   'Finance', 75000, 4),
(7, 'Vikram', 'Finance', 65000, 2),
(8, 'Kiran',  'Sales',   45000, 1),
(9, 'Anjali', 'Sales',   60000, 5);

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Display every employee and the overall average salary of all employees.
SELECT
	e1.employee_id,
    e1.employee_name,
    e1.department,
    e1.salary,
    e1.experience,
    (SELECT ROUND(AVG(e2.salary), 2) FROM employeesw e2) AS overall_avg
FROM employeesw e1;

SELECT
	employee_id,
    employee_name,
    department,
    salary,
    experience,
    AVG(salary) OVER() AS overall_avg
FROM employeesw;

SELECT
	employee_id,
    employee_name,
    department,
    salary,
    experience,
    ROUND(AVG(salary) OVER(), 2) AS overall_avg
FROM employeesw;


/*
Using employeesw, write a query that displays: employee_name, department, salary, department_avg
where each employee gets the average salary of their own department, while every employee remains visible.
*/

SELECT 
	employee_name, 
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS deprtment_avg
FROM employeesw;

SELECT 
	employee_name, 
    department,
    salary,
    AVG(salary) OVER(
		PARTITION BY department
        ORDER BY salary
	) AS deprtment_avg
FROM employeesw;


SELECT
    employee_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS running_salary
FROM employeesw;

-- ----------------------------------------------------------------------------------------------------------------------------------------------
# Ranking Functions

/*
1. ROW_NUMBER()
Gives every row a unique number.

2. RANK()
Tied rows get the same rank, but gaps occur.

3. DENSE_RANK()
Tied rows get the same rank, but no gaps occur.
*/

-- Assign a unique row number to every employee based on salary, from highest salary to lowest.
SELECT
	employee_name, salary, department,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS salary_row_number 
FROM employeesw;

-- Give every employee their rank within their own department.
SELECT
	employee_name, salary, department,
    ROW_NUMBER() OVER(
		PARTITION BY department 
        ORDER BY salary DESC) AS dept_sal_row_num
FROM employeesw;


INSERT INTO employeesw
(employee_id, employee_name, department, salary, experience)
VALUES
(10, 'Rohit', 'IT', 60000, 3),
(11, 'Pooja', 'IT', 50000, 2);


SELECT
	employee_name, salary, department,
    RANK() OVER(
		PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employeesw;

SELECT 
	employee_name, salary, department,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employeesw;

SELECT
	employee_name, department,
    DENSE_RANK() OVER(
		PARTITION BY department
        ORDER BY salary DESC
	) as salary_rank
FROM employeesw;


SELECT 
	employee_name, salary, department,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employeesw;



-- Find the top 2 highest-paid employees from every department.

SELECT employee_name, department, salary
FROM (
	SELECT
		employee_name, salary, department,
		ROW_NUMBER() OVER(
			PARTITION BY department
			ORDER BY salary DESC
		) AS rn
	FROM employeesw
    ) AS ranked
WHERE rn <= 2;


INSERT INTO employeesw
(employee_id, employee_name, department, salary, experience)
VALUES
(12, 'Suresh', 'IT', 70000, 3);
-- Find the top 2 salary positions from every department, including all employees who tie for those positions.

SELECT employee_name, department, salary
FROM (
	SELECT
		employee_name,
		salary,
		department,
		RANK() OVER(
			PARTITION BY department
			ORDER BY salary DESC
		) AS rnk
	FROM employeesw
) AS ranked
WHERE rnk <= 2;


-- Write a query that returns: employee_name, department, salary for employees who have the 3rd highest distinct salary in their department.
SELECT employee_name, department, salary
FROM (
	SELECT
		employee_name,
		department,
		salary,
		DENSE_RANK() OVER(
			PARTITION BY department
			ORDER BY salary DESC
		) AS rnk
	FROM employeesw
) AS ranked
WHERE rnk = 3;

-- ----------------------------------------------------------------------------------------------------------------------------------------------
# Aggregate Window Functions

-- Show every employee's salary and the total salary.
SELECT
    employee_name,
    department,
    salary,
    SUM(salary) OVER() AS total_salary
FROM employeesw;

-- Show every employee's salary and the total salary of their department.
SELECT
	employee_name,
    department,
    salary,
   ROUND( SUM(salary) OVER(PARTITION BY department), 2) AS dept_total_salary
FROM employeesw;

-- Write a query displaying: employee_name, department, salary, dept_total_salary, dept_avg_salary
SELECT
	employee_name, department, salary,
    ROUND(SUM(salary) OVER(PARTITION BY department), 2) AS dept_total_salary,
    ROUND(AVG(salary) OVER(PARTITION BY department), 2) AS dept_avg_salary
FROM employeesw;

-- Show every employee, along with how many employees work in their department.
SELECT
	employee_name, department,
    COUNT(employee_id) OVER(PARTITION BY department) AS dept_employee_count
FROM employeesw;


-- For every employee, show their salary, their department's average salary, and how much higher/lower their salary is compared with the department average.
SELECT
	employee_name,
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary,
    ROUND(salary - AVG(salary) OVER(PARTITION BY department), 2) AS salary_difference
FROM employeesw;


-- Show every employee ordered by salary from lowest to highest, along with the cumulative salary total up to that employee.
SELECT
	employee_name,
    salary,
    department,
    SUM(salary) OVER(ORDER BY salary) AS running_total
FROM employeesw
ORDER BY salary;

-- ----------------------------------------------------------------------------------------------------------------------------------------------
# Window Frames

# ROWS
/*
ROWS means, conceptually: "Count actual rows."

For 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
we get:
Row 1 → include row 1
Row 2 → include rows 1–2
Row 3 → include rows 1–3
Row 4 → include rows 1–4
Even if two rows have the same salary, they are still two separate rows.
*/


# RANGE
/*
RANGE thinks more in terms of ordering values.
If two rows have the same ordering value, they are considered peers.
So:
	100
	100
	200
Can behave like:
	100 → 200
	100 → 200
	200 → 400
Both 100 rows see the same frame because they have the same ordering value.
*/


SELECT
    employee_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
    ) AS rows_running_total
FROM employeesw
ORDER BY salary, employee_id;

SELECT
    employee_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS rows_running_total
FROM employeesw
ORDER BY salary, employee_id;

SELECT
    employee_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS rows_running_total
FROM employeesw
ORDER BY salary, employee_id;


-- For each employee, calculate the average salary of the current employee and the previous employee.
SELECT
	employee_name,
    department,
    salary,
    ROUND(
		AVG(salary) OVER(
			ORDER BY salary
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		), 2 
	)AS running_avg
FROM employeesw;

/*
Write a query using employeesw that displays: employee_name, salary, two_row_avg
where two_row_avg is: The average of the current employee's salary and the immediately previous employee's salary when ordered by salary ascending.
*/
SELECT
	employee_name, salary, 
    AVG(salary) OVER (
		ORDER BY salary
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS two_row_avg
FROM employeesw;

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# LAG() and LEAD()

CREATE TABLE salesw (
    sale_id INT PRIMARY KEY,
    sale_month DATE,
    amount DECIMAL(10,2)
);

INSERT INTO salesw
(sale_id, sale_month, amount)
VALUES
(1, '2026-01-01', 10000),
(2, '2026-02-01', 12000),
(3, '2026-03-01', 9000),
(4, '2026-04-01', 15000),
(5, '2026-05-01', 17000),
(6, '2026-06-01', 14000);

SELECT * 
FROM salesw
ORDER BY sale_month;

-- Write a query displaying: sale_month, amount, previous_month_amount where previous_month_amount contains the previous month's sales.
SELECT
	sale_month,
    amount,
    LAG(amount) OVER(ORDER BY sale_month) AS previous_month_amount
FROM salesw;

-- Write a query displaying: sale_month, amount, previous_month_amount, sales_change
-- where: sales_change = current amount - previous month amount
SELECT 
	sale_month,
    amount,
    LAG(amount) OVER(ORDER BY sale_month) AS previous_month_sale,
    amount - LAG(amount) OVER(ORDER BY sale_month) AS sales_change
FROM salesw;

-- Write: sale_month, amount, previous_month_sale, percentage_change 
-- where percentage_change is the percentage increase/decrease from the previous month.
SELECT
	sale_month, amount,
    LAG(amount) 
    OVER(ORDER BY sale_month) AS previous_month_sale,
    (amount - LAG(amount) OVER(ORDER BY sale_month)) / LAG(amount) OVER(ORDER BY sale_month) * 100 AS percentage_change
FROM salesw;

-- Using salesw, write a query that displays: sale_month, amount, next_month_sale
SELECT
	sale_month, amount, 
    LEAD(amount) OVER(ORDER BY sale_month) AS next_month_sale
FROM salesw;

-- Using salesw, display: sale_month, amount, next_month_sale, next_month_change
-- where: next_month_change = next month's amount - current month's amount

SELECT
	sale_month, amount,
    LEAD(amount) OVER(ORDER BY sale_month) AS next_month_sale,
    LEAD(amount) OVER(ORDER BY sale_month) - amount AS next_month_change
FROM salesw;


-- We can also use LAG() and LEAD() to get the desired previous or next value using like LAG(amount, 2), LAG(amount, 3)... LEAD(amount, 2), LEAD(amount, 3)...
-- ----------------------------------------------------------------------------------------------------------------------------------------------

# FIRST_VALUE() and LAST_VALUE()
-- FIRST_VALUE() → "Give me the value from the first row of my window."

-- Using salesw, display: sale_month, amount, first_month_sale
SELECT
	sale_month,
    amount,
    FIRST_VALUE(amount) OVER(ORDER BY sale_month) AS first_month_sale
FROM salesw;

/*
* LAST_VALUE() gives the last value in the current frame, which is usually just the current row.
* To get the actual last month's value We need to tell MySQL: Don't stop the frame at the current row. Extend it all the way to the last row.

We do that with:
LAST_VALUE(amount) OVER(
    ORDER BY sale_month
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
*/

SELECT
	sale_month,
    amount,
    LAST_VALUE(amount) OVER(
		ORDER BY sale_month
    ) AS current_last
FROM salesw;

-- Using salesw, write a query that displays: sale_month, amount, last_month_sale where last_month_sale should be 14000 for every row.
SELECT
	sale_month,
    amount,
    LAST_VALUE(amount) OVER(
		ORDER BY sale_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS last_month_sale
FROM salesw;

-- ----------------------------------------------------------------------------------------------------------------------------------------------

-- Using employeesw, find the highest salary in each department and display it beside every employee. 
SELECT
	employee_name,
    salary,
    department,
    MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employeesw;


-- Using employeesw, display: employee_name, department, salary, highest_dept_salary, salary_difference
-- Where: salary_difference = highest_dept_salary - salary
SELECT
	employee_name, department, salary,
    MAX(salary) OVER(PARTITION BY department) AS highest_dept_salary,
    MAX(salary) OVER(PARTITION BY department) - salary AS salary_diffrenece
FROM employeesw;


-- Using employeesw, display: employee_name, department, salary
-- But return only the employee(s) who have the highest salary in their department.
SELECT employee_name, department, salary
FROM (
	SELECT employee_name, department, salary,
    RANK() OVER(
		PARTITION BY department
		ORDER BY salary DESC
    ) AS rnk
    FROM employeesw
) AS ranked
WHERE rnk = 1;

-- For every employee, show how much their salary is above or below their department's average salary.
-- Display: employee_name, department, salary, dept_avg_salary, salary_difference
-- Where: salary_difference = salary - dept_avg_salary
SELECT 
	employee_name, department, salary,
    AVG(salary) OVER(
		PARTITION BY department
    ) AS dept_avg_salary,
    salary - AVG(salary) OVER(
		PARTITION BY department
    ) AS salary_difference
FROM employeesw;


-- Using employeesw, display: employee_name, department, salary, dept_avg_salary, percentage_difference
-- Formula: (salary - dept_avg_salary) / dept_avg_salary × 100
SELECT
	employee_name, department, salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary,
    (salary - AVG(salary) OVER(PARTITION BY department)) / AVG(salary) OVER(PARTITION BY department) * 100 AS percentage_difference
FROM employeesw;


-- Compare with the previous employee
-- Using employeesw, display: employee_name, department, salary, previous_salary
-- But there's an important requirement:
-- The comparison should happen within each department, with employees ordered by salary from highest to lowest.

SELECT
	employee_name,
    department,
    salary,
    LAG(salary) OVER(
		PARTITION BY department
        ORDER BY salary DESC, employee_id
    ) as previous_salary
FROM employeesw;


-- Using the same ordering, display: employee_name, department, salary, previous_salary, salary_gap
-- Where: salary_gap = previous_salary - salary
SELECT
	employee_name,
    department,
    salary,
    LAG(salary) OVER(
		PARTITION BY department
        ORDER BY salary DESC
    ) AS previous_salary,
    LAG(salary) OVER (
		PARTITION BY department
        ORDER BY salary DESC
    ) - salary AS salary_gap
FROM employeesw;

/*
A company wants to identify the top 2 salary positions in each department, including employees who are tied.
Using employeesw, display: employee_name, department, salary, salary_rank

80000 → 1
70000 → 2
70000 → 2
60000 → 4
50000 → 5
*/

SELECT
	employee_name, department, salary, salary_rank
FROM (
	SELECT 
		employee_name, department, salary,
        RANK() OVER(
			PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
	FROM employeesw
) AS ranked
WHERE salary_rank <= 2;

-- Using employeesw, find the second-highest distinct salary in each department, including all employees who earn that salary.
SELECT
	employee_name, department, salary, salary_rank
FROM (
	SELECT
		employee_name, department, salary,
        DENSE_RANK() OVER(
			PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
	FROM employeesw
) AS ranked
WHERE salary_rank = 2;


/*
Using employeesw, display: employee_name, department, salary, salary_rank
Rank employees within each department by salary from highest to lowest.
Requirement: Employees with the same salary must receive the same rank, and there should be no gaps after ties.
*/
SELECT
	employee_name, department, salary,
    DENSE_RANK() OVER(
		PARTITION BY department
        ORDER BY salary DESC
	) AS salary_rank
FROM employeesw;

/*
Using employeesw, display: employee_name, department, salary, dept_avg_salary, dept_total_salary, highest_dept_salary
All three department-level values should appear alongside every employee.
Requirement: Round the average to 2 decimal places.
*/
SELECT
	employee_name,
    department,
    salary,
    ROUND(AVG(salary) OVER(PARTITION BY department), 2) AS dept_avg_salary,
    SUM(salary) OVER(PARTITION BY department) AS dept_total_salary,
    MAX(salary) OVER(PARTITION BY department) AS highest_dept_salary
FROM employeesw;


/*
Using employeesw, display: employee_name, department, salary, previous_salary, salary_change
Within each department, order employees by salary highest to lowest.
salary_change = previous_salary - salary
*/
SELECT
	employee_name, department, salary,
    LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS previous_salary,
	LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) - salary AS salary_change
FROM employeesw;

/*
Using employeesw, return: employee_name, department, salary
Find the second-highest distinct salary in each department.
Important: If two employees share that salary, return both employees.
*/
SELECT
	employee_name, department, salary
FROM (
	SELECT
		employee_name, department, salary,
        DENSE_RANK() OVER(
			PARTITION BY department
            ORDER BY salary DESC
        ) AS rnk
	FROM employeesw
) AS ranked
WHERE rnk = 2;


/*
Using salesw, display: sale_month, amount, previous_month_sale, sales_change, percentage_change
Where: sales_change = current month - previous month
percentage_change = (current month - previous month) / previous month × 100
*/

SELECT
	sale_month, amount, 
    LAG(amount) OVER(
		ORDER BY sale_month
    ) AS previous_month_sale,
    amount - LAG(amount) OVER(ORDER BY sale_month) AS sales_change,
    (amount - LAG(amount) OVER(ORDER BY sale_month)) / LAG(amount) OVER(ORDER BY sale_month) * 100 AS percentage_change
FROM salesw;