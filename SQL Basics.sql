-- Create database
CREATE DATABASE company_db;

-- Select database
USE company_db;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);


INSERT INTO employees
(employee_id, first_name, last_name, department, salary, hire_date)
VALUES
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');


SELECT *
FROM employees
ORDER BY salary ASC;

SELECT *
FROM employees
ORDER BY department ASC, salary DESC;

SELECT *
FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

select * from employees;

######

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);

-- Insert data into sales table
INSERT INTO sales
(sale_id, customer_name, amount, sale_date)
VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');

##quest7.  Display All Sales Records Sorted by Amount (Highest → Lowest)
##  Hint: Use 
##  ORDER BY amount DESC.

SELECT *
FROM sales
ORDER BY amount DESC;

## quest 8. Show All Sales Made by Customer “Aditi”
## Hint: Use 
##  WHERE customer_name = 'Aditi'.

SELECT *
FROM sales
WHERE customer_name = 'Aditi';

### 9. What is the Difference Between a Primary Key and a Foreign Key?

## | Primary Key                                | Foreign Key                                   |
##  | ------------------------------------------ | --------------------------------------------- |
##  | Uniquely identifies each record in a table | Creates a link between two tables             |
##  | Cannot contain `NULL` values               | Can contain `NULL` values (unless restricted) |
##  | Must contain unique values                 | Can have duplicate values                     |
##  | Only one primary key per table             | A table can have multiple foreign keys        |
##  | Used to maintain entity integrity          | Used to maintain referential integrity        |

-- Parent table
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Child table
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

## 10.  What Are Constraints in SQL and Why Are They Used?

## Constraints in SQL are rules applied to table columns to restrict the type of data 
## that can be inserted, updated, or deleted. They help maintain the accuracy,
 ## validity, and integrity of data in a database.

## Why constraints are used:

## * Prevent invalid data entry
## * Maintain data consistency
## * Ensure uniqueness of records
## * Establish relationships between tables
## * Improve data reliability


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(50) UNIQUE,
    City VARCHAR(30) DEFAULT 'Delhi'
);
