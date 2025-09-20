drop table person;
-- Create table
CREATE TABLE Person (
  id INT,
  email VARCHAR(255)
);

-- Reset table
TRUNCATE TABLE Person;

-- Insert rows
INSERT INTO Person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');




-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
-- In will work in postgress sql only


delete from person
where id in(
select 
	p1.id
from person p1
inner join person p2 on p1.email = p2.email and p1.id != p2.id
where p1.id > p2.id);
