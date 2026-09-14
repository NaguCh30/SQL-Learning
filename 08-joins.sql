-- ==================================== JOINS ==================================== --

USE learning;

-- departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'IT', 'Hyderabad'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Mumbai'),
(4, 'Sales', 'Delhi'),
(5, 'Marketing', 'Chennai'),
(6, 'Operations', 'Pune'),
(7, 'Legal', 'Mumbai'),
(8, 'Customer Support', 'Hyderabad'),
(9, 'Research', 'Bangalore'),
(10, 'Quality Assurance', 'Chennai'),
(11, 'Engineering', 'Pune'),
(12, 'Product Management', 'Hyderabad'),
(13, 'Procurement', 'Delhi'),
(14, 'Administration', 'Mumbai'),
(15, 'Security', 'Bangalore'),
(16, 'Training', 'Chennai'),
(17, 'Data Analytics', 'Hyderabad'),
(18, 'Public Relations', 'Delhi'),
(19, 'Logistics', 'Pune'),
(20, 'Business Development', 'Mumbai'),
(21, 'Design', 'Bangalore'),
(22, 'Information Security', 'Hyderabad'),
(23, 'Compliance', 'Delhi'),
(24, 'Infrastructure', 'Pune'),
(25, 'Innovation', 'Chennai');


-- employees_j
CREATE TABLE employees_j (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT
);

INSERT INTO employees_j
(employee_id, employee_name, email, salary, hire_date, department_id)
VALUES
(101, 'Arjun', 'arjun@company.com', 65000, '2021-03-15', 1),
(102, 'Priya', 'priya@company.com', 72000, '2020-07-10', 2),
(103, 'Rahul', 'rahul@company.com', 58000, '2022-01-20', 3),
(104, 'Sneha', 'sneha@company.com', 61000, '2021-11-05', 4),
(105, 'Vikram', 'vikram@company.com', 55000, '2023-02-18', 5),
(106, 'Ananya', 'ananya@company.com', 68000, '2020-09-25', 6),
(107, 'Kiran', 'kiran@company.com', 75000, '2019-06-12', 1),
(108, 'Meera', 'meera@company.com', 52000, '2023-04-08', 8),
(109, 'Rohit', 'rohit@company.com', 83000, '2018-12-01', 9),
(110, 'Divya', 'divya@company.com', 59000, '2022-06-14', 10),
(111, 'Suresh', 'suresh@company.com', 91000, '2017-05-19', 11),
(112, 'Neha', 'neha@company.com', 67000, '2021-08-22', 12),
(113, 'Amit', 'amit@company.com', 48000, '2024-01-10', 13),
(114, 'Pooja', 'pooja@company.com', 54000, '2023-09-17', 14),
(115, 'Varun', 'varun@company.com', 78000, '2020-02-11', 15),
(116, 'Isha', 'isha@company.com', 62000, '2022-10-03', 16),
(117, 'Manoj', 'manoj@company.com', 88000, '2019-03-27', 17),
(118, 'Kavya', 'kavya@company.com', 57000, '2023-05-16', 18),
(119, 'Nikhil', 'nikhil@company.com', 63000, '2021-01-07', 19),
(120, 'Riya', 'riya@company.com', 71000, '2020-11-13', 20),
(121, 'Aditya', 'aditya@company.com', 69000, '2022-03-21', 21),
(122, 'Swathi', 'swathi@company.com', 76000, '2019-08-30', 22),
(123, 'Harish', 'harish@company.com', 82000, '2018-04-18', 23),
(124, 'Lakshmi', 'lakshmi@company.com', 60000, '2022-12-05', 24),
(125, 'Tejas', 'tejas@company.com', 73000, '2021-06-09', 25),

(126, 'Ramesh', 'ramesh@company.com', 51000, '2024-02-15', 1),
(127, 'Sanjana', NULL, 66000, '2023-07-11', 4),
(128, 'Deepak', 'deepak@company.com', NULL, '2022-09-19', 7),
(129, 'Nandini', 'nandini@company.com', 58000, NULL, 10),
(130, 'Ajay', 'ajay@company.com', 62000, '2021-10-01', NULL),
(131, 'Madhav', 'madhav@company.com', 47000, '2024-03-12', 30),
(132, 'Shreya', 'shreya@company.com', 69000, '2020-05-28', 2),
(133, 'Gautam', NULL, 85000, '2019-11-20', 11),
(134, 'Bhavana', 'bhavana@company.com', 56000, '2023-12-01', 40),
(135, 'Surya', 'surya@company.com', 64000, '2022-07-07', 17);


-- projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    start_date DATE,
    department_id INT
);

INSERT INTO projects
(project_id, project_name, budget, start_date, department_id)
VALUES
(201, 'Website Redesign', 250000, '2024-01-10', 1),
(202, 'Mobile Banking App', 500000, '2023-06-15', 11),
(203, 'Employee Portal', 180000, '2024-02-01', 2),
(204, 'Sales Dashboard', 220000, '2023-09-12', 17),
(205, 'Customer Chatbot', 300000, '2024-03-05', 8),
(206, 'Cloud Migration', 750000, '2022-11-20', 24),
(207, 'Security Upgrade', 450000, '2023-04-18', 22),
(208, 'Market Research', 150000, '2024-01-25', 9),
(209, 'Quality Automation', 280000, '2023-08-14', 10),
(210, 'New Product Launch', 600000, '2024-04-10', 12),
(211, 'Recruitment System', 175000, '2023-12-05', 2),
(212, 'Financial Forecasting', 350000, '2023-07-19', 3),
(213, 'Supply Chain Optimization', 420000, '2022-10-11', 19),
(214, 'Brand Campaign', 270000, '2024-02-20', 5),
(215, 'Legal Compliance Tool', 190000, '2023-05-15', 7),
(216, 'Data Warehouse', 800000, '2022-06-10', 17),
(217, 'Training Platform', 210000, '2024-03-18', 16),
(218, 'PR Management System', 160000, '2023-11-01', 18),
(219, 'Procurement Portal', 230000, '2024-01-30', 13),
(220, 'Design System', 200000, '2023-10-08', 21),
(221, 'Innovation Lab', 550000, '2024-05-01', 25),
(222, 'Infrastructure Upgrade', 480000, '2023-03-15', 24),
(223, 'Business Expansion', 700000, '2024-02-12', 20),
(224, 'Compliance Audit', 140000, '2023-06-22', 23),
(225, 'Internal Security Review', 320000, '2024-04-25', 15);


-- employee_projects
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    assigned_date DATE,
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO employee_projects
(employee_id, project_id, role, assigned_date)
VALUES
(101, 201, 'Developer', '2024-01-15'),
(101, 206, 'Cloud Engineer', '2024-02-10'),
(102, 203, 'HR Specialist', '2024-02-05'),
(102, 211, 'HR Lead', '2023-12-10'),
(103, 212, 'Accountant', '2023-07-25'),
(104, 204, 'Sales Analyst', '2023-09-20'),
(104, 223, 'Sales Executive', '2024-02-15'),
(105, 214, 'Marketing Executive', '2024-02-25'),
(106, 213, 'Operations Analyst', '2022-11-01'),
(107, 201, 'Senior Developer', '2024-01-12'),
(107, 216, 'Data Engineer', '2022-07-01'),
(108, 205, 'Support Specialist', '2024-03-10'),
(109, 208, 'Research Analyst', '2024-02-01'),
(109, 221, 'Research Lead', '2024-05-05'),
(110, 209, 'QA Engineer', '2023-08-20'),
(111, 202, 'Backend Engineer', '2023-06-20'),
(111, 206, 'Cloud Architect', '2022-12-01'),
(112, 210, 'Product Manager', '2024-04-15'),
(113, 219, 'Procurement Officer', '2024-02-05'),
(114, 215, 'Legal Advisor', '2023-05-20'),
(115, 207, 'Security Engineer', '2023-04-20'),
(115, 225, 'Security Lead', '2024-04-28'),
(116, 217, 'Trainer', '2024-03-20'),
(117, 204, 'Data Analyst', '2023-09-15'),
(117, 216, 'Data Architect', '2022-06-15'),
(118, 218, 'PR Executive', '2023-11-05'),
(119, 213, 'Logistics Analyst', '2022-10-15'),
(120, 223, 'Business Analyst', '2024-02-20'),
(121, 220, 'UI Designer', '2023-10-10'),
(122, 207, 'Security Analyst', '2023-04-25'),
(123, 224, 'Compliance Officer', '2023-06-25'),
(124, 222, 'Infrastructure Engineer', '2023-03-20'),
(125, 221, 'Innovation Engineer', '2024-05-05'),

