# -- DATE and TIME Functions --#

USE learning;

CREATE TABLE date_time_practice (
    employee_id INT,
    full_name VARCHAR(50),
    birth_date DATE,
    joining_date DATE,
    login_time TIME,
    last_login DATETIME,
    created_at TIMESTAMP
);

INSERT INTO date_time_practice
(employee_id, full_name, birth_date, joining_date, login_time, last_login)
VALUES
(101, 'Arun', '1998-05-12', '2022-06-15', '09:15:30', '2026-08-31 09:15:30'),
(102, 'Bala', '2000-01-25', '2023-02-10', '10:30:45', '2026-08-30 10:30:45'),
(103, 'Charan', '1997-09-03', '2021-11-20', '08:45:10', '2026-08-29 08:45:10'),
(104, 'Deepak', '1999-12-31', '2024-01-05', '11:20:00', '2026-08-28 11:20:00'),
(105, 'Farhan', '2001-07-18', '2025-03-22', '09:05:25', '2026-08-27 09:05:25'),
(106, 'Girish', '1996-02-29', '2020-08-17', '07:50:15', '2026-08-26 07:50:15');

SELECT * 
FROM date_time_practice;

# CURDATE() and CURRENT_DATE() : Returns the current date.
SELECT CURDATE();

SELECT 
    CURDATE() AS today;

SELECT CURRENT_DATE() AS today;

# CURTIME() and CURRENT_TIME() : Returns the current time.
SELECT CURTIME() AS curr_time;
SELECT CURRENT_TIME()  AS curr_time;

# NOW() : returns both date and time.
SELECT NOW();

-- Display every employee's name along with today's date.
SELECT
	full_name,
	CURDATE() AS today
FROM date_time_practice;

-- Display: full_name | login_time | current_time
SELECT
	full_name,
    login_time,
    CURTIME() AS curr_time
FROM date_time_practice;

-- Display: full_name | last_login | current_datetime
SELECT
	full_name,
    last_login,
    NOW() AS current_datetime
FROM date_time_practice;



# YEAR() : Returns the year from a date.
SELECT YEAR('2024-01-05');


SELECT
	full_name,
    joining_date,
	YEAR(joining_date) AS joining_year
FROM date_time_practice;


# MONTH() : Returns the month as a number from 1–12.

SELECT MONTH('2024-12-12');

SELECT
	full_name,
    joining_date,
    MONTH(joining_date) AS joining_month
FROM date_time_practice;


# DAY() : Returns the day of the month.
SELECT DAY('2024-01-05');

SELECT
    full_name,
    joining_date,
    DAY(joining_date) AS joining_day
FROM date_time_practice;



SELECT
	full_name,
    birth_date,
    YEAR(birth_date) AS birth_year,
    MONTH(birth_date) AS birth_month,
    DAY(birth_date) AS birth_day
FROM date_time_practice;
    

-- Find all employees who joined in 2024.
SELECT
	full_name
FROM date_time_practice
WHERE YEAR(joining_date) = '2024';


-- Find all employees who were born in January, regardless of their birth year.
SELECT
	full_name
FROM date_time_practice
WHERE MONTH(birth_date) = 1;


-- ================================================================================================================= --
##       DAY and WEEK functions       ##

# DAYOFMONTH() -> It gives the day within the month
SELECT DAYOFMONTH('2026-09-04');

# DAYOFWEEK() -> It tells you which day of the week the date represents.
/*
The result is a number from 1 to 7:
| Number | Day       |
| -----: | --------- |
|      1 | Sunday    |
|      2 | Monday    |
|      3 | Tuesday   |
|      4 | Wednesday |
|      5 | Thursday  |
|      6 | Friday    |
|      7 | Saturday  |

*/
SELECT DAYOFMONTH('2006-08-30');

# WEEKDAY() : WEEKDAY() also tells you the day of the week, but the numbering is different
/*
| Number | Day       |
| -----: | --------- |
|      0 | Monday    |
|      1 | Tuesday   |
|      2 | Wednesday |
|      3 | Thursday  |
|      4 | Friday    |
|      5 | Saturday  |
|      6 | Sunday    |
*/
SELECT WEEKDAY('2026-09-04');
SELECT WEEKDAY('2026-09-04');

# DAYOFYEAR() : This tells you which day of the year it is.
SELECT DAYOFYEAR('2026-01-01'); -- -> 1
SELECT DAYOFYEAR('2026-12-31'); -- -> 365

