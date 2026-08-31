USE learning;

CREATE TABLE string_practice (
    employee_id INT,
    full_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(30),
    city VARCHAR(30),
    phone VARCHAR(15),
    job_title VARCHAR(50)
);

INSERT INTO string_practice
(employee_id, full_name, email, department, city, phone, job_title)
VALUES
(101, 'Ravi Kumar', 'ravi.kumar@gmail.com', 'IT', 'Hyderabad', '9876543210', 'Software Engineer'),
(102, 'Anil Sharma', 'anil.sharma@yahoo.com', 'HR', 'Chennai', '9876543211', 'HR Executive'),
(103, 'Priya Reddy', 'priya.reddy@gmail.com', 'Finance', 'Bangalore', '9876543212', 'Financial Analyst'),
(104, 'John Peter', 'john.peter@outlook.com', 'IT', 'Mumbai', '9876543213', 'Backend Developer'),
(105, 'Sneha Rao', 'sneha.rao@gmail.com', 'Marketing', 'Hyderabad', '9876543214', 'Marketing Executive'),
(106, 'Kiran Kumar', 'kiran.kumar@yahoo.com', 'Sales', 'Delhi', '9876543215', 'Sales Executive'),
(107, 'Ayesha Khan', 'ayesha.khan@gmail.com', 'HR', 'Mumbai', '9876543216', 'Recruiter'),
(108, 'Rahul Verma', 'rahul.verma@outlook.com', 'IT', 'Pune', '9876543217', 'Software Developer'),
(109, 'Meena Das', 'meena.das@gmail.com', 'Finance', 'Kolkata', '9876543218', 'Accountant'),
(110, 'Arjun Reddy', 'arjun.reddy@yahoo.com', 'IT', 'Hyderabad', '9876543219', 'DevOps Engineer'),
(111, 'Suresh Babu', 'suresh.babu@gmail.com', 'Operations', 'Chennai', '9876543220', 'Operations Manager'),
(112, 'Divya Sharma', 'divya.sharma@outlook.com', 'Marketing', 'Delhi', '9876543221', 'Content Writer'),
(113, 'Vikram Singh', 'vikram.singh@gmail.com', 'Sales', 'Pune', '9876543222', 'Sales Manager'),
(114, 'Neha Gupta', 'neha.gupta@yahoo.com', 'Finance', 'Mumbai', '9876543223', 'Financial Advisor'),
(115, 'Manoj Kumar', 'manoj.kumar@gmail.com', 'IT', 'Bangalore', '9876543224', 'Database Administrator'),
(116, 'Pooja Nair', 'pooja.nair@outlook.com', 'HR', 'Kochi', '9876543225', 'HR Manager'),
(117, 'Aditya Rao', 'aditya.rao@gmail.com', 'IT', 'Hyderabad', '9876543226', 'Frontend Developer'),
(118, 'Swathi Reddy', 'swathi.reddy@yahoo.com', 'Finance', 'Vijayawada', '9876543227', 'Account Executive'),
(119, 'Naveen Kumar', 'naveen.kumar@gmail.com', 'Operations', 'Chennai', '9876543228', 'Operations Executive'),
(120, 'Lakshmi Devi', 'lakshmi.devi@outlook.com', 'HR', 'Hyderabad', '9876543229', 'Training Manager'),
(121, 'Rajesh Patel', 'rajesh.patel@gmail.com', 'Sales', 'Ahmedabad', '9876543230', 'Sales Executive'),
(122, 'Harini Rao', 'harini.rao@yahoo.com', 'IT', 'Bangalore', '9876543231', 'QA Engineer'),
(123, 'Vijay Kumar', 'vijay.kumar@gmail.com', 'IT', 'Pune', '9876543232', 'System Engineer'),
(124, 'Deepika Sharma', 'deepika.sharma@outlook.com', 'Marketing', 'Mumbai', '9876543233', 'Brand Manager'),
(125, 'Mohammed Ali', 'mohammed.ali@gmail.com', 'Operations', 'Hyderabad', '9876543234', 'Operations Analyst'),
(126, 'Sanjay Verma', 'sanjay.verma@yahoo.com', 'Finance', 'Delhi', '9876543235', 'Senior Accountant'),
(127, 'Kavya Reddy', 'kavya.reddy@gmail.com', 'IT', 'Vijayawada', '9876543236', 'Data Analyst'),
(128, 'Gautham Krishna', 'gautham.krishna@outlook.com', 'IT', 'Chennai', '9876543237', 'Cloud Engineer'),
(129, 'Isha Kapoor', 'isha.kapoor@gmail.com', 'HR', 'Delhi', '9876543238', 'HR Executive'),
(130, 'Rohit Mehta', 'rohit.mehta@yahoo.com', 'Sales', 'Mumbai', '9876543239', 'Business Development Executive'),
(131, 'Sandeep Reddy', 'sandeep.reddy@gmail.com', 'IT', 'Hyderabad', '9876543240', 'Technical Lead'),
(132, 'Ananya Rao', 'ananya.rao@outlook.com', 'Marketing', 'Bangalore', '9876543241', 'Marketing Manager'),
(133, 'Prakash Kumar', 'prakash.kumar@gmail.com', 'Finance', 'Chennai', '9876543242', 'Finance Manager'),
(134, 'Keerthi Nair', 'keerthi.nair@yahoo.com', 'HR', 'Kochi', '9876543243', 'Recruitment Specialist'),
(135, 'Varun Sharma', 'varun.sharma@gmail.com', 'IT', 'Pune', '9876543244', 'Full Stack Developer'),
(136, 'Madhavi Reddy', 'madhavi.reddy@outlook.com', 'Finance', 'Hyderabad', '9876543245', 'Senior Financial Analyst'),
(137, 'Tarun Singh', 'tarun.singh@gmail.com', 'Operations', 'Delhi', '9876543246', 'Operations Coordinator'),
(138, 'Bhavya Patel', 'bhavya.patel@yahoo.com', 'Sales', 'Ahmedabad', '9876543247', 'Sales Coordinator'),
(139, 'Chaitanya Rao', 'chaitanya.rao@gmail.com', 'IT', 'Bangalore', '9876543248', 'Software Architect'),
(140, 'Nithin Kumar', 'nithin.kumar@outlook.com', 'Marketing', 'Hyderabad', '9876543249', 'Digital Marketing Specialist');