(126, 201, 'Junior Developer', '2024-01-20'),
(127, 204, 'Sales Associate', '2023-09-25'),
(128, 215, 'Legal Assistant', '2023-05-25'),
(129, 209, 'QA Analyst', '2023-08-25'),
(130, 210, 'Product Analyst', '2024-04-20'),
(131, 201, 'Contract Developer', '2024-02-01'),
(132, 203, 'HR Executive', '2024-02-10'),
(133, 202, 'Senior Engineer', '2023-06-25'),
(134, 214, 'Marketing Associate', '2024-03-01'),
(135, 216, 'Data Analyst', '2022-06-20'),

(101, 222, 'Infrastructure Support', '2023-03-25'),
(103, 216, 'Financial Analyst', '2022-06-25'),
(105, 221, 'Marketing Strategist', '2024-05-10'),
(108, 217, 'Support Trainer', '2024-03-25'),
(111, 225, 'Security Reviewer', '2024-05-01'),
(112, 221, 'Product Strategist', '2024-05-10'),
(120, 201, 'Business Consultant', '2024-01-25'),
(121, 210, 'Product Designer', '2024-04-20'),
(124, 206, 'Infrastructure Lead', '2022-11-25');


-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------

# INNER JOIN
-- INNER JOIN returns only the rows where the JOIN condition finds a match in both tables.
/*
Basic Syntax:

SELECT columns
FROM table1
INNER JOIN table2
    ON table1.common_column = table2.common_column;
*/

/*
1.
Display the employee name and their department name for all employees whose department exists in the departments table.
*/

SELECT
	e.employee_name,
    d.department_name
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id;


/*
2. 

Display the employee ID, employee name, and department location for employees whose department exists.
*/

SELECT
	e.employee_id,
    e.employee_name,
    d.location
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id;

/*
3.

Display the employee name, salary, and department name for employees who have a matching department.
*/

SELECT
	e.employee_name,
    e.salary,
    d.department_name
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id;


/*
4. 

Display employees who belong to the IT department.
*/

SELECT *
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

/*
Practice 5 — Employees in specific departments

Display: employee_name | department_name
for employees who belong to either IT or Finance.
*/

SELECT
	e.employee_name,
    d.department_name
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IN ('IT', 'Finance');

/*
Practice 6 — Salary + department

Display: employee_name | salary | department_name
for employees whose salary is greater than 70,000 and whose department exists.
*/

SELECT
	e.employee_name,
    e.salary,
    d.department_name
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 70000;

/*
Practice 7 — Department location

Display: employee_name | department_name | location
for employees working in Hyderabad.
*/

SELECT
	e.employee_name,
    d.department_name,
    d.location
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.location = 'Hyderabad';

/*
Practice 8 — Department IDs

Display: employee_name | department_id | department_name
for employees whose department_id is between 10 and 20, inclusive.
*/

SELECT
	e.employee_name,
    d.department_id,
    d.department_name
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id BETWEEN 10 AND 20;

/*
Practice 9 — Important one 

Display all employees who have a matching department and whose salary is NULL.
Expected columns: employee_name | salary | department_name
*/

SELECT
	e.employee_name,
    e.salary,
	d.department_name
FROM employees_j e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary IS NULL;


-- ----------------------------------------------------------------------------------------------------------------------------------------------

# LEFT JOIN
/* 
LEFT JOIN keeps every row from the left table and adds matching information from the right table.
*/

/*
FROM employees_j e
LEFT JOIN departments d

means:

LEFT TABLE                    RIGHT TABLE
employees_j                   departments
     │
     ├── ALL rows stay
     │
     └── matching department information is added
*/

/*
Practice 1

Display: employee_name | department_name
for all employees, including employees whose department doesn't exist.
*/

SELECT
	e.employee_name,
    d.department_name
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/*
Practice 2

Display: employee_id | employee_name | department_name for all employees.
If an employee doesn't have a matching department, show NULL for department_name.
*/

SELECT 
	e.employee_id,
    e.employee_name,
    d.department_name
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/*
Practice 3

Display: employee_name | department_name | location for all employees.
This time, notice what happens to employees like:
Ajay
Madhav
Bhavana
*/

SELECT	
	e.employee_name,
    d.department_name,
    d.location
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/*
Practice 4 
Display only the employees who don't have a matching department.
Expected: employee_name | department_id
Think about what value will appear on the departments side when there is no match.
*/

