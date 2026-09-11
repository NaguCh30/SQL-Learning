-- ==================================== Conditional Logic ==================================== --

CREATE TABLE employees_conditional (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    experience_years INT,
    performance_score INT,
    age INT,
    bonus DECIMAL(10,2),
    employment_status VARCHAR(20)
);

INSERT INTO employees_conditional
(employee_id, employee_name, department, salary, experience_years,
 performance_score, age, bonus, employment_status)
VALUES
(1, 'Rahul', 'IT', 65000, 2, 78, 24, 5000, 'Active'),
(2, 'Priya', 'HR', 52000, 4, 91, 29, 8000, 'Active'),
(3, 'Arjun', 'IT', 85000, 7, 88, 34, 10000, 'Active'),
(4, 'Sneha', 'Finance', 72000, 5, 67, 31, NULL, 'Active'),
(5, 'Vikram', 'Sales', 48000, 1, 55, 23, 3000, 'Active'),
(6, 'Anjali', 'IT', 95000, 10, 96, 38, 15000, 'Active'),
(7, 'Kiran', 'HR', 45000, 2, 72, 26, NULL, 'Active'),
(8, 'Meena', 'Finance', 68000, 3, 84, 28, 6000, 'Active'),
(9, 'Ravi', 'Sales', 58000, 6, 63, 35, 4000, 'On Leave'),
(10, 'Divya', 'IT', 78000, 4, 89, 30, 9000, 'Active'),
(11, 'Suresh', 'Sales', 42000, 1, 48, 22, NULL, 'Active'),
(12, 'Neha', 'Finance', 88000, 8, 93, 36, 12000, 'Active'),
(13, 'Amit', 'IT', 55000, 3, 74, 27, 5000, 'On Leave'),
(14, 'Pooja', 'HR', 61000, 5, 81, 32, 7000, 'Active'),
(15, 'Manoj', 'Sales', 70000, 9, 87, 40, 11000, 'Active');

SELECT *
FROM employees_conditional;

/*
-- What is comditional logic?
-- If a condition is true, do one thing; otherwise, do something else.

For example:

If salary is greater than 70000 → "High Salary"
Otherwise → "Normal Salary"
*/


# IF()
/*
IF(condition, value_if_true, value_if_false)
*/

SELECT
	employee_name,
    salary,
    IF(salary >= 70000, 'High Salary', 'Low Salary') AS salary_category
FROM employees_conditional;


-- Give a 10% salary increase if performance score ≥ 90. Otherwise, give 5%.
SELECT
    employee_name,
    salary,
    performance_score,
    IF(
        performance_score >= 90,
        salary * 1.10,
        salary * 1.05
    ) AS revised_salary
FROM employees_conditional;



/*
Question 1

Display: employee_name, salary, a new column called salary_status

Rules: salary >= 60000 → 'Eligible', otherwise       → 'Not Eligible'
*/
SELECT 
	employee_name, 
    salary,
    IF(salary >= 60000, 'Eligible', 'Not Eligible') AS salary_status
FROM employees_conditional;


/*
Question 2
Display: employee_name, performance_score, a new column called performance_status

Rules: performance_score >= 80 → 'Good', otherwise               → 'Needs Improvement'
*/

SELECT 
	employee_name,
    performance_score,
    IF(performance_score >= 80, 'Good', 'Needs Improvement') AS performance_status
FROM employees_conditional;


/*
Question 3
Display: employee_name, experience_years, a new column called experience_status

Rules:
experience_years >= 5 → 'Experienced', otherwise             → 'Fresher/Junior'
*/

SELECT
	employee_name,
    experience_years,
    IF(experience_years >= 5, 'Experienced', 'Fresher/Junior') AS experience_status
FROM employees_conditional;

/*
Question 4 

Display: employee_name, salary, bonus, a new column called bonus_status

Rules:
bonus >= 8000 → 'High Bonus' otherwise     → 'Low Bonus'
*/

SELECT
	employee_name,
    salary,
    bonus,
    IF(bonus >= 8000, 'High Bonus', 'Low Bonus') AS bonus_status
FROM employees_conditional;

/*
Question 5

An employee is eligible for a Senior Position if:
experience_years >= 5 AND performance_score >= 80

Display:
employee_name, experience_years, performance_score, position_status

Expected values:
'Senior Position', 'Regular Position'
*/

SELECT
	employee_name,
    experience_years,
    performance_score,
    IF(
		experience_years >= 5 AND performance_score >= 80,
        'Senior Position',
        'Regular Position'
    ) AS position_status
FROM employees_conditional;


/*
Question 6

An employee gets a Special Bonus if:
salary >= 80000 OR performance_score >= 95

Display:
employee_name, salary, performance_score, bonus_eligibility

Expected values:
'Special Bonus', 'Normal Bonus'
*/