SELECT *
FROM string_practice;


SELECT COUNT(*)
FROM string_practice;


DESC string_practice;


# 1. LENGTH() : It returns the number of bytes in the string.

SELECT full_name, LENGTH(full_name) AS name_length
FROM string_practice;


-- Find employees whose full name contains more than 10 bytes.
SELECT * 
FROM string_practice
WHERE LENGTH(full_name) > 10;


# 2. CHAR_LENGTH() : This returns the number of characters, rather than bytes.
SELECT 
    LENGTH('你好') AS bytes,
    CHAR_LENGTH('你好') AS characters;


SELECT 
    LENGTH('ABC') AS a,
    LENGTH('A B C') AS b,
    LENGTH('') AS c,
    LENGTH('   ') AS d;
    

-- sort the employees from longest name to shortest name.
SELECT full_name, LENGTH(full_name) AS name_length
FROM string_practice
ORDER BY LENGTH(full_name) DESC;


# UPPER() and LOWER()

-- These are simple functions, but we'll use them to understand an important SQL idea: 
-- transforming the value without changing the actual data stored in the table.
-- UPPER() -> UPPER(string) -> It converts letters to uppercase.
-- LOWER() -> LOWER(string) -> It converts letters to lowercase.

-- 1. Write a query that displays: full_name | uppercase_name | lowercase_name for every employee.
SELECT 
	full_name,
    UPPER(full_name) AS uppercase_name,
    LOWER(full_name) AS lowercase_name
FROM string_practice;

-- 2. Write a query to find the employee whose name is RAVI KUMAR, regardless of how the name is stored in terms of uppercase/lowercase.
SELECT *
FROM string_practice
WHERE LOWER(full_name) = 'ravi kumar';
 
SELECT *
FROM string_practice
WHERE UPPER(city) = 'HYDERABAD';


# TRIM() : Trim will remove the spaces before and after of a string (Removes leading and trailing spaces)
SELECT TRIM('   Hello   ');

SELECT TRIM('   Hello World   ');

-- LTRIM() : Removes spaces from the left/beginning:
SELECT LTRIM('   Hello   ');

-- RTRIM() : Removes spaces from the right/end:
SELECT RTRIM('   Hello   ');

-- TRIM() can do more than just remove spaces. It can remove a specific character from the beginning/end.
SELECT TRIM('x' FROM 'xxxHelloxxx');

SELECT 
    LENGTH('   SQL   ') AS original_length,
    LENGTH(TRIM('   SQL   ')) AS trimmed_length;
    

# LEFT(): It returns the specified number of characters from the beginning (left side) of the string. -> LEFT(string, number_of_characters)
SELECT LEFT('Ravi Kumar', 4);

# RIGHT() : It is just opposit to left -> RIGHT(string, number_of_characters)
SELECT RIGHT('Ravi Kumar', 5);

SELECT 
    full_name,
    LEFT(full_name, 4) AS first_four,
    RIGHT(full_name, 4) AS last_four
FROM string_practice;

-- Find employees whose name starts with R.
SELECT *
FROM string_practice
WHERE LEFT(full_name, 1) = 'R';