SELECT 
	e.employee_name,
    d.department_id
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

/*
Practice 5 

Display:
employee_name | department_name for all employees, but show: 'Not Assigned' instead of NULL when the employee has no matching department.
*/

SELECT
	e.employee_name,
    IFNULL(d.department_name, 'Not Assigned') AS department_name
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/*
Practice 6 — Reverse perspective
Display:
department_name | employee_name for all departments, including departments that currently have no employees.
This one is important.
*/

SELECT	
	d.department_name,
    e.employee_name
FROM departments d
LEFT JOIN employees_j e
ON d.department_id = e.department_id;

/*
Practice 7
Display all employees with: employee_name | department_name But show only employees whose department is either missing or doesn't exist.
*/

SELECT 
	e.employee_name,
    d.department_name
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE (e.department_id IS NOT NULL AND d.department_id IS NULL)
		OR
		(e.department_id IS NULL);

/*
Practice 8

Display: department_name | employee_count for every department, including departments with zero employees.
This is your first JOIN + aggregate problem.
*/

SELECT
	d.department_name, 
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees_j e
	ON d.department_id = e.department_id
GROUP BY department_name;

/*
Practice 9

Display: department_name | employee_name | salary for all departments and their employees.
Sort the result by: department_name ASC
*/

SELECT	
	d.department_name,
    e.employee_name,
    e.salary
FROM departments d
LEFT JOIN employees_j e
	ON e.department_id = d.department_id
ORDER BY department_name ASC;


/*
Practice 10 

Display all employees and their department names, but replace missing departments with: 'Department Not Found'
However, employees with department_id = NULL should show: 'Not Assigned'
*/

SELECT
	e.employee_name,
	CASE
		WHEN e.department_id IS NOT NULL AND d.department_id IS NULL 
			THEN 'Department Not Found'
        WHEN e.department_id IS NULL 
			THEN 'Not Assigned'
        ELSE d.department_name
	END AS department_name
FROM employees_j e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/*
Challenge 11  

Display: department_name | employee_count
for all departments, but count employees using a LEFT JOIN.
*/

SELECT
	d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees_j e
	ON d.department_id = e.department_id
GROUP BY d.department_name;


/*
Challenge 12 — LEFT JOIN + HAVING  

Now let's combine LEFT JOIN + COUNT() + HAVING.
Display: department_name | employee_count for only those departments that have at least 2 employees.
*/

SELECT
	d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees_j e
	ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) >= 2;

/*
Challenge 13 —
Display: department_name | employee_count | avg_salary for all departments, including departments with zero employees.
*/

SELECT
	d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS avg_salary
FROM departments d
LEFT JOIN employees_j e
	ON d.department_id = e.department_id
GROUP BY department_name;


-- ----------------------------------------------------------------------------------------------------------------------------------------------


# RIGHT JOIN

/*
RIGHT JOIN — Practice 1/5

Display: employee_id | employee_name | department_name
for all employees, including employees whose department: is NULL, or doesn't exist in departments.
*/

SELECT
	e.employee_id,
    e.employee_name,
    d.department_name
FROM departments d
RIGHT JOIN employees_j e
	ON e.department_id = d.department_id;
    
    
/*
RIGHT JOIN — Practice 2/5
Display: employee_name | department_name | location
for all employees, but show only employees whose salary is greater than 60,000.
*/

SELECT
	e.employee_name,
    d.department_name,
    d.location
FROM departments d
RIGHT JOIN employees_j e
	ON e.department_id = d.department_id
WHERE e.salary > 60000;

/*
RIGHT JOIN — Practice 3/5
Display: employee_id | employee_name | department_id
for employees whose department is either missing or doesn't exist in the departments table.
*/

SELECT
	e.employee_id,
    e.employee_name,
    e.department_id
FROM departments d
RIGHT JOIN employees_j e
	ON d.department_id = e.department_id
WHERE 
	e.department_id IS NULL
    OR 
    (e.department_id IS NOT NULL AND d.department_id IS NULL);
    

/*
RIGHT JOIN — Practice 4/5
Display: department_name | employee_count 
for all departments, including departments with zero employees.
*/

SELECT 
	d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees_j e
RIGHT JOIN departments d
	ON d.department_id = e.department_id
GROUP BY d.department_name;


/*
RIGHT JOIN — Practice 5/5 

Display:
department_name | employee_count | avg_salary
for all departments, including departments with zero employees.
Then show only departments where the average salary is greater than 60,000.
*/

