drop table employees;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    salary INT
);


drop table Departments;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    emp_id INT -- head of department
);

INSERT INTO Employees (emp_id, name, manager_id, salary) VALUES
(1, 'Alice', NULL, 120000),
(2, 'Bob', 1, 100000),
(3, 'Charlie', 1, 95000),
(4, 'David', 2, 90000),
(5, 'Eve', 2, 87000),
(6, 'Frank', 3, 85000),
(7, 'Grace', 3, 80000);

INSERT INTO Departments (dept_id, dept_name, emp_id) VALUES
(1, 'Engineering', 1),
(2, 'Data Science', 3),
(3, 'Product', 2);


-- Write a solution to find the second highest salary in each department.
-- The result should include the department name, employee ID, employee name, and salary of the employee 
-- with the second highest salary in that department.

with  recursive  hierarchy as (
    select 
        d.dept_id,
        d.dept_name,
        e.emp_id,
        e.name,
        e.salary,
        e.manager_id
    from Departments d
    join Employees e on d.emp_id = e.emp_id
    union all
    select 
        h.dept_id,
        h.dept_name,
        e.emp_id,
        e.name,
        e.salary,
        e.manager_id
    from hierarchy h
    join Employees e on e.manager_id = h.emp_id
),
ranked as (
    -- Rank employees within each department by salary (highest first)
    select
        dept_name,
        emp_id,
        name,
        salary,
        rank() over (partition by dept_id order by salary desc) as rnk
    from hierarchy
)
select 
    dept_name,
    emp_id,
    name,
    salary
from ranked
where rnk = 2;