-- Find employees whose email ends with gmail.com
SELECT *
FROM string_practice
WHERE RIGHT(email, 9) = 'gmail.com';

SELECT * 
FROM string_practice
WHERE email LIKE '%gmail.com';

-- Write a query to display: full_name | first_3_chars | last_3_chars for every employee.
SELECT 
	full_name,
    LEFT(full_name, 3) AS first_3_chars,
    RIGHT(full_name, 3) AS last_3_chars
FROM string_practice;

-- Find all employees whose name starts with A. Don't use LIKE. Use LEFT().
SELECT *
FROM string_practice
WHERE LEFT(full_name, 1) = 'A';

SELECT *
FROM string_practice
WHERE full_name LIKE 'A%';

-- Find all employees whose phone number starts with 987.
SELECT *
FROM string_practice
WHERE LEFT(phone, 3) = '987';

-- Find all employees whose phone number ends with 3249.
SELECT * 
FROM string_practice
WHERE RIGHT(phone, 4) = '3249';


SELECT LEFT('Ravi Kumar', 20);


# SUBSTRING() -> SUBSTRING(string, start_position, length) (SUBSTR() is another name)

-- R a v i   K u m a r
-- 1 2 3 4 5 6 7 8 9 10
SELECT SUBSTRING('Ravi Kumar', 6, 5);
SELECT SUBSTR('Ravi Kumar', 6, 5);

-- extract the first 3 characters from every name
SELECT 
	full_name,
    SUBSTRING(full_name, 1, 3) AS first_3_chars
FROM string_practice;


# LOCATE() -> LOCATE(search_string, original_string) returns the position of the first occurrence.

SELECT LOCATE('.', 'ravi.kumar@gmail.com');
SELECT LOCATE('a', 'Database');

SELECT LOCATE('x', 'Database'); -- -> If does not exist then it will return 0

SELECT
    email,
    LOCATE('@', email) AS at_position
FROM string_practice;

SELECT 
	email,
	SUBSTRING(email, 1, LOCATE('@', email) - 1) AS user_name
FROM string_practice;

-- LOCATE() has another form. You can tell it where to start searching. -> LOCATE(search_string, original_string, start_position)
SELECT LOCATE('.', 'ravi.kumar@gmail.com', 6);
SELECT LOCATE('.', 'ravi.kumar@gmail.com', LOCATE('.', 'ravi.kumar@gmail.com') + 1);


# INSTR(): MySQL also has: INSTR(original_string, search_string)  Notice the argument order is reversed.
SELECT INSTR('ravi.kumar@gmail.com', '.');
SELECT LOCATE('.', 'ravi.kumar@gmail.com');

-- extract the domain from every email.
SELECT 
	email, 
    SUBSTRING(email, LOCATE('@', email) + 1)  AS domain
FROM string_practice;


# REPLACE() : REPLACE() allows us to replace one piece of text with another. -> REPLACE(original_string, search_string, replacement_string)
SELECT REPLACE('Hello World', 'World', 'SQL');

-- Diplay all emails but change the email that are like gmail.com to company.com
SELECT
	email,
    REPLACE(email, 'gmail.com', 'company.com') AS new_mail
FROM string_practice;

-- REPLACE() can replace multiple occurrences
SELECT REPLACE('apple apple apple', 'apple', 'orange');

SELECT REPLACE('987-654-3210', '-', '');

-- Display: full_name | modified_name where the space between first and last name is replaced with _.
SELECT
	full_name,
    REPLACE(full_name, ' ', '_') AS modified_name
FROM string_practice;

-- Display: email | domain where the domain is extracted and converted to uppercase.
SELECT
	email,
    UPPER(SUBSTRING(email, LOCATE('@', email) + 1)) AS domain
FROM string_practice;


# CONCAT() and CONCAT_WS()
-- CONCAT(value1, value2, value3, ...)
SELECT CONCAT('Hello', ' ', 'World');

SELECT
	CONCAT(full_name, ' works in ', department) AS employee_info
FROM string_practice;

-- CONCAT_WS(separator, value1, value2, value3, ...)
SELECT CONCAT_WS(' - ', 'Ravi Kumar', 'IT', 'Hyderabad');

SELECT CONCAT('Hello', NULL, 'World');
SELECT CONCAT_WS(' ', 'Hello', NULL, 'World');


# REVERSE()
SELECT
    full_name,
    REVERSE(full_name) AS reversed_name
FROM string_practice;


# LPAD() and RPAD()
-- LPAD(string, target_length, pad_string)
SELECT LPAD('123', 5, '0');
/*
Original:    123
Target:      5 characters
Need:        2 more
Pad with:    0
Result:      00123
*/

SELECT LPAD('Ravi', 10, '*');

-- RPAD(string, target_length, pad_string)
SELECT RPAD('123', 5, '0');
SELECT RPAD('Ravi', 10, '*');