SELECT
	d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS avg_salary
FROM employees_j e
RIGHT JOIN departments d
	ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING avg_salary > 60000;


-- ----------------------------------------------------------------------------------------------------------------------------------------------


# FULL OUTER JOIN -> Keep everything from both tables.
-- MySQL does not have ful outer join so we simulate it using LEFT JOIN, UNION, RIGHT JOIN
/*
-- LEFT JOIN
SELECT ...
FROM A
LEFT JOIN B
    ON ...

UNION

-- RIGHT JOIN
SELECT ...
FROM A
RIGHT JOIN B
    ON ...;
*/



/*
Practice 1

Display:
employee_id | employee_name | department_name
and include all employees AND all departments, even when there is no match.
*/

SELECT
	e.employee_name,
    d.department_name
FROM employees_j e
LEFT JOIN departments d
	ON d.department_id = e.department_id

UNION

SELECT	
	e.employee_name,
    d.department_name
FROM employees_j e
RIGHT JOIN departments d
	ON d.department_id = e.department_id;
    
    

SELECT
	e.employee_name,
    d.department_name
FROM employees_j e
LEFT JOIN departments d
	ON d.department_id = e.department_id

UNION

SELECT	
	e.employee_name,
    d.department_name
FROM departments d
LEFT JOIN employees_j e
	ON d.department_id = e.department_id;
    

/*
FULL OUTER JOIN — Practice 2/5
Now let's find the unmatched records from both sides.
Display: employee_name | department_name
but return only rows where there is no match.
*/

SELECT
	e.employee_name,
    d.department_name
FROM employees_j e
LEFT JOIN departments d
	ON e.department_id = d.department_id
WHERE 
	d.department_id IS NULL

UNION

SELECT 
	e.employee_name,
    d.department_name
FROM employees_j e
RIGHT JOIN departments d
	ON d.department_id = e.department_id
WHERE
	e.department_id IS NULL;
    
    
/*
FULL OUTER JOIN — Practice 3/5

Display:
employee_id | employee_name | department_name | location
for all employees AND all departments.

Additionally:
If an employee has no matching department → show department_name as Not Assigned
If a department has no employees → show employee_name as No Employee
*/

SELECT
	e.employee_id,
    e.employee_name,
    IF(d.department_id IS NULL, "Not Assigned", d.department_name) AS department_name,
    d.location
FROM employees_j e
LEFT JOIN departments d
	ON d.department_id = e.department_id

UNION

SELECT
	e.employee_id,
    IF(e.employee_id IS NULL, "No Employee", e.employee_name) AS employee_name,
    d.department_name,
    d.location
FROM employees_j e
RIGHT JOIN departments d	
	ON d.department_id = e.department_id;
    


/*
FULL OUTER JOIN — Practice 4/5

Display:
department_name | employee_count
for all departments AND unmatched employees.

For a normal department, show its employee count.

For an unmatched employee (department doesn't exist), show:
department_name = 'Unknown Department'
employee_count = 1
*/

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees_j e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name

UNION

SELECT
    'Unknown Department' AS department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees_j e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL
GROUP BY d.department_id;



/*
Final Practice — 5/5 

Write a MySQL query that displays:
employee_name | department_name
and returns every employee and every department, including unmatched records.

For unmatched employees, show: "Unknown Department" instead of NULL.

For unmatched departments, show: "No Employee" instead of NULL.
*/

SELECT
	e.employee_name,
    IF(d.department_id IS NULL, "Unknown Department", d.department_name) AS department_name
FROM employees_j e
LEFT JOIN departments d
	ON d.department_id = e.department_id

UNION

SELECT
	IF(e.employee_id IS NULL, "No Employee", e.employee_name) AS employee_name,
    d.department_name
FROM employees_j e
RIGHT JOIN departments d
	ON d.department_id = e.department_id;


-- ----------------------------------------------------------------------------------------------------------------------------------------------


# SELF JOIN -> A SELF JOIN means joining a table with itself.

-- employees_self table for slef join practice
CREATE TABLE employees_self (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT
);

INSERT INTO employees_self
(employee_id, employee_name, job_title, salary, manager_id)
VALUES
(101, 'Arjun', 'CEO', 150000, NULL),
(102, 'Priya', 'HR Manager', 95000, 101),
(103, 'Rahul', 'IT Manager', 110000, 101),
(104, 'Sneha', 'Finance Manager', 100000, 101),
(105, 'Vikram', 'Sales Manager', 98000, 101),

