# MySQL Foundation Notes

## 1. MySQL Data Types

Data types define what kind of value a column can store.

### 1.1 Numeric Data Types

| Data Type | Storage | Signed Range / Description | Common Use |
|---|---:|---|---|
| `TINYINT` | 1 byte | -128 to 127 | Small integers |
| `SMALLINT` | 2 bytes | -32,768 to 32,767 | Small integers |
| `MEDIUMINT` | 3 bytes | -8,388,608 to 8,388,607 | Medium-sized integers |
| `INT` / `INTEGER` | 4 bytes | -2,147,483,648 to 2,147,483,647 | General-purpose integers |
| `BIGINT` | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | Very large integers |
| `DECIMAL(p,s)` | Variable | Exact fixed-point number | Money, salary, prices |
| `FLOAT` | 4 bytes | Approximate floating-point value | Scientific/approximate values |
| `DOUBLE` | 8 bytes | Approximate floating-point value with higher precision | Scientific/approximate values |

> **Note:** Unsigned integer types have a larger positive range because negative values are excluded. For example, `INT UNSIGNED` ranges from `0` to `4,294,967,295`.

#### `DECIMAL(p,s)`

`DECIMAL` is particularly important when exact precision is required.

```sql
DECIMAL(10,2)
```

- `10` = total number of digits
- `2` = number of digits after the decimal point

Example:

```text
99999999.99
```

---

### 1.2 Character / String Data Types

| Data Type | Form | Description | Common Use |
|---|---|---|---|
| `CHAR(n)` | Fixed length | Stores fixed-length strings | Codes, fixed-size values |
| `VARCHAR(n)` | Variable length | Stores variable-length strings | Names, emails, addresses |
| `TINYTEXT` | Variable | Very small text | Small text |
| `TEXT` | Variable | Text up to about 65 KB | Descriptions, comments |
| `MEDIUMTEXT` | Variable | Text up to about 16 MB | Larger text |
| `LONGTEXT` | Variable | Text up to about 4 GB | Very large text |

Example:

```sql
name VARCHAR(50)
```

---

### 1.3 Date and Time Data Types

| Data Type | Example | Description |
|---|---|---|
| `DATE` | `2026-08-26` | Date only |
| `TIME` | `13:45:20` | Time only |
| `DATETIME` | `2026-08-26 13:45:20` | Date + time |
| `TIMESTAMP` | `2026-08-26 13:45:20` | Date + time, with timestamp/time-zone-related behavior |
| `YEAR` | `2026` | Year |

---

### 1.4 Boolean

MySQL supports:

```sql
BOOLEAN
```

It is effectively an alias for `TINYINT(1)`.

Common values:

```text
0 → FALSE
1 → TRUE
```

Example:

```sql
is_active BOOLEAN
```

---

### 1.5 Binary Data Types

| Data Type | Description |
|---|---|
| `BINARY(n)` | Fixed-length binary data |
| `VARBINARY(n)` | Variable-length binary data |
| `BLOB` | Binary Large Object |
| `TINYBLOB` | Small binary object |
| `MEDIUMBLOB` | Medium binary object |
| `LONGBLOB` | Large binary object |

These are used for binary data rather than normal text.

---

### 1.6 JSON

MySQL supports:

```sql
JSON
```

Example:

```sql
details JSON
```

Possible value:

```json
{
    "city": "Vijayawada",
    "age": 21
}
```

JSON will be covered more deeply later.

---

# 2. Creating a Database

## 2.1 Create Database

Syntax:

```sql
CREATE DATABASE database_name;
```

Example:

```sql
CREATE DATABASE college;
```

---

## 2.2 Create Database Only If It Does Not Already Exist

```sql
CREATE DATABASE IF NOT EXISTS college;
```

This prevents an error if the database already exists.

---

# 3. Viewing Databases

## 3.1 Show All Databases

```sql
SHOW DATABASES;
```

This displays all databases available to the current MySQL user.

---

# 4. Selecting a Database

Creating a database does not automatically make it the active database.

Use:

```sql
USE college;
```

After this, table operations will be performed in the `college` database unless another database is selected.

---

# 5. Creating Tables

## 5.1 Basic Syntax

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype
);
```

Example:

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    marks DECIMAL(5,2)
);
```

---

## 5.2 Create Table If It Does Not Exist

```sql
CREATE TABLE IF NOT EXISTS students (
    id INT,
    name VARCHAR(50),
    age INT,
    marks DECIMAL(5,2)
);
```

---

# 6. Viewing Tables

## 6.1 Show Tables in the Current Database

```sql
SHOW TABLES;
```

---

## 6.2 Show the Structure of a Table

Using `DESCRIBE`:

```sql
DESCRIBE students;
```

Short form:

```sql
DESC students;
```

This shows information such as:

- Column name
- Data type
- Whether `NULL` is allowed
- Key information
- Default value
- Extra information

---

# 7. Viewing the Complete CREATE TABLE Statement

Use:

```sql
SHOW CREATE TABLE students;
```

This is useful for seeing how MySQL actually defines the table, including constraints and other table properties.

---

# 8. SQL Comments

Comments are ignored by MySQL and are useful for explaining code.

## 8.1 Single-Line Comment

Using `--`:

```sql
-- This is a single-line comment
SELECT * FROM students;
```

MySQL also supports:

```sql
# This is a MySQL single-line comment
SELECT * FROM students;
```

`#` is MySQL-specific, so `--` is generally better when learning portable SQL.