# QUARTER() : 
/*
A year is divided into four quarters:

Q1 → January - March
Q2 → April - June
Q3 → July - September
Q4 → October - December
*/

SELECT QUARTER('2026-09-04'); -- -> 3


# WEEK() : This tells you the week number of a date.
SELECT WEEK('2026-09-04');


-- Find employees who joined on Saturday or Sunday.
SELECT 
	full_name
FROM date_time_practice
WHERE WEEKDAY(joining_date) IN (5, 6);

SELECT dayofweek('2006-08-30');
SELECT weekday('2006-08-30');


-- ================================================================================================================= --

# Extracting Time Components

# HOUR() : Returns the hour.
SELECT HOUR('14:35:42');

SELECT
    full_name,
    login_time,
    HOUR(login_time) AS login_hour
FROM date_time_practice;


# MINUTE() : Returns the minute
SELECT MINUTE('14:35:42');

SELECT
    full_name,
    login_time,
    MINUTE(login_time) AS login_minute
FROM date_time_practice;


# SECOND() : Returns the seconds:
SELECT SECOND('14:35:42');

SELECT
    full_name,
    login_time,
    SECOND(login_time) AS login_second
FROM date_time_practice;


-- MySQL will extract the time portion from the DATETIME.
SELECT
    full_name,
    last_login,
    HOUR(last_login) AS login_hour,
    MINUTE(last_login) AS login_minute,
    SECOND(last_login) AS login_second
FROM date_time_practice;


-- ================================================================================================================= --
# DATE_FORMAT()
/*
DATE_FORMAT(date, format)
*/

SELECT DATE_FORMAT('2024-01-05', '%d-%m-%Y');

/*
%d → day
%m → month
%Y → four-digit year
%y → 2-digit year
*/
SELECT DATE_FORMAT('2024-01-05', '%y');

/*
%m → month number with leading zero
%c → month number without leading zero
%M → full month name
%b → abbreviated month name
*/

SELECT
    DATE_FORMAT('2024-01-05', '%m'),
    DATE_FORMAT('2024-01-05', '%c'),
    DATE_FORMAT('2024-01-05', '%M'),
    DATE_FORMAT('2024-01-05', '%b');
    
/*
%W → full weekday name
%a → abbreviated weekday name
*/

SELECT DATE_FORMAT('2024-01-05', '%W');
SELECT DATE_FORMAT('2024-01-05', '%a');


-- Display: full_name | joining_date | formatted_date  (05-01-2024)
SELECT
	full_name,
    joining_date,
    DATE_FORMAT(joining_date, '%d-%m-%Y') AS formatted_date
FROM date_time_practice;


-- full_name | birth_date | formatted_birth_date  (05 January 1999)
SELECT
	full_name,
    birth_date,
    DATE_FORMAT(birth_date, '%d %M %Y') AS formatted_birth_date
FROM date_time_practice;

-- Display : full_name | joining_date | day_name (Monday)
SELECT 
	full_name,
    joining_date,
	DATE_FORMAT(joining_date, '%W') AS day_name
FROM date_time_practice;

-- Display : full_name | joining_date | formatted_date (Friday, 05 January 2024)
SELECT
	full_name,
    joining_date,
    DATE_FORMAT(joining_date, '%W, %d %M %Y') AS formatted_date
FROM date_time_practice;


-- ================================================================================================================= --
# TIME_FORMAT()
/*
TIME_FORMAT(time, format)
*/

/*
| Specifier | Meaning     | Example |
| --------- | ----------- | ------- |
| `%H`      | Hour, 00–23 | `09`    |
| `%h`      | Hour, 01–12 | `09`    |
| `%i`      | Minutes     | `15`    |
| `%s`      | Seconds     | `30`    |
| `%p`      | AM/PM       | `AM`    |
*/

SELECT TIME_FORMAT('09:15:30', '%H:%i:%s');

SELECT TIME_FORMAT(login_time, '%H:%i:%s') FROM date_time_practice;


-- Display: full_name | login_time | formatted_time  (09:15:30)
SELECT
	full_name,
    login_time,
    TIME_FORMAT(login_time, '%H:%i:%s') AS formatted_time
FROM date_time_practice;


-- Display the login time in 12-hour format with AM/PM (09:15:30 AM)
SELECT
	TIME_FORMAT(login_time, '%h:%i:%s %p') 
FROM date_time_practice;


-- Display : full_name | last_login | formatted_time (09:15 AM)
SELECT
	full_name,
    last_login,
    TIME_FORMAT(last_login, '%h:%i %p')
