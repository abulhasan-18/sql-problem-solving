-- Drop old table if it exists (optional if you always want fresh data)
DROP TABLE IF EXISTS Employee;

-- Create table
CREATE TABLE IF NOT EXISTS Employee (
  Id INT PRIMARY KEY,
  Salary INT
);

-- Reset table
TRUNCATE TABLE Employee;

-- Insert data (batch insert for simplicity)
INSERT INTO Employee (Id, Salary) VALUES
(1, 100),
(2, 200),
(3, 300);


--Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
with cte as (
select 
*,
dense_rank() over(order by salary desc) as rank_salary
from employee
)
select salary as  getNthHighestSalary
from cte 
where rank_salary = n
order by id desc
limit 1
  );
END