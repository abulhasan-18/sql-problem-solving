-- Drop existing table if needed (optional)
DROP TABLE IF EXISTS Scores;

-- Create table
CREATE TABLE IF NOT EXISTS Scores (
  id INT PRIMARY KEY,
  score DECIMAL(3,2)
);

-- Reset data
TRUNCATE TABLE Scores;

-- Insert data (batch insert)
INSERT INTO Scores (id, score) VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);
-- Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:

-- The scores should be ranked from the highest to the lowest.
-- If there is a tie between two scores, both should have the same ranking.
-- After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
-- Return the result table ordered by score in descending order.

select 
score,
dense_rank() over(order by score desc) as rank
from scores;


