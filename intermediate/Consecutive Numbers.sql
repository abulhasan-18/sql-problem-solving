-- Drop old table if needed (optional)
DROP TABLE IF EXISTS Logs;

-- Create table
CREATE TABLE IF NOT EXISTS Logs (
  id INT PRIMARY KEY,
  num INT
);


-- Reset table
TRUNCATE TABLE Logs;

-- Insert data (batch insert)
INSERT INTO Logs (id, num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);

-- Write a solution to find all numbers that appear in three or more consecutive rows in the Logs table. 
--The result should be ordered by the number in ascending order.
-- Return the result table with the following columns:
-- num: a number that appears in three or more consecutive rows
-- streak_length: the length of the longest streak of consecutive appearances of numbers in the Logs table


SELECT DISTINCT l1.num as ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN Logs l3 ON l2.id = l3.id - 1 AND l2.num = l3.num;


WITH cte AS (
  SELECT
    id,
    num,
    ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS rn1,
    ROW_NUMBER() OVER (ORDER BY id) AS rn2
  FROM Logs
)
SELECT num, COUNT(*) AS streak_length
FROM cte
GROUP BY num, (rn2 - rn1)
HAVING COUNT(*) >= 3;  