(106, 'Ananya', 'HR Executive', 65000, 102),
(107, 'Kiran', 'HR Executive', 62000, 102),
(108, 'Meera', 'Recruiter', 58000, 102),

(109, 'Rohit', 'Senior Developer', 90000, 103),
(110, 'Divya', 'Developer', 75000, 103),
(111, 'Suresh', 'Developer', 72000, 103),
(112, 'Neha', 'Junior Developer', 55000, 109),

(113, 'Amit', 'Accountant', 68000, 104),
(114, 'Pooja', 'Financial Analyst', 70000, 104),
(115, 'Varun', 'Financial Analyst', 69000, 104),

(116, 'Isha', 'Sales Executive', 60000, 105),
(117, 'Manoj', 'Sales Executive', 62000, 105),
(118, 'Kavya', 'Sales Executive', 59000, 105),

(119, 'Nikhil', 'Intern', 30000, 106),
(120, 'Riya', 'Intern', 32000, 107),

(121, 'Aditya', 'Developer', 68000, 109),
(122, 'Swathi', 'Developer', 67000, 109),

(123, 'Harish', 'Accountant', 64000, 113),
(124, 'Lakshmi', 'Sales Executive', 61000, 117),

-- Messy data
(125, 'Tejas', 'Developer', 70000, NULL),
(126, 'Ramesh', 'Analyst', 56000, 999),
(127, 'Sanjana', 'Designer', 58000, 999),
(128, 'Deepak', 'Intern', NULL, 110),
(129, 'Nandini', 'Developer', 65000, 125),
(130, 'Ajay', 'Support Engineer', 54000, NULL);


/*
SELF JOIN — Practice 1


Display: employee_name | manager_name
for every employee who has a valid manager.
*/

SELECT
	e.employee_name,
    m.employee_name AS manager_name
FROM employees_self e
JOIN employees_self m
	ON m.employee_id = e.manager_id;
    

/*
SELF JOIN — Practice 2/5

Display: employee_name | manager_name | manager_salary
for employees whose manager earns more than 100,000.
*/

SELECT
	e.employee_name,
    m.employee_name AS manager_name,
    m.salary AS manager_salary
FROM employees_self e
JOIN employees_self m
	ON e.manager_id = m.employee_id
WHERE m.salary > 100000;


/*
SELF JOIN — Practice 3/5 
Find employees whose manager does not exist in the table.
Display: employee_name | manager_id
*/

SELECT
	e.employee_name,
    m.manager_id
FROM employees_self e
LEFT JOIN employees_self m
	ON e.manager_id = m.employee_id
WHERE m.employee_id IS NULL;



/*
SELF JOIN — Practice 4/5 
Find top-level employees — employees who do not have a manager.

Display: employee_name | job_title
From our data, employees such as Arjun, Tejas, and Ajay have manager_id = NULL.
*/

SELECT DISTINCT
	e.employee_name,
    e.job_title
FROM employees_self e
LEFT JOIN employees_self m
	ON e.employee_id = m.manager_id
WHERE
	e.manager_id IS NULL;
    
SELECT
	employee_name,
    job_title
FROM employees_self
WHERE manager_id IS NULL;


/*
SELF JOIN - Practice 5/5
Task: Find employees who have at least one other employee reporting directly to them.
Display: employee_name | direct_report_count
*/

SELECT
	m.employee_name AS employee_name,
    COUNT(e.employee_id) AS direct_report_count
FROM employees_self e
JOIN employees_self m
	ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name
HAVING direct_report_count >= 1;


-- ----------------------------------------------------------------------------------------------------------------------------------------------


# CROSS JOIN -> CROSS JOIN produces every possible combination of rows from the two tables.
/*
Syntax:

SELECT ...
FROM table_a
CROSS JOIN table_b;

There is no ON condition in CROSS JOIN cause we are not trying to find matching rows
*/

/*
CROSS JOIN — Practice 1/5

Using our existing tables, write a query that displays:
department_name | employee_name
for every possible department–employee combination.
*/

SELECT
	d.department_name,
    e.employee_name
FROM departments d
CROSS JOIN employees_j e;


