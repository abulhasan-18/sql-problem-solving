-- Create tables and insert data Schema 
CREATE TABLE IF NOT EXISTS Person (
  personId INT PRIMARY KEY,
  firstName VARCHAR(255),
  lastName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Address (
  addressId INT PRIMARY KEY,
  personId INT,
  city VARCHAR(255),
  state VARCHAR(255)
);

-- Reset data
TRUNCATE TABLE Person;
TRUNCATE TABLE Address;

-- Insert Person data (batch insert)
INSERT INTO Person (personId, firstName, lastName) VALUES
(1, 'Allen', 'Wang'),
(2, 'Bob', 'Alice');

-- Insert Address data (batch insert)
INSERT INTO Address (addressId, personId, city, state) VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California');

-- Write a solution to report the first name, last name, city, and state of each person in the Person table. 
--If the address of a personId is not present in the Address table, report null instead.

select * 
from person p 
left join address a on p.personId = a.personId;


