drop table employee;
-- Create tables
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
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

-- Insert departments
INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

--Write a solution to find employees who have the highest salary in each of the departments.
--Return the result table in any order.



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
where ranked = 1;