/*
CROSS JOIN — Practice 2/5
Suppose the company wants to generate every possible pairing of departments and projects to explore potential project assignments.
Display:
department_name | project_name
for every possible department–project combination.
*/

SELECT
	d.department_name,
    p.project_name
FROM departments d
CROSS JOIN projects p;


/*CROSS JOIN — Practice 3/5
Display:
department_name | employee_name
for every possible department–employee combination, but only where the employee's salary is greater than 70,000.
*/

SELECT
	d.department_name,
    e.employee_name
FROM departments d
CROSS JOIN employees_j e
WHERE e.salary > 70000;


/*
CROSS JOIN — Practice 4/5

Imagine the company wants to generate every possible combination of departments and projects, but only for projects with a budget greater than 400,000.

Display:
department_name | project_name | budget
*/

SELECT
	d.department_name,
    p.project_name,
    p.budget
FROM departments d
CROSS JOIN projects p
WHERE p.budget > 400000;


/*
One last challenge — 5/5 
Write a query that generates every possible department–project combination, but exclude combinations where the department and project belong to the same department.

Display:
department_name | project_name
*/

SELECT
	d.department_name,
    p.project_name
FROM departments d
CROSS JOIN projects p
WHERE d.department_id <> p.department_id;


-- ----------------------------------------------------------------------------------------------------------------------------------------------


# Joining 3 or More Tables

/*
Practice 1/5

Display:
employee_name | project_name
for every employee who is assigned to a project.
*/

SELECT
	e.employee_name,
    p.project_name
FROM employees_j e
JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
JOIN projects p
	ON ep.project_id = p.project_id;
    

/*
Practice 2/5
Display:

employee_name | department_name | project_name
for every employee who is assigned to a project.
*/

SELECT	
	e.employee_name,
    d.department_name,
    p.project_name
FROM employees_j e
JOIN departments d
	ON d.department_id = e.department_id
JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
JOIN projects p
	ON p.project_id = ep.project_id;
    
    
/*
Practice 3/5 
Display: employee_name | project_name | budget
for employees who are assigned to projects with a budget greater than 400,000.
*/

SELECT
	e.employee_name,
    p.project_name,
    p.budget
FROM employees_j e
JOIN employee_projects ep
	ON e.employee_id = ep.employee_id
JOIN projects p
	ON ep.project_id = p.project_id
WHERE p.budget > 400000;


/*
Practice 4/5 
Display: employee_name | project_count
for every employee who is assigned to at least 2 projects.
*/

SELECT
	e.employee_name,
    COUNT(ep.employee_id) AS project_count
FROM employees_j e
JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
GROUP BY e.employee_id
HAVING project_count >= 2;


/*
Practice 5/5 — Final Multi-Table Challenge

Display: department_name | employee_name | project_count

for employees who:
belong to a department
are assigned to projects
are assigned to at least 2 projects
*/

SELECT	
	d.department_name,
    e.employee_name,
    COUNT(ep.employee_id) AS project_count
FROM departments d
JOIN employees_j e
	ON d.department_id = e.department_id
JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
GROUP BY e.employee_id
HAVING project_count >= 2;


-- ----------------------------------------------------------------------------------------------------------------------------------------------


# Mixed JOINs

/*
Mixed JOIN — Practice 1/5

Write a query to display: employee_name, department_name, project_id
Requirements:
Show all employees, even if they don't have a department.
But show only employees who have at least one project assignment.
If an employee's department doesn't exist, department_name should be NULL.
*/

SELECT
	e.employee_name,
    d.department_name,
    ep.project_id
FROM employees_j e
LEFT JOIN departments d
	ON e.department_id = d.department_id
INNER JOIN employee_projects ep
	ON e.employee_id = ep.employee_id;
    
/*
Practice 2/5

Display: employee_name, department_name, project_name
Requirements:
Show all departments, even departments with no employees.
Show employees belonging to those departments.
Show projects only when the employee is actually assigned to that project.
Departments with no employees should still appear.    
*/

SELECT
	e.employee_name,
    d.department_name,
    p.project_name
FROM departments d
LEFT JOIN employees_j e
	ON d.department_id = e.department_id
LEFT JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
LEFT JOIN projects p
	ON p.project_id = ep.project_id;
    
    
/*
Practice 3/5

Display: employee_name, department_name, project_name
Requirements:
Show all employees.
Employees without a department must still appear.
Employees without any project assignment must still appear.
If a project assignment exists, show the project name.
We don't want any project that isn't actually assigned to that employee.
*/

