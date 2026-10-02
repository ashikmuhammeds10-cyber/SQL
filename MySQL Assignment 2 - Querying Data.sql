DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;
USE employee;


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F'),
    age INT CHECK (age >= 18),
    hire_date DATE ,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

USE employee;

INSERT INTO departments VALUES
(1, 'Finance'),
(2, 'HR'),
(3, 'IT'),
(4, 'Operations');

INSERT INTO location (location) VALUES
('Mumbai'),
('Delhi'),
('Bangalore'),
('Pune');


INSERT INTO employees VALUES
(1, 'Raj Kumar', 'M', 28, '2015-06-15', 'Finance Manager', 1, 1, 65000),
(2, 'Priya Singh', 'F', 26, '2016-08-20', 'Data Analyst', 1, 1, 55000),
(3, 'Amit Patel', 'M', 32, '2014-03-10', 'Senior Developer', 3, 3, 70000),
(4, 'Neha Sharma', 'F', 24, '2018-01-15', 'Junior Analyst', 1, 2, 45000),
(5, 'Vikram Verma', 'M', 29, '2017-05-22', 'HR Specialist', 2, 1, 50000),
(6, 'Anjali Gupta', 'F', 31, '2015-11-08', 'IT Manager', 3, 3, 75000),
(7, 'Suresh Kumar', 'M', 35, '2013-02-14', 'Finance Director', 1, 1, 85000),
(8, 'Divya Nair', 'F', 27, '2018-07-10', 'Business Analyst', 3, 2, 52000),
(9, 'Rohan Singh', 'M', 30, '2016-09-18', NULL, 4, 4, 48000),
(10, 'Meera Iyer', 'F', 25, '2018-04-05', 'Data Analyst', 1, 3, 46000);

USE employee;

SELECT DISTINCT salary
FROM employees;

USE employee;

SELECT 
    age AS Employee_Age,
    salary AS Employee_Salary
FROM employees;

USE employee;
SELECT *
FROM employees
WHERE salary > 50000 AND hire_date < '2016-01-01';

USE employee;
SELECT *
FROM employees
WHERE designation IS NULL;

USE employee;
UPDATE employees
SET designation = 'Data Scientist'
WHERE designation IS NULL
LIMIT 1;

USE employee;
SELECT *
FROM employees
WHERE designation = 'Data Scientist';

USE employee;
SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;

USE employee;
SELECT *
FROM employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;

USE employee;
SELECT SUM(salary) AS Total_Finance_Salary
FROM employees
WHERE department_id = 1;

USE employee;
SELECT MIN(age) AS Youngest_Employee_Age
FROM employees;

USE employee;
SELECT l.location, MAX(e.salary) AS Max_Salary
FROM employees e
JOIN location l ON e.location_id = l.location_id
GROUP BY l.location;

USE employee;
SELECT designation, AVG(salary) AS Average_Salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

USE employee;
SELECT department_id, COUNT(*) AS Employee_Count
FROM employees
GROUP BY department_id
HAVING COUNT(*) < 3;

USE employee;
SELECT l.location, AVG(e.age) AS Average_Age, COUNT(*) AS Female_Count
FROM employees e
JOIN location l ON e.location_id = l.location_id
WHERE e.gender = 'F'
GROUP BY l.location
HAVING AVG(e.age) < 30;


USE employee;
SELECT 
    e.employee_name,
    e.designation,
    d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;


USE employee;
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS Employee_Count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


USE employee;
SELECT 
    l.location,
    e.employee_name
FROM employees e
RIGHT JOIN location l ON e.location_id = l.location_id
ORDER BY l.location;