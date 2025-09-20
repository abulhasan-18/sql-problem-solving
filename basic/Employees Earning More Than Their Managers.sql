use leetcode;


drop table employee;
-- Create table
CREATE TABLE Employee (
  id INT,
  name VARCHAR(255),
  salary INT,
  managerId INT
);

-- Clear any old data
TRUNCATE TABLE Employee;

-- Insert sample rows
INSERT INTO Employee (id, name, salary, managerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

--Employees Earning More Than Their Managers

select 
	e1.name as Employee
from employee e1
inner join employee e2 on e1.managerId = e2.id
where e1.salary > e2.salary;