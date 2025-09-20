-- Create tables

drop table employee;
drop table Department;

CREATE TABLE Employee (
  id INT,
  name VARCHAR(255),
  salary INT,
  departmentId INT
);

CREATE TABLE Department (
  id INT,
  name VARCHAR(255)
);

-- Reset tables
TRUNCATE TABLE Employee;
TRUNCATE TABLE Department;

-- Insert employees
INSERT INTO Employee (id, name, salary, departmentId) VALUES
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);

-- Insert departments
INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');


--A company's executives are interested in seeing who earns the most money in each of the company's departments. 
--A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
--Write a solution to find the employees who are high earners in each of the departments.


with max_salary as(
select 
	d.name as Department ,
	e.name as Employee ,
	e.salary as Salary,
	dense_rank() over(partition by departmentId order by salary desc ) as ranked
from Employee e
inner join Department d on e.departmentId = d.id
)
select
	Department,
	Employee,
	Salary
from max_salary
where ranked in (1,2,3);