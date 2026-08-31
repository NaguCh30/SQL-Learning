# -- Numeric Functions -- #


CREATE TABLE numeric_practice (
    employee_id INT,
    full_name VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    performance_score DECIMAL(5,2),
    experience_years DECIMAL(4,2),
    distance_km DECIMAL(8,2)
);

INSERT INTO numeric_practice
(employee_id, full_name, salary, bonus, performance_score, experience_years, distance_km)
VALUES
(101, 'Ravi', 45678.567, 3250.75, 87.456, 3.75, 12.68),
(102, 'Anita', 52345.891, 4125.50, 92.783, 5.50, 8.25),
(103, 'Kiran', 38765.234, 2750.25, 76.349, 2.25, 15.91),
(104, 'Priya', 61234.789, 5250.80, 95.678, 7.75, 5.42),
(105, 'Arjun', 48999.456, 3500.40, 81.234, 4.50, 10.73),
(106, 'Sneha', 55432.678, 4675.65, 89.567, 6.25, 7.89),
(107, 'Vikram', 42123.345, 2980.35, 73.891, 1.75, 18.46),
(108, 'Neha', 67890.123, 6125.90, 97.345, 9.50, 3.67);

SELECT * FROM numeric_practice;

# ROUND() -> ROUND(number, decimal_places)
SELECT ROUND(123.4567, 2);


SELECT
	full_name,
    performance_score,
    ROUND(performance_score, 1) AS rounded_score
FROM numeric_practice;


-- Display each employee's name, salary, and salary rounded to the nearest thousand.
SELECT
	full_name,
    salary,
    ROUND(salary, -3) AS nearest_thousand
FROM numeric_practice;


# CEIL() and FLOOR()
-- CEIL() returns the smallest integer that is greater than or equal to the number.
-- FLOOR() returns the largest integer that is less than or equal to the number.
SELECT CEIL(12.34);
SELECT FLOOR(12.34);

SELECT
	full_name,
    distance_km,
    CEIL(distance_km) AS rounded_up
FROM numeric_practice;

SELECT
	full_name,
    distance_km,
    CEIL(distance_km) rounded_up,
    FLOOR(distance_km) rounded_down
FROM numeric_practice;


# TRUNCATE() : It simply cuts off the extra decimal digits. -> TRUNCATE(number, decimal_places)
SELECT TRUNCATE(12.678, 2); -- -> 12.67

SELECT
	full_name,
    salary,
    ROUND(salary, 1) AS rounded_salary,
    TRUNCATE(salary, 2) AS truncated_salary
FROM numeric_practice;


# ABS() : It returns the absolute value of a number — essentially removing the negative sign.

ALTER TABLE numeric_practice
ADD adjustment DECIMAL(10,2);

UPDATE numeric_practice
SET adjustment = -250.75
WHERE employee_id = 101;

UPDATE numeric_practice
SET adjustment = 150.50
WHERE employee_id = 102;

UPDATE numeric_practice
SET adjustment = -75.25
WHERE employee_id = 103;

SELECT 
	full_name,
    adjustment,
    ABS(adjustment) AS absolute_adjustment
FROM numeric_practice;


# MOD() : Finding the Remainder -> MOD(number, divisor)
SELECT MOD(10, 3);

SELECT MOD(3, 10);

SELECT
	employee_id,
    full_name,
    MOD(employee_id, 2) remainder
FROM numeric_practice;


# POWER() : It raises a number to a specified power. -> POWER(number, exponent)
SELECT POWER(2, 3);
SELECT POW(2, 3);

SELECT
	full_name,
    performance_score,
    POWER(performance_score, 2) AS score_squared
FROM numeric_practice;


# SQRT() : returns the square root of a number.
SELECT SQRT(25);

SELECT
	full_name,
    performance_score,
    ROUND(SQRT(performance_score), 2) AS score_root
FROM numeric_practice;


# SIGN() : tells you whether a number is negative, zero, or positive.
SELECT SIGN(-10); -- -> -1
SELECT SIGN(10); -- -> 1
SELECT SIGN(0); -- -> 0


SELECT 
	full_name,
    adjustment,
    SIGN(adjustment) AS adjustment_sign
FROM numeric_practice;



SELECT
	ROUND(salary + bonus, 2) AS rounded
FROM numeric_practice;

SELECT
	full_name,
    salary,
    bonus,
    salary + bonus AS total_compensation,
    ROUND(salary + bonus, 2) AS rounded_compensation
FROM numeric_practice;


SELECT
	employee_id,
    full_name,
    MOD(employee_id, 2) AS remainder,
    IF(MOD(employee_id, 2) = 0, 'Even', 'Odd') AS type
FROM numeric_practice;


# RAND() : generates a random decimal number between 0 and 1.
SELECT RAND();
SELECT ROUND(RAND() * 10);
SELECT FLOOR(1 + RAND() * 100);

SELECT
	employee_id,
    full_name,
    FLOOR(1 + RAND() * 100) AS random_number
FROM numeric_practice;


# GREATEST() : returns the largest value among multiple values. -> GREATEST(value1, value2, value3, ...)
SELECT GREATEST(10, 25, 7, 18);

SELECT
	full_name,
    salary,
    bonus,
    performance_score,
    GREATEST(salary, bonus, performance_score) AS greater_amount
FROM numeric_practice;


# LEAST() : It returns the smallest value among multiple values.
SELECT LEAST(10, 25, 7, 18);

SELECT 
	full_name,
	salary,
    bonus,
    performance_score,
    LEAST(salary, bonus, performance_score) AS smallest_value
FROM numeric_practice;