FROM date_time_practice;



-- ================================================================================================================= --
# DATE() and TIME()

/*
DATETIME
   ↓
 ┌───────────────┐
 │ 2026-08-31    │ → DATE()
 │    09:15:30   │ → TIME()
 └───────────────┘
*/

SELECT
    full_name,
    last_login,
    DATE(last_login) AS login_date,
    TIME(last_login) AS login_time
FROM date_time_practice;

-- * DATE() returns an actual DATE value
-- * DATE_FORMAT() Returns a formatted string.
-- * They may look identical: (2026-08-31) but conceptually they're different.




-- ================================================================= Date Arithmetic -- =================================================================

# 1. DATE_ADD()
/*
DATE_ADD(date, INTERVAL value unit)
*/

SELECT DATE_ADD('2026-09-04', INTERVAL 10 DAY);
/*
Differnet units
DAY
WEEK
MONTH
YEAR
HOUR
MINUTE
SECOND
*/
SELECT DATE_ADD('2026-09-04', INTERVAL 10 WEEK);


# 2. DATE_SUB()
/*
DATE_SUB(date, INTERVAL value unit)
*/

SELECT DATE_SUB('2026-09-04', INTERVAL 10 DAY);

SELECT
	full_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 1 YEAR) as one_year_later
FROM date_time_practice;

SELECT
    full_name,
    joining_date,
    joining_date + INTERVAL 30 DAY AS after_30_days
FROM date_time_practice;


SELECT
    full_name,
    joining_date,
    joining_date - INTERVAL 30 DAY AS after_30_days
FROM date_time_practice;


-- PRACTICE QUESTIONS
-- 1. full_name | joining_date | after_30_days
SELECT 
	full_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 30 DAY) AS after_30_days
FROM date_time_practice;

SELECT
	full_name,
    joining_date,
    joining_date + INTERVAL 30 DAY AS after_30_days
FROM date_time_practice;


-- 2. full_name | joining_date | after_6_months
SELECT
	full_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 6 MONTH) as after_6_months
FROM date_time_practice;


-- 3. full_name | joining_date | after_1_year
SELECT
	full_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 1 YEAR) as after_1_year
FROM date_time_practice;

-- 4. full_name | joining_date | before_90_days
SELECT
	full_name,
    joining_date,
    DATE_SUB(joining_date, INTERVAL 90 DAY) as before_90_days
FROM date_time_practice;


-- 5. Find employees whose 1-year joining anniversary occurs before: CURDATE()
SELECT *
FROM date_time_practice
WHERE CURDATE() > DATE_ADD(joining_date, INTERVAL 1 YEAR);

-- 6. Find employees whose NEXT joining anniversary is before today.
SELECT
    full_name,
    joining_date,
    CASE
        WHEN DATE_FORMAT(joining_date, '%m-%d') >= DATE_FORMAT(CURDATE(), '%m-%d')
        THEN STR_TO_DATE(
            CONCAT(YEAR(CURDATE()), '-', DATE_FORMAT(joining_date, '%m-%d')),
            '%Y-%m-%d'
        )
        ELSE STR_TO_DATE(
            CONCAT(YEAR(CURDATE()) + 1, '-', DATE_FORMAT(joining_date, '%m-%d')),
            '%Y-%m-%d'
        )
    END AS next_anniversary
FROM date_time_practice;




# DATEDIFF()
/*
DATEDIFF(date1, date2)
*/

SELECT DATEDIFF('2026-09-10', '2026-09-01');

SELECT DATEDIFF('2026-09-01', '2026-09-10');

-- 1. full_name | joining_date | days_since_joining
SELECT
	full_name,
    joining_date,
    DATEDIFF(CURDATE(), joining_date) AS days_since_joining
FROM date_time_practice;

-- 2. Find employees who have been working for more than 1000 days.
SELECT
	full_name
FROM date_time_practice
WHERE DATEDIFF(CURDATE(), joining_date) > 1000;


-- 3. Find employees who joined within the last 1000 days.
SELECT
	full_name,
    joining_date
FROM date_time_practice
WHERE joining_date >= (DATE_SUB(CURDATE(), INTERVAL 1000 DAY));

SELECT
	full_name,
    joining_date
FROM date_time_practice
WHERE DATEDIFF(CURDATE(), joining_date) <= 1000;

-- 4. full_name | birth_date | age_in_days
SELECT
	full_name,
	birth_date,
	DATEDIFF(CURDATE(), birth_date) AS age_in_days
 FROM date_time_practice;
 
 -- 5. Find the employee who has been with the company for the longest number of days.
 SELECT
	full_name,
    joining_date
