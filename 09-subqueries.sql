-- ==================================== SUBQUERIES ==================================== --

USE learning;

/*
Question 1 — Basic scalar subquery
Find all employees whose salary is greater than the average salary of all employees.
Expected output should contain: name | salary
*/

SELECT
	name,
    salary
FROM employees
WHERE salary > 
	(SELECT AVG(salary) FROM employees);
    
/*
Question 2 — 
Find the employee(s) whose salary is equal to the highest salary in the company.
Expected output: name | salary
*/

SELECT name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

/*
Question 3 — 
Find all employees whose salary is less than the minimum salary of employees with 5 or more years of experience.
*/

SELECT *
FROM employees
WHERE salary <
	(SELECT MIN(salary) FROM employees 
	WHERE experience >= 5);
    

/*
Question 4
Find all employees who work in a department where at least one employee has a salary greater than ₹80,000.
*/

SELECT * 
FROM employees
WHERE department IN
	(SELECT department FROM
    (SELECT department, COUNT(emp_id) AS employee_count 
    FROM employees 
    WHERE salary > 80000
    GROUP BY department
    HAVING employee_count >= 1) as temp);
    
    
SELECT * 
FROM employees
WHERE department IN 
	(
		SELECT department
		FROM employees
        WHERE salary > 80000
    );


/*
Question 5
Find all employees who work in a department where at least one employee has more than 5 years of experience.
*/

SELECT *
FROM employees
WHERE department IN
	(
		SELECT department
        FROM employees
        WHERE experience > 5
    );
    
    
/*
Question 6 —
Find all employees who work in departments where NO employee has more than 5 years of experience.
*/

SELECT *
FROM employees
WHERE department NOT IN
	(
		SELECT department
        FROM employees
        WHERE experience > 5
    );
    
    
-- ----------------------------------------------------------------------------------------------------------------------------------------------

# ANY -> The comparison needs to be true for at least one value returned by the subquery.
# ALL -> The comparison needs to be true for every value returned by the subquery.


/*
Question 7 —
Find employees whose salary is greater than ANY salary earned by employees in the IT department.
*/

SELECT * 
FROM employees
WHERE salary > ANY
	(
		SELECT salary
        FROM employees
        WHERE department = 'IT'
    );
    

/*
Question 8 —
Find employees whose salary is greater than ALL salaries of employees in the IT department.
*/

SELECT * 
FROM employees
WHERE salary > ALL
	(
		SELECT salary
        FROM employees
        WHERE department = 'IT'
    );
    

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# Subqueries inside SELECT
SELECT
    name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;


/*
Display name, salary, and the maximum salary in the company for every employee.
*/

SELECT 
	name,
    salary,
    (SELECT MAX(salary) FROM employees) AS max_salary
FROM employees;


-- ----------------------------------------------------------------------------------------------------------------------------------------------

# CORRELATED SUBQUERIES

SELECT
	e1.name,
    e1.salary,
    (
		SELECT AVG(e2.salary)
        FROM employees e2
        WHERE e1.department = e2.department
    ) AS department_average
FROM employees e1;


-- Find employees whose salary is greater than the average salary of their own department.
SELECT
	e1.name,
    e1.department,
    e1.salary
FROM employees e1
WHERE e1.salary >
	(
		SELECT AVG(salary)
        FROM employees e2
        WHERE e1.department = e2.department
    );
    

-- Find the highest-paid employee in each department.
SELECT
	e1.name,
    e1.salary,
    e1.department
FROM employees e1
WHERE e1.salary = 
	(
		SELECT
			MAX(e2.salary) as max_salary
		FROM employees e2
        WHERE e1.department = e2.department
    );
    

-- Find employees who have more experience than the average experience of their own department.
SELECT
	e1.name,
    e1.experience,
    e1.department,
    (
		SELECT AVG(e2.experience)
		FROM employees e2
        WHERE e1.department = e2.department
    ) AS avg_dept_exp
FROM employees e1
WHERE experience >
	(
		SELECT AVG(e2.experience)
        FROM employees e2
        WHERE e1.department = e2.department
    );
    
-- Find employees who have the highest experience in their department.
SELECT
	e1.name,
    e1.experience,
    e1.department,
    (
		SELECT MAX(e2.experience) 
        FROM employees e2
        WHERE e1.department = e2.department
    ) AS highest_dept_exp
FROM employees e1
WHERE e1.experience = 
	(
		SELECT MAX(e2.experience)
        FROM employees e2
        WHERE e1.department = e2.department
    );
    

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# SUBQUERIES in FROM statement (This is called a derived table.)

