drop table person;
-- Create table
CREATE TABLE Person (
  id INT,
  email VARCHAR(255)
);

-- Clear any old data
TRUNCATE TABLE Person;

-- Insert sample rows
INSERT INTO Person (id, email) VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

--Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
--Return the result table in any order.

with count_cte as (
select 
 email,
 count(email) as duplicate_count
from person
group by email
)
select 
	email as Email 
from count_cte
where duplicate_count > 1;