SELECT
	e.employee_name,
    d.department_name,
    p.project_name
FROM employees_j e
LEFT JOIN departments d
	ON d.department_id = e.department_id
LEFT JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
LEFT JOIN projects p
	ON ep.project_id = p.project_id;
    

/*
Practice 4/5 — Mixed JOINs with a condition
Display: department_name, employee_name, project_name
Requirements:
Show all departments.
Show employees belonging to those departments.
But show project information only for employees who are assigned to a project.
Departments with no employees must remain.
Employees without projects should NOT appear.
*/

SELECT
	d.department_name,
    e.employee_name,
    p.project_name
FROM departments d
LEFT JOIN employees_j e
	ON e.department_id = d.department_id
INNER JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
INNER JOIN projects p
	ON ep.project_id = p.project_id;
    
    
/*
Practice 5/5 — Mixed JOIN Challenge

Display: employee_name, department_name, project_name

Requirements:
Show all employees.
Show their department if it exists.
Show their assigned projects if they have any.
Employees with no department OR no project must still appear.
If an employee has multiple projects, show each project on a separate row.
*/

SELECT
	e.employee_name,
    d.department_name,
    p.project_name
FROM employees_j e
LEFT JOIN departments d
	ON d.department_id = e.department_id
LEFT JOIN employee_projects ep
	ON e.employee_id = ep.employee_id
LEFT JOIN projects p
	ON p.project_id = ep.project_id;
    

-- ----------------------------------------------------------------------------------------------------------------------------------------------    
    

# Many-to-Many

/*
Many-to-Many — Practice 1/5

Write a query to display: employee_name, project_name, , role
*/

SELECT
	e.employee_name,
    p.project_name,
    ep.role
FROM employees_j e
INNER JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
INNER JOIN projects p
	ON ep.project_id = p.project_id;
    
/*
Practice 2/5

Using the same three tables, display: employee_name, project_name

But this time, find only employees who are working on 2 or more projects.

Each employee should appear only once, along with their project count: employee_name | project_count
*/

SELECT
	e.employee_name,
    COUNT(ep.employee_id) AS project_count
FROM employees_j e
INNER JOIN employee_projects ep
	ON e.employee_id = ep.employee_id
GROUP BY e.employee_id
HAVING project_count >= 2;

SELECT
    e.employee_name,
    COUNT(ep.project_id) AS project_count,
    GROUP_CONCAT(p.project_name SEPARATOR ', ') AS projects
FROM employees_j e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
JOIN projects p
    ON p.project_id = ep.project_id
GROUP BY e.employee_id
HAVING COUNT(ep.project_id) >= 2;


/*
Many-to-Many — Practice 3/5
Write a query to display: project_name, employee_count

Requirements:
Show each project.
Count how many employees are assigned to each project.
Include projects that have no employees assigned to them.
Sort by employee_count descending.
*/

SELECT
	p.project_name,
    COUNT(ep.employee_id) AS employee_count
FROM projects p
LEFT JOIN employee_projects ep
	ON p.project_id = ep.project_id
LEFT JOIN employees_j e
	ON e.employee_id = ep.employee_id
GROUP BY p.project_id
ORDER BY employee_count DESC;



/*
Practice 4/5
Display: employee_name, project_name, role, assigned_date
But show only assignments where the employee's department is the SAME department as the project.
*/

SELECT
	e.employee_name,
    p.project_name,
    ep.role,
    ep.assigned_date
FROM employees_j e
INNER JOIN employee_projects ep
	ON ep.employee_id = e.employee_id
INNER JOIN projects p
	ON p.project_id = ep.project_id
WHERE e.department_id = p.department_id;


/*
Practice 5 — Final Challenge

Find the departments that have employees working on 2 or more different projects.

Display: department_name, employee_count, project_count

Requirements:
Include only departments that have at least one employee assigned to projects.
employee_count = number of distinct employees working on projects in that department.
project_count = number of distinct projects those employees are working on.
Sort by project_count descending.
*/

SELECT
	d.department_name,
    COUNT(DISTINCT ep.employee_id) AS employee_count,
    COUNT(DISTINCT ep.project_id) AS project_count
FROM departments d
JOIN projects p
	ON d.department_id = p.department_id
JOIN employee_projects ep
	ON ep.project_id = p.project_id
GROUP BY d.department_id
HAVING project_count >= 2;