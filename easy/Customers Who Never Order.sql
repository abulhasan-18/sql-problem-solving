-- Create tables
CREATE TABLE Customers (
  id INT,
  name VARCHAR(255)
);

CREATE TABLE Orders (
  id INT,
  customerId INT
);

-- Reset tables
TRUNCATE TABLE Customers;
TRUNCATE TABLE Orders;

-- Insert customers
INSERT INTO Customers (id, name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Insert orders
INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);


--Write a solution to find all customers who never order anything.
--Return the result table in any order.

select 
	name as Customers 
from customers c
left join  orders o on c.id = o.customerId
 where o.customerId is null;