---

## 8.2 Multi-Line Comment

```sql
/*
   This is a
   multi-line comment.
*/

SELECT * FROM students;
```

---

# 9. SQL Constraints

Constraints are rules applied to columns to control the data that can be stored in a table.

The major constraints are:

| Constraint | Purpose |
|---|---|
| `PRIMARY KEY` | Uniquely identifies each row |
| `NOT NULL` | Prevents `NULL` values |
| `UNIQUE` | Prevents duplicate values |
| `DEFAULT` | Provides a value when one is not supplied |
| `CHECK` | Restricts values according to a condition |
| `FOREIGN KEY` | Creates a relationship between tables |

---

# 10. PRIMARY KEY

A primary key uniquely identifies every row in a table.

Example:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
```

Here:

```text
id → Primary Key
```

A primary key:

- Must be unique
- Cannot contain `NULL`
- A table normally has one primary key constraint
- The primary key can consist of one or multiple columns

---

# 11. NOT NULL

Prevents a column from containing `NULL`.

Example:

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50) NOT NULL,
    age INT
);
```

Here, `name` must have a value.

---

# 12. UNIQUE

Prevents duplicate values.

Example:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(50)
);
```

Two students cannot have the same email value.

---

# 13. DEFAULT

Provides a default value when a value is not explicitly supplied.

Example:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50) DEFAULT 'Vijayawada'
);
```

If no city is provided, MySQL can use:

```text
Vijayawada
```

as the default.

---

# 14. CHECK

Restricts values according to a condition.

Example:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT CHECK (age >= 18)
);
```

This prevents values that violate the condition.

For example:

```text
age = 20  → allowed
age = 18  → allowed
age = 15  → rejected
```

---

# 15. FOREIGN KEY

A foreign key establishes a relationship between two tables.

Example:

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
```

Now create a students table:

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

Here:

```text
departments
    ↓
dept_id  ← referenced column

students
    ↓
dept_id  ← foreign key
```

The `students.dept_id` column refers to `departments.dept_id`.

Foreign keys are one of the most important concepts in relational databases and will be studied in detail later.

---

# 16. AUTO_INCREMENT

`AUTO_INCREMENT` is commonly used with integer primary keys.

Example:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
```

When rows are inserted, MySQL can automatically generate IDs:

```text
1
2
3
4
5
...
```

You do not have to manually provide the ID every time.

---

# 17. Creating Tables with Multiple Constraints

A realistic table can combine multiple constraints.

Example:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Vijayawada',
    marks DECIMAL(5,2)
);
```

### Column-by-column interpretation

| Column | Definition | Meaning |
|---|---|---|
| `id` | `INT PRIMARY KEY AUTO_INCREMENT` | Unique automatically generated ID |
| `name` | `VARCHAR(50) NOT NULL` | Name is required |
| `email` | `VARCHAR(100) UNIQUE` | No duplicate emails |
| `age` | `INT CHECK (age >= 18)` | Age must be at least 18 |
| `city` | `VARCHAR(50) DEFAULT 'Vijayawada'` | Default city |
| `marks` | `DECIMAL(5,2)` | Exact decimal value |

---

# 18. Another Way to Define Constraints

Constraints can be written directly beside columns:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);
```

Or some constraints can be declared separately:

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),

    PRIMARY KEY (id),
    UNIQUE (email)
);
```

The second form becomes especially useful when dealing with **composite keys** and named constraints.

---

# 19. Complete Foundation Example

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS college;

-- Select database
USE college;

-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Vijayawada',
    marks DECIMAL(5,2),
    dept_id INT,

    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

-- View databases
SHOW DATABASES;

-- View tables
SHOW TABLES;

-- Describe table
DESC students;

-- Show complete CREATE TABLE statement
SHOW CREATE TABLE students;
```

---

# 20. Foundation Cheat Sheet

## Database

```sql
CREATE DATABASE database_name;

CREATE DATABASE IF NOT EXISTS database_name;

SHOW DATABASES;

USE database_name;
```

## Table

```sql
CREATE TABLE table_name (
    column datatype
);

CREATE TABLE IF NOT EXISTS table_name (
    column datatype
);

SHOW TABLES;

DESC table_name;

DESCRIBE table_name;

SHOW CREATE TABLE table_name;
```

## Comments

```sql
-- Single-line comment

# MySQL single-line comment

/*
   Multi-line
   comment
*/
```

## Constraints

```sql
PRIMARY KEY
NOT NULL
UNIQUE
DEFAULT
CHECK
FOREIGN KEY
AUTO_INCREMENT
```

---

# 21. Recommended Learning Order From Here

Now that the foundation is in place, a good progression is:

```text
1. Data Types                         ✓
2. CREATE DATABASE                   ✓
3. CREATE TABLE                      ✓
4. SQL Comments                      ✓
5. Constraints                       ✓
6. INSERT                            ← Next
7. SELECT
8. WHERE
9. Operators
10. ORDER BY
11. LIMIT
12. UPDATE
13. DELETE
14. Aggregate Functions
15. GROUP BY
16. HAVING
17. Joins
18. Subqueries
19. Set Operations
20. Functions
21. Views
22. Indexes
23. Transactions
24. Stored Procedures
25. Triggers
26. CTEs
27. Window Functions
28. Query Optimization
29. Advanced MySQL
```

The next practical step should be **`INSERT INTO`**, where we'll create some tables and actually start putting data into them.