SELECT
	employee_id,
    LPAD(employee_id, 10, '0') AS formatted_id
FROM string_practice;

SELECT LPAD('123456789', 5, '0');
SELECT RPAD('123456789', 5, '0');

-- Create this output:
/*
000101 - Ravi Kumar
000102 - Anil Sharma
000103 - Priya Reddy
*/
-- for every employee.
SELECT
	CONCAT(LPAD(employee_id, 6, 0) , ' - ', full_name) AS formatted
FROM string_practice;


# ASCII() and CHAR()
-- ASCII(string) -> It returns the numeric ASCII value of the first character.
SELECT ASCII('A');
SELECT ASCII('a');
SELECT ASCII('Apple');

-- CHAR(number) -> converts numeric character codes into characters.
SELECT CHAR(65);

SELECT CHAR(97);
SELECT CAST(CHAR(97) AS CHAR) AS ch;
SELECT CHAR(97 USING utf8mb4) AS cha;

SELECT
	LEFT(full_name, 1) AS first_char,
    ASCII(LEFT(full_name, 1)) AS ascii_value
FROM string_practice;


# STRCMP() : STRCMP() means String Compare. -> STRCMP(string1, string2)
SELECT STRCMP('hello', 'hello');
SELECT STRCMP('hello', 'world');
/*
 0  → strings are equal
-1  → first string is smaller
 1  → first string is greater
*/


# SUBSTRING_INDEX() -> SUBSTRING_INDEX(string, delimiter, count)
SELECT SUBSTRING_INDEX('ravi.kumar@gmail.com', '@', 1); -- Give me everything before the first @.
SELECT SUBSTRING_INDEX('ravi.kumar@gmail.com', '@', -1); -- Give me everything after the first @.

SELECT SUBSTRING_INDEX(email, '@', -1)
FROM string_practice;

SELECT SUBSTRING_INDEX('ravi.kumar@gmail.com', '.', 1);

SELECT SUBSTRING_INDEX('ravi.kumar@gmail.com', '.', 2);

SELECT 
	full_name,
	SUBSTRING_INDEX(full_name, ' ', 1) AS first_name,
    SUBSTRING_INDEX(full_name, ' ', -1) AS last_name
FROM string_practice;


# FIND_IN_SET() : This function is specifically useful when you have a comma-separated list of values inside a string.
/*
FIND_IN_SET(search_value, comma_separated_string)
*/

SELECT FIND_IN_SET('apple', 'apple,orange,banana');
SELECT FIND_IN_SET('app', 'apple,orange,banana');


# FORMAT() : FORMAT() is mainly used when you want to turn a number into a formatted string. -> FORMAT(number, decimal_places)
SELECT FORMAT(1234567.89, 2);
SELECT FORMAT(1234567, 2);
SELECT FORMAT(1234.5678, 2);

SELECT FORMAT(1234567.89, 2) + 100;

SELECT CONCAT('Salary: ₹', FORMAT(1234567.89, 2)) AS salary_display;









SELECT TRIM('x' FROM 'xxxHelloxxx');
SELECT TRIM(LEADING 'x' FROM 'xxxHelloxxx');
SELECT TRIM(TRAILING 'x' FROM 'xxxHelloxxx');
SELECT TRIM(BOTH 'x' FROM 'xxxHelloxxx');

# REGEXP

/*
| Pattern | Meaning              |
| ------- | -------------------- |
| `^`     | beginning            |
| `$`     | end                  |
| `.`     | any single character |
| `[abc]` | a, b, or c           |
| `[0-9]` | any digit            |
| `[A-Z]` | uppercase letter     |
| `[a-z]` | lowercase letter     |
| `*`     | zero or more         |
| `+`     | one or more          |
*/

SELECT *
FROM string_practice
WHERE full_name REGEXP 'Kumar';

SELECT *
FROM string_practice
WHERE full_name REGEXP '^R';

SELECT *
FROM string_practice
WHERE full_name REGEXP 'R$';


# REGEXP_REPLACE() and REGEXP_SUBSTR()
-- REGEXP_REPLACE() lets you replace something matching a pattern. -> REGEXP_REPLACE(string, pattern, replacement)
SELECT REGEXP_REPLACE('Ravi123Kumar456', '[0-9]+', '');

SELECT REGEXP_REPLACE('987-654-3210', '[^0-9]', '');

-- REGEXP_SUBSTR() : instead of replacing matching text, we can extract matching text. -> REGEXP_SUBSTR(string, pattern)
SELECT REGEXP_SUBSTR('Employee ID: 12345', '[0-9]+');

SELECT REGEXP_SUBSTR('abc123xyz456', '[0-9]+');

SELECT *
FROM string_practice
WHERE email REGEXP '@gmail\\.com$';

