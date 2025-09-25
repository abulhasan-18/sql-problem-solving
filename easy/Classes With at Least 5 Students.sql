use leetcode;
-- Drop and recreate the table
DROP TABLE IF EXISTS Courses;

CREATE TABLE IF NOT EXISTS Courses (
  student VARCHAR(255),
  class   VARCHAR(255)
);

-- Reset table
TRUNCATE TABLE Courses;

-- Insert sample data
INSERT INTO Courses (student, class) VALUES
  ('A', 'Math'),
  ('B', 'English'),
  ('C', 'Math'),
  ('D', 'Biology'),
  ('E', 'Math'),
  ('F', 'Computer'),
  ('G', 'Math'),
  ('H', 'Math'),
  ('I', 'Math');


-- Write a solution to find all the classes that have at least five students.
-- Return the result table in any order.


with cte as(
select 
	class,
	count(class) as total_count
from courses
group by class
)
select 
	class
from cte
where total_count > 4;