FROM date_time_practice
ORDER BY joining_date ASC
LIMIT 1;


# TIMESTAMPDIFF()
/*
TIMESTAMPDIFF(unit, start_date, end_date)
*/

SELECT TIMESTAMPDIFF(
    YEAR,
    '1998-05-12',
    CURDATE()
);

/*
YEAR
MONTH
DAY
HOUR
MINUTE
SECOND
*/

-- Practice Questions
-- 1. Calculate employee age in complete years
SELECT
	full_name,
    birth_date,
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age_in_years
FROM date_time_practice;

-- 2. Calculate employment duration in years
SELECT
	full_name,
    joining_date,
	TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) as years_worked
FROM date_time_practice;


-- 3. Calculate duration in months
SELECT
	full_name,
    joining_date,
    TIMESTAMPDIFF(MONTH, joining_date, CURDATE()) AS months_worked
FROM date_time_practice;


-- 4. Calculate duration in days
SELECT 
	full_name,
    joining_date,
    TIMESTAMPDIFF(DAY, joining_date, CURDATE()) AS days_worked
FROM date_time_practice;


SELECT TIMESTAMPDIFF(
    HOUR,
    '2026-09-10 09:15:30',
    '2026-09-10 17:45:30'
);

SELECT TIMESTAMPDIFF(
    MINUTE,
    '2026-09-10 09:15:30',
    '2026-09-10 17:45:30'
);

SELECT TIMESTAMPDIFF(
    SECOND,
    '2026-09-10 09:15:30',
    '2026-09-10 17:45:30'
);


-- 5. Find employees who have worked for at least 3 complete years.
SELECT
	full_name,
    joining_date
FROM date_time_practice
WHERE TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) >= 3;


-- 6. Find employees who have worked for less than 3 complete years.
SELECT
	full_name,
    joining_date
FROM date_time_practice
WHERE TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) < 3;





# TIMEDIFF()

/*
TIMEDIFF(time1, time2)
*/

SELECT TIMEDIFF('17:45:30', '09:15:30');

SELECT TIMEDIFF(CURDATE(), joining_date) FROM date_time_practice;

ALTER TABLE date_time_practice
ADD COLUMN logout_time TIME;

UPDATE date_time_practice
SET logout_time = CASE employee_id
    WHEN 101 THEN '17:45:30'
    WHEN 102 THEN '18:15:00'
    WHEN 103 THEN '16:30:15'
    WHEN 104 THEN '19:00:00'
    WHEN 105 THEN '17:30:45'
    WHEN 106 THEN '16:15:30'
END;


SELECT
    full_name,
    login_time,
    logout_time
FROM date_time_practice;


-- Practice Problems
-- 1. full_name | login_time | logout_time | working_duration
SELECT
    full_name,
    login_time,
    logout_time,
    TIMEDIFF(logout_time, login_time) AS working_duration
FROM date_time_practice;


-- 2. Find employees who worked more than 8 hours.
SELECT full_name
FROM date_time_practice
WHERE TIMEDIFF(logout_time, login_time) > '08:00:00';

-- 3. Find employees who worked exactly 8 hours.
SELECT full_name
FROM date_time_practice
WHERE TIMEDIFF(logout_time, login_time) = '08:00:00';

-- 4. Find employees who worked less than 8 hours.
SELECT full_name
FROM date_time_practice
WHERE TIMEDIFF(logout_time, login_time) < '08:00:00';

-- 5. full_name | working_duration  => and sort employees by longest working duration first.
SELECT
	full_name,
    TIMEDIFF(logout_time, login_time) AS working_duration
FROM date_time_practice
ORDER BY working_duration DESC;

-- 6. Using TIMESTAMPDIFF(), calculate the total number of minutes worked.
SELECT
	full_name,
	TIMESTAMPDIFF(MINUTE, login_time, logout_time) AS minutes_worked
FROM date_time_practice;


# TIME_TO_SEC() -> TIME_TO_SEC() converts a TIME value into total seconds.
SELECT TIME_TO_SEC('08:30:00');

SELECT
    full_name,
    TIME_TO_SEC(
        TIMEDIFF(logout_time, login_time)
    ) / 60 AS minutes_worked
FROM date_time_practice;

SELECT
    full_name,
    TIME_TO_SEC(
        TIMEDIFF(logout_time, login_time)
    ) / 3600 AS hours_worked
FROM date_time_practice;