SELECT *
FROM (
	SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg;


-- Find the average salary of each department, and then display only the departments whose average salary is greater than ₹60,000.

SELECT *
FROM (
	SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg
WHERE avg_salary > 60000;


SELECT *
FROM (
	SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
    HAVING avg_salary > 60000
) AS dept_avg;

SELECT
    department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- ----------------------------------------------------------------------------------------------------------------------------------------------

# Subquery inside HAVING

-- Find departments whose average salary is greater than the overall average salary of the company.
SELECT
	department,
    AVG(salary) AS dept_avg
FROM employees
GROUP BY department
HAVING AVG(salary) > (
	SELECT AVG(salary) 
    FROM employees
);

-- Find departments whose maximum salary is greater than the company's overall average salary.

SELECT
	department, 
    MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING max_salary > (
	SELECT AVG(salary)
    FROM employees
);


-- ----------------------------------------------------------------------------------------------------------------------------------------------

#  EXISTS and NOT EXISTS

-- Find employees who belong to a department that has at least one employee earning more than ₹80,000.
SELECT * 
FROM employees 
WHERE department IN 
	(
		SELECT department
        FROM employees 
        WHERE salary > 80000
    );
    
SELECT *
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.department = e1.department
      AND e2.salary > 80000
);


-- Find all employees who have at least one other employee in the same department.
SELECT *
FROM employees e1
WHERE EXISTS
	(
		SELECT e2.department, COUNT(e2.emp_id)
        FROM employees e2
        WHERE e2.department = e1.department
        GROUP BY e2.department
        HAVING COUNT(e2.emp_id) > 1
    );
    
SELECT * 
FROM employees e1
WHERE EXISTS
	(
		SELECT 1
        FROM employees e2
        WHERE e1.department = e2.department
			AND e1.emp_id <> e2.emp_id
    );
   
   
-- Find all employees who work in a department that has at least one employee earning more than ₹80,000.

SELECT * 
FROM employees e1
WHERE EXISTS
	(
		SELECT 1
        FROM employees e2
        WHERE e1.department = e2.department
            AND e2.salary > 80000
    );
    

-- Find employees who are the only employee in their department.

SELECT * 
FROM employees e1
WHERE EXISTS
	(
		SELECT e2.department, COUNT(e2.emp_id)
        FROM employees e2
        WHERE e1.department = e2.department
        GROUP BY e2.department
        HAVING COUNT(e2.emp_id) = 1
    );
    
SELECT * 
FROM employees e1
WHERE NOT EXISTS 
	(
		SELECT 1
		FROM employees e2
        WHERE e1.department = e2.department
			AND e1.emp_id <> e2.emp_id
    );
    

-- Find employees who have NO other employee in their department earning a higher salary. (Find the employee(s) with the highest salary in their department.)

SELECT * 
FROM employees e1
WHERE NOT EXISTS
	(
		SELECT 1
        FROM employees e2
        WHERE e1.department = e2.department
			AND e1.emp_id <> e2.emp_id
            AND e1.salary < e2.salary
    );
    

-- Find employees who have a bonus, but there is NO other employee in their department with a higher bonus.
-- (Give me employees with a bonus who are tied for the highest bonus in their department.)

SELECT *
FROM employees e1
WHERE NOT EXISTS
	(
		SELECT 1
        FROM employees e2
        WHERE e1.emp_id <> e2.emp_id
			AND e1.department = e2.department
            AND e1.bonus < e2.bonus
    );



-- Does there exist another employee in my department whose bonus is lower than mine?

SELECT * 
FROM employees e1
WHERE EXISTS
	(
		SELECT 1
        FROM employees e2
        WHERE e1.emp_id <> e2.emp_id
			AND e1.department = e2.department
            AND e1.bonus > e2.bonus
	);
    
    
    
-- ----------------------------------------------------------------------------------------------------------------------------------------------



-- Find the second highest DISTINCT salary in the employees table.
SELECT MAX(salary) 
FROM employees
WHERE salary < 
	(
		SELECT	MAX(DISTINCT salary) 
        FROM employees
    );
    
-- Find the 2nd highest DISTINCT salary in each department.
SELECT
    e1.name,
    e1.department,
    e1.salary
FROM employees e1
WHERE (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department
      AND e2.salary > e1.salary
) = 1;

-- 3rd highest salary per department
SELECT	
	e1.name,
    e1.department,
    e1.salary
FROM employees e1
WHERE (
	SELECT COUNT(DISTINCT e2.salary)
    FROM employees e2
    WHERE e1.department = e2.department
		AND e2.salary > e1.salary
) = 2;

-- Find all employees whose salary is higher than the average salary of the department that has the highest average salary.

SELECT *
FROM employees
WHERE salary >
	(
		SELECT MAX(avg_salary) AS dept_avg
		FROM (
			SELECT
				department,
				AVG(salary) AS avg_salary
		FROM employees
		GROUP BY department
		) AS dept_avg
    );
    

-- Find the departments whose average salary is greater than the overall average salary of all employees.

SELECT department
FROM (
	SELECT
		department,
		AVG(salary) AS avg_salary
	FROM employees 
	GROUP BY department
	HAVING avg_salary > (
		SELECT AVG(salary) 
		FROM employees
	) 
) AS dept;


-- Find employees who earn more than the average salary of their own department AND have more experience than the average experience of their own department.

SELECT
	e1.name,
    e1.salary,
    e1.experience,
    e1.department
FROM employees e1
WHERE e1.salary > ( 
	SELECT AVG(e2.salary) 
    FROM employees e2
    WHERE e1.department = e2.department
) AND e1.experience > ( 
	SELECT AVG(e2.experience)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- Find departments that have more employees than the average number of employees per department.

SELECT
	department,
    COUNT(emp_id) AS emp_count 
FROM employees
GROUP BY department
HAVING emp_count > (
	SELECT AVG(emp1_count) 
    FROM (
		select department, COUNT(emp_id) AS emp1_count
        FROM employees
        GROUP BY department
    ) AS dept
);