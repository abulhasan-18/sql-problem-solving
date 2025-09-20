-- Create the table

drop table Employee;

CREATE TABLE IF NOT EXISTS Employee (
  id INT PRIMARY KEY,
  salary INT
);

-- Reset the data
TRUNCATE TABLE Employee;

-- Insert data (batch insert)
INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);


-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