SELECT	
	employee_name, salary, performance_score, 
	IF(
		salary >= 80000 OR performance_score >= 95,
        'Special Bonus', 'Normal Bonus'
    ) AS bonus_eligibility
FROM employees_conditional;




# CASE (Searced Case)
/*
If IF() is useful for one condition, CASE becomes much more powerful when you have multiple conditions.

Think of it like:
IF condition 1 → result 1
ELSE IF condition 2 → result 2
ELSE IF condition 3 → result 3
ELSE → default result

SYNTAX:
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN condition3 THEN result3
    ELSE default_result
END
*/



SELECT
    employee_name,
    performance_score,
    CASE
        WHEN performance_score >= 90 THEN 'Excellent'
        WHEN performance_score >= 80 THEN 'Good'
        WHEN performance_score >= 70 THEN 'Average'
        ELSE 'Poor'
    END AS performance_category
FROM employees_conditional;


/*
Q9
Classify employees based on salary:

salary >= 90000 → 'Very High'
salary >= 70000 → 'High'
salary >= 50000 → 'Medium'
otherwise       → 'Low'

Display: employee_name, salary, salary_category
*/

SELECT	
	employee_name,
    salary,
    CASE	
		WHEN salary >= 90000 THEN 'Very High'
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
	END AS salary_category
FROM employees_conditional;


/*
Q10
Classify employees based on experience:

experience >= 8 → 'Senior'
experience >= 5 → 'Mid-Level'
experience >= 3 → 'Junior'
otherwise       → 'Entry-Level'

Display: employee_name, experience_years, experience_level
*/

SELECT
	employee_name, experience_years,
    CASE	
		WHEN experience_years >= 8 THEN 'Senior'
        WHEN experience_years >= 5 THEN 'Mid-Level'
        WHEN experience_years >= 3 THEN 'Junior'
        ELSE 'Entry-Level'
	END AS experience_level
FROM employees_conditional;


/*
Q11
Classify performance:

score >= 90 → 'Excellent'
score >= 80 → 'Good'
score >= 70 → 'Average'
score >= 60 → 'Below Average'
otherwise   → 'Poor'

Display: employee_name, performance_score, performance_category
*/

SELECT 
	employee_name, performance_score,
    CASE
		WHEN performance_score >= 90 THEN 'Excellent'
        WHEN performance_score >= 80 THEN 'Good'
        WHEN performance_score >= 70 THEN 'Average'
        WHEN performance_score >= 60 THEN 'Below Average'
        ELSE 'Poor'
	END AS performance_category
FROM employees_conditional;



# CASE (Simple Case)
/*
Instead of writing a condition each time, you give CASE a column/expression, and compare its value against different values.
*/

SELECT
    employee_name,
    department,
    CASE department
        WHEN 'IT' THEN 'Technology'
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'Finance' THEN 'Financial Services'
        WHEN 'Sales' THEN 'Sales & Marketing'
        ELSE 'Other'
    END AS department_group
FROM employees_conditional;


/*
Q12
Using department, create a column called department_type.
Rules:
IT       → 'Technical'
HR       → 'Human Resources'
Finance  → 'Financial'
Sales    → 'Business Development'

Display: employee_name, department, department_type
*/

SELECT
	employee_name, department,
    CASE department
		WHEN 'IT' THEN 'Technical'
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'Finance' THEN 'Financial'
        WHEN 'Sales' THEN 'Business Development'
        ELSE 'Unknown'
	END AS department_type
FROM employees_conditional;


/*
Q13
Using employment_status, create a column called status_message.

Rules:
Active    → 'Currently Working'
On Leave  → 'Currently Away'
Display: employee_name, employment_status, status_message
*/

SELECT
	employee_name, employment_status,
    CASE employment_status
		WHEN 'Active' THEN 'Currently Working'
        WHEN 'On Leave' THEN 'Currently Away'
        ELSE 'Unknown'
	END AS status_message
FROM employees_conditional;


SELECT
    employee_name,
    bonus,
    CASE
        WHEN bonus IS NULL THEN 'No Bonus'
        ELSE 'Bonus Available'
    END AS bonus_status
FROM employees_conditional;


SELECT
    employee_name,
    salary,
    performance_score,
    salary +
    CASE
        WHEN performance_score >= 90 THEN salary * 0.20
        WHEN performance_score >= 80 THEN salary * 0.10
        ELSE salary * 0.05
    END AS salary_with_incentive
FROM employees_conditional;



# CASE + Aggregate Functions

-- How many employees have a performance score of 80 or above?
SELECT
    SUM(
        CASE
            WHEN performance_score >= 80 THEN 1
            ELSE 0
        END
    ) AS good_performers
FROM employees_conditional;


SELECT COUNT(performance_score) AS good_performers
FROM employees_conditional
WHERE performance_score >= 80;


# COUNT() + CASE

SELECT
    COUNT(
        CASE
            WHEN performance_score >= 80 THEN 1
        END
    ) AS good_performers
FROM employees_